from flask import Flask, render_template, request, redirect, url_for, session, flash, make_response
import pymysql.cursors
import json
# from weasyprint import HTML  # (Comment this out if you are switching to xhtml2pdf)
from xhtml2pdf import pisa
import io

app = Flask(__name__)
app.secret_key = 'supersecretkey'  # Change this in production!

# Database config
DB_CONFIG = {
    'host': 'localhost',
    'user': 'northwind_user',
    'password': 'MyStr0ngP@ssw0rd',
    'database': 'OnlineCoursePlatformDB',
    'cursorclass': pymysql.cursors.DictCursor
}

# Helper: fetch all rows from a database view
def get_data(view_name):
    conn = pymysql.connect(**DB_CONFIG)
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {view_name}")
    data = cursor.fetchall()
    cursor.close()
    conn.close()
    return data

# Login Page
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        conn = pymysql.connect(**DB_CONFIG)
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Users WHERE Email = %s AND PasswordHash = %s", (email, password))
        user = cursor.fetchone()
        cursor.close()
        conn.close()

        if user:
            session['user_id'] = user['UserID']
            session['user_name'] = user['FullName']
            flash("Login successful!", "success")
            return redirect(url_for('index'))
        else:
            flash("Invalid email or password.", "danger")

    return render_template('login.html')

# Logout
@app.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out.", "info")
    return redirect(url_for('login'))

# Home page (dashboard)
@app.route('/')
def index():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    return render_template('dashboard.html', user_name=session.get('user_name'))

# Dynamic view route with chart support
@app.route('/view/<view_name>')
def view(view_name):
    if 'user_id' not in session:
        return redirect(url_for('login'))

    try:
        data = get_data(view_name)
        if data:
            columns = list(data[0].keys())
            chart_labels = columns[0]
            chart_values = columns[1]
            labels = [row[chart_labels] for row in data]
            values = [row[chart_values] for row in data]
        else:
            labels = values = []
        return render_template(
            'view.html',
            data=data,
            view_name=view_name,
            labels=json.dumps(labels),
            values=json.dumps(values),
            user_name=session.get('user_name')
        )
    except Exception as e:
        flash(f"Error loading view: {e}", "danger")
        return redirect(url_for('index'))



 
def render_pdf(html_content):
    pdf = io.BytesIO()
    pisa_status = pisa.CreatePDF(io.StringIO(html_content), dest=pdf)
    if pisa_status.err:
        return None
    pdf.seek(0)
    return pdf

@app.route('/pdf/<view_name>')
def generate_pdf(view_name):
    data = get_data(view_name)
    html = render_template('pdf_template.html', data=data, view_name=view_name)
    pdf = render_pdf(html)
    if pdf is None:
        return "Error generating PDF", 500
    response = make_response(pdf.read())
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = f'attachment; filename={view_name}.pdf'
    return response




# Run app
if __name__ == '__main__':
    app.run(debug=True)

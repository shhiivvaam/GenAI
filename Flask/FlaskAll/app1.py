# app1.py

from flask import Flask, render_template, request, redirect, session

app = Flask(__name__)

# Set a secret key for encrypting session data
app.secret_key = "my_secret_key"

# dictionary to store user and password
users = {
    'shivam': '1234',
    'somya': '1234',
    'surbhi': '1234',
    'shachi': '1234',
    'rajesh': '1234',
}

# To render a login form
@app.route('/')
def view_form():
    return render_template('login.html')


# For handling get request form we can get the form input values by using { args } attribute.
# This value after submitting you will see in the urls
# e.g  http://127.0.0.1:5000/handle_get?username=shivam&password=1234
# This exploits our credentials so that's why developers prefer POST request

@app.route('/handle_get', methods=['GET'])
def handle_get():
    if request.method == 'GET':
        username = request.args['username']
        password = request.args['password']
        print(username, password)
        
        if username in users and users[username] == password:
            return f"<h1> Welocome {username}! </h1>"
        else:
            return '<h1> Invalid Credentials!! </h1>'
    else:
        return render_template('login.html')


# For handling post request form we can get the form inputs value by using POST attribute.
# This value after submitting you will never see in the urls
@app.route('/handle_post', methods=['POST'])
def handle_post():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        print(username, password)
        
        if username in users and users[username] == password:
            return f"<h1> Welocome {username}! </h1>"
        else:
            return '<h1> Invalid Credentials!! </h1>'
    else:
        return render_template('login.html')

if __name__  == '__main__':
    app.run()
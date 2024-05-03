from flask import Flask, redirect, url_for, render_template

app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Hello World"

@app.route('/home')
def hello_home():
    return "Hello from Home Page"

@app.route('/<name>')
def user(name):
    return f"Hello {name}!"

@app.route('/home/test')
def test_home():
    # return f"Hello from test Home"
    return redirect(url_for("hello_home"))             # here the { hello_home } is the function name we have created earlier for { /home -> route }, so this is just redirecting us to that url

@app.route('/html')
def html_content():
    return "<h1> Hello!! This is some HTML rendered Code. </h1>"

@app.route('/html/templates')
def render_html_template():
    return render_template('test.html')


if __name__ == '__main__':
    app.run(debug=True)
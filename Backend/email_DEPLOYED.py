import os
import smtplib
from firebase_admin import credentials, firestore, initialize_app

cred = credentials.Certificate('key.json')
initialize_app(cred)

db = firestore.Client()

def send_email(event, context):
    profiles_ref = db.collection('profiles')
    docs = profiles_ref.get()
    for doc in docs:
        profile = doc.to_dict()
        to_email = profile.get('email')
        if to_email is None:
            print(f"Skipping document {doc.id} because email is missing")
            continue
        subject = 'Hello'
        body = 'A post has been made by a user on Twitter for Students, check it out!'
        from_email = 'unicwestafricaadmissions@gmail.com'
        from_password = 'cmbcpzziahcloxng'
        message = f'Subject: {subject}\n\n{body}'
        with smtplib.SMTP_SSL('smtp.gmail.com', 465) as server:
            server.login(from_email, from_password)
            server.sendmail(from_email, to_email, message)

import smtplib

server= smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()

global msgs
msgs= "\nHi There, " \
            "Please fill this form to help us provide you with a better experience with the diagnosis before " \
            "the appointment. Link:- " \
            "https://goo.gl/forms/UWpP8u4qTqzGLRe62 " \
            "" \

def sendMails(mymail, sendtoList, mypasswd):
    server.login(mymail, mypasswd)
    for mail in sendtoList:
        server.sendmail(mymail + '@gmail.com', mail, msg= msgs)



mymail= str(input())
mypasswd= str(input())
sendtoList= list(map(str, input().split()))
sendMails(mymail, sendtoList, mypasswd)
server.close()



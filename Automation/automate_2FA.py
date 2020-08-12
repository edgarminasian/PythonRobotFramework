import requests
import json
import os
import sys
import time

token = ''

class automate_2FA():

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def reservePhone(self,phoneNumber):

        reservePhone = 'https://automfa.spe.sony.com/api/token/reservephn?phoneNumber=' + phoneNumber

        releaseToken = 'https://automfa.spe.sony.com/api/token/releasephn?phoneNumber=' + phoneNumber + '&reservationTimestamp='

        print('phone number:' + phoneNumber)

        reserveResponse = requests.get(reservePhone)

        if reserveResponse.ok:

            try:

                reserveData = json.loads(reserveResponse.content)

                timeStamp = str(reserveData)

                print('Phone Number is reserverd! Time Stamp:' + timeStamp)

                return timeStamp 

            except:

                print('releasing phone number')

                releaseResponse = requests.get(releaseToken+timeStamp)

                releaseData = json.loads(releaseResponse.content)

                print('This phone number has been released')

                print(releaseData)

                return 'None'

        elif str(reserveResponse.status_code) == '404':

            print('Phone number is not found in the Database, try a new one!')

            return 'None'

        else: 

            print('Reservation Failed')

            reserveData = json.loads(reserveResponse.content)

            print(reserveData)

            return 'None'

     

    def getToken_review(self,phoneNumber,timeStamp):

        global token

        getToken = 'https://automfa.spe.sony.com/api/token/reviewtokendata?phoneNumber=' + phoneNumber

        if timeStamp is not 'None':

            time.sleep(5)

            tokenResponse = requests.get(getToken)

            if tokenResponse.ok:

                tokenData = json.loads(tokenResponse.content)

                time.sleep(4)

                newToken = str(tokenData["token"])

                if token != newToken and newToken != 'None':

                    token = newToken

                    print('The Token is Token:' + token)

                    return token 

                else:

                    return 'resend'

            elif str(tokenResponse.status_code) == '403':

                print('The phone number is not reserved')

                return '403'

            elif str(tokenResponse.status_code) == '404' or str(tokenResponse.status_code) == '412' or str(tokenResponse.status_code) == '417' or str(tokenResponse.status_code) == '426':

                print('Token failed to send') 

                return 'resend'

            else:

                print('Something went wrong!?!')

                return 'None'

        else: 

            print('Getting Token failed') 

            return 'None'

      

    def getToken(self,phoneNumber,timeStamp):

        global token

        getToken = 'https://automfa.spe.sony.com/api/token?phoneNumber=' + phoneNumber + '&reserved=true'

        if timeStamp is not 'None':

            time.sleep(1)

            tokenResponse = requests.get(getToken)

            if tokenResponse.ok:

                tokenData = json.loads(tokenResponse.content)

                newToken = str(tokenData)

                return newToken

            elif str(tokenResponse.status_code) == '403':

                print('The phone number is not reserved')

                return '403'

            elif str(tokenResponse.status_code) == '404' or str(tokenResponse.status_code) == '412' or str(tokenResponse.status_code) == '417' or str(tokenResponse.status_code) == '426':

                print('Token failed to send') 

                return 'resend'

            else:

                print('Something went wrong!?!')

                return 'None'

        else: 

            print('Getting Token failed') 

            return 'None'

     

    def releasePhone(self,phoneNumber,timeStamp):   

        releaseToken = 'https://automfa.spe.sony.com/api/token/releasephn?phoneNumber=' + phoneNumber + '&reservationTimestamp='   

        if timeStamp is not 'None':

            print('Releasing Token')

            releaseResponse = requests.get(releaseToken+timeStamp)

            if releaseResponse.ok:

                releaseData = json.loads(releaseResponse.content)

                print('Phone number has been released, here is the response')

                print(releaseData)

            elif str(releaseResponse.status_code) == '404':

                print('This number is not found, please check DB again')

            elif str(releaseResponse.status_code) == '401':

                print('This number has already been released')

            else:

                print('Something went wrong')

        else: 

            print('Phone number was not reserved')	
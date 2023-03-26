/** @jsxImportSource @emotion/react */
import React from 'react'
import {css} from '@emotion/react'
import Styles from './SignIn.module.css'
import Image from '../assets/Google.png'

import firebase from "firebase/compat/app";
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

import { getAuth, getRedirectResult, GoogleAuthProvider } from "firebase/auth";

export default function SignIn(){
    const onClickHandler = () => {
        // googleSigIn();
    }

    return (
        <>
        <div className={Styles.input}>
          <div className={Styles.container}>
          <h2 css={css` margin: 10%; `}>Sign In</h2>
           <label> Email: <input   ></input></label> 
           <label> Password: <input   ></input></label> 
          <button className={Styles.googleSignIn} onClick={onClickHandler}><img css = {css` width: 50px; `}src={Image} alt='google'></img> Continue with Google</button>
        </div>
        </div>
      </>
    )
}

// Import the functions you need from the SDKs you need

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
// const firebaseConfig = {
//     apiKey: "AIzaSyARUE8xQMTatSYqnYPWO5LzI52WzU7wrsw",
//     authDomain: "first-b008e.firebaseapp.com",
//     projectId: "first-b008e",
//     storageBucket: "first-b008e.appspot.com",
//     messagingSenderId: "489317174933",
//     appId: "1:489317174933:web:98b31397c4a4395842959c",
//     measurementId: "G-SSGLSYG1EM"
// };

// // Initialize Firebase
// const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);
// var provider = new firebase.auth.GoogleAuthProvider();


// function googleSigIn() {
//     const auth = getAuth();
//     getRedirectResult(auth)
//         .then((result) => {
//             // This gives you a Google Access Token. You can use it to access Google APIs.
//             const credential = GoogleAuthProvider.credentialFromResult(result);
//             const token = credential.accessToken;

//             // The signed-in user info.
//             const user = result.user;
//             // IdP data available using getAdditionalUserInfo(result)
//             // ...
//         }).catch((error) => {
//             // Handle Errors here.
//             const errorCode = error.code;
//             const errorMessage = error.message;
//             // The email of the user's account used.
//             const email = error.customData.email;
//             // The AuthCredential type that was used.
//             const credential = GoogleAuthProvider.credentialFromError(error);
//             // ...
//         });
// }
// function googleSignout() {
//     firebase.auth().signOut()

//         .then(function () {
//             console.log('Signout Succesfull')
//         }, function (error) {
//             console.log('Signout Failed')
//         });
// }
/** @jsxImportSource @emotion/react */
import React from 'react'
import Styles from './Header.module.css'
import {css} from '@emotion/react'
import Profile from '../assets/profile.png'
export default function Header() {
  return (
    <nav className={Styles.nav}>
          <button className={Styles.button}>Study<span css={css` 
           color: #4EF4A6`}>G</span>enie</button>
          <div className={Styles.center}>Brain fuel goes here ⌨️🧠💡</div>
          <button className={Styles.button}><img css = {css` width: 2em`} src={Profile}  /></button>
        
    </nav>
  )
}

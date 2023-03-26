import { useState } from 'react';

import Header from './component/Header';
import Side from './component/Side';
import Body from './component/Body';
import {css} from '@emotion/react'
import SignIn from './component/SignIn.js';

function App() {  
   
 

  return (
    <div>
     <Header/>
      <Side />
      <Body/>
      {/* <SignIn/> */}
    </div>
  );
}

export default App;

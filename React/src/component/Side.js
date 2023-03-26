/** @jsxImportSource @emotion/react */
import React from "react";
import { css } from "@emotion/react";
import Styles from "./Side.module.css";
import Add from "../assets/add.png";
export default function Side() {
  return (
    <aside className={Styles.side}>
      <button className={Styles.buttonAside}>
        <img
          css={css`
            width: 1.5em;
            margin-right: 10%;
          `}
          src={Add}
          alt="Add button"
        />{" "}
        New session
      </button>
    </aside>
  );
}

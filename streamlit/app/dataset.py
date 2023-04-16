import pandas as pd
import streamlit as st


@st.cache_data
def load_dataset() -> pd.DataFrame:
    df = pd.read_csv("data/train.csv")

    # Ticket, Cabin列を削除
    df = df.drop(columns=["Ticket", "Cabin"])

    # Ageの欠損を平均値の"30"で埋める
    df["Age"] = df["Age"].fillna(30)
    df["Age"] = df["Age"].astype(int)

    # Embarkedの欠損を最頻値の"S"で埋める
    df["Embarked"] = df["Embarked"].fillna("S")

    # Fareの欠損を中央値の"14.4542"で埋める
    df["Fare"] = df["Fare"].fillna(14.4542)

    # インデックスを1から振り直し
    df = df.reset_index(drop=True)
    df.index = df.index + 1

    return df

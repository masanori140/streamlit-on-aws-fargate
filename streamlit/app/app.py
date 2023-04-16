import math

import streamlit as st

from dataset import load_dataset
from sidebar import data_selector, rows_selector

st.set_page_config(layout="wide")
left, center, right = st.columns(3)

with center:
    st.write("Titanic - Machine Learning from Disaster")
    st.write("https://www.kaggle.com/competitions/titanic")

if "page" not in st.session_state:
    st.session_state.page = 1

df = load_dataset()

# サイドバーに検索条件を指定するラジオボタン、スライダー、セレクトボックスを配置
pclass, min_age, max_age, sex, embarked = data_selector()

# サイドバーに表示件数を指定するセレクトボックスを配置
rows_per_page = rows_selector()

if len(df) > 0:
    # Pclass列で検索
    if pclass != "All":
        df = df.query(f"Pclass == {pclass}")

    # Age列で検索
    df = df.query(f"Age >= {min_age} & Age <= {max_age}")

    # Sex列で検索
    if sex != "All":
        df = df.query(f'Sex == "{sex}"')

    # Embarked列で検索
    if embarked != "All":
        df = df.query(f'Embarked == "{embarked}"')

    # ページネーション
    total_pages = math.ceil(len(df) / rows_per_page)

    with left:
        if st.button("<< PREV") and st.session_state.page > 1:
            st.session_state.page -= 1

    with right:
        if st.button("NEXT >>") and st.session_state.page < total_pages:
            st.session_state.page += 1

    with center:
        st.write(f"{st.session_state.page} / {total_pages} ページ (結果 {len(df)} 件)")

    start = (st.session_state.page - 1) * rows_per_page
    end = start + rows_per_page

st.write(
    df.iloc[start:end].to_html(classes="table", escape=False), unsafe_allow_html=True
)

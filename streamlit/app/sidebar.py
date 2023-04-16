import streamlit as st


def data_selector() -> tuple:
    with st.sidebar.expander("検索条件", expanded=True):
        # Pclass列を指定するラジオボタン
        pclass = st.radio(
            "Pclass:", ("All", 1, 2, 3), on_change=reset_session_state_page
        )

        # Age列の検索範囲を指定するスライダー
        min_age, max_age = st.slider(
            "Age:", 0, 80, (0, 80), on_change=reset_session_state_page
        )

        # Sex列を指定するセレクトボックス
        sex = st.selectbox(
            "Sex:", ("All", "male", "female"), on_change=reset_session_state_page
        )

        # Embarked列を指定するセレクトボックス
        embarked = st.selectbox(
            "Embarked:", ("All", "C", "Q", "S"), on_change=reset_session_state_page
        )

    return pclass, min_age, max_age, sex, embarked


def rows_selector() -> int:
    with st.sidebar.expander("表示件数", expanded=True):
        # 検索結果の表示件数を指定するセレクトボックス
        rows_per_page = st.selectbox(
            "表示件数：", (50, 100), on_change=reset_session_state_page
        )

    return rows_per_page


def reset_session_state_page() -> None:
    st.session_state.page = 1

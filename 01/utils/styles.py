import streamlit as st

# Define CSS for light and dark themes
LIGHT_THEME_CSS = """
<style>
body {
    background-color: #f0f2f6;
    color: #333;
}
h1, h2, h3, h4, h5, h6 {
    color: #1a73e8;
}
.stButton>button {
    background-color: #1a73e8;
    color: white;
    border-radius: 5px;
}
.stButton>button:hover {
    background-color: #1557b0;
}
</style>
"""

DARK_THEME_CSS = """
<style>
body {
    background-color: #1e1e1e;
    color: #e0e0e0;
}
h1, h2, h3, h4, h5, h6 {
    color: #90caf9;
}
.stButton>button {
    background-color: #90caf9;
    color: #1e1e1e;
    border-radius: 5px;
}
.stButton>button:hover {
    background-color: #64b5f6;
}
</style>
"""

def load_css():
    if st.session_state.dark_mode:
        st.markdown(DARK_THEME_CSS, unsafe_allow_html=True)
    else:
        st.markdown(LIGHT_THEME_CSS, unsafe_allow_html=True)

# Alias for compatibility
css = load_css
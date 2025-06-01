import streamlit as st
from utils.styles import load_css

# Load CSS
load_css()

# Add subtle art pattern background
st.markdown('<div class="art-pattern"></div>', unsafe_allow_html=True)

# Language translations
translations = {
    "English": {"about": "About"},
    "Hindi": {"about": "के बारे में"},
    "Tamil": {"about": "பற்றி"},
    "Bengali": {"about": "সম্পর্কে"},
    "Telugu": {"about": "గురించి"}
}

# About Page
st.title(translations[st.session_state.language]["about"])
st.markdown("""
This app celebrates India's rich cultural heritage by showcasing traditional art forms, tourist sites, and events across all 29 states. 
Explore the diversity of Indian culture, plan your travels, and engage with interactive features like quizzes and AR visualizations.
""")

# Footer
st.markdown('<div class="footer">🇮🇳 Celebrating India’s Cultural Heritage | Powered by xAI</div>', unsafe_allow_html=True)
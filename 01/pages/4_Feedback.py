import streamlit as st
from utils.db_connect import load_data
from utils.styles import load_css

# Load CSS
load_css()

# Add subtle art pattern background
st.markdown('<div class="art-pattern"></div>', unsafe_allow_html=True)

# Load data
_, _, _, feedback_df = load_data()

# Language translations
translations = {
    "English": {"feedback": "Feedback"},
    "Hindi": {"feedback": "प्रतिक्रिया"},
    "Tamil": {"feedback": "பின்னூட்டம்"},
    "Bengali": {"feedback": "প্রতিক্রিয়া"},
    "Telugu": {"feedback": "స్పందన"}
}

# Feedback Page
st.title(translations[st.session_state.language]["feedback"])

# Display feedback
st.subheader("📝 User Feedback")
if not feedback_df.empty:
    for _, feedback in feedback_df.iterrows():
        st.write(f"**Rating**: {feedback['RATING']}/5")
        st.write(f"**Comments**: {feedback['COMMENTS']}")
        st.write(f"**Date**: {feedback['FEEDBACKDATE']}")
        st.write("---")
else:
    st.info("No feedback available.")

# Footer
st.markdown('<div class="footer">🇮🇳 Celebrating India’s Cultural Heritage | Powered by xAI</div>', unsafe_allow_html=True)
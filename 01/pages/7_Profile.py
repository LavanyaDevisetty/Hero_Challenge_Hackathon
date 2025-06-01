import streamlit as st
from utils.styles import load_css

# Load CSS
load_css()

# Add subtle art pattern background
st.markdown('<div class="art-pattern"></div>', unsafe_allow_html=True)

# Language translations
translations = {
    "English": {"profile": "Profile"},
    "Hindi": {"profile": "प्रोफाइल"},
    "Tamil": {"profile": "சுயவிவரம்"},
    "Bengali": {"profile": "প্রোফাইল"},
    "Telugu": {"profile": "ప్రొఫైల్"}
}

# Profile Page
st.title(translations[st.session_state.language]["profile"])

# User Profile
st.subheader("👤 Your Profile")
name = st.text_input("Name", value=st.session_state.user_profile["name"])
preferences = st.multiselect("Preferences", ["Art", "Tourism", "Events"], default=st.session_state.user_profile["preferences"])
if st.button("Save Profile"):
    st.session_state.user_profile["name"] = name
    st.session_state.user_profile["preferences"] = preferences
    st.success("Profile saved!")

# Display Badges
st.subheader("🏅 Your Badges")
if st.session_state.badges:
    st.write(st.session_state.badges)
else:
    st.write("No badges yet. Explore more to earn badges!")

# Footer
st.markdown('<div class="footer">🇮🇳 Celebrating India’s Cultural Heritage | Powered by xAI</div>', unsafe_allow_html=True)
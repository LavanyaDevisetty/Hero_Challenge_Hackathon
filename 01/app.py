import streamlit as st
from utils.db_connect import load_data
from utils.styles import load_css

# Initialize session state
if 'favorites' not in st.session_state:
    st.session_state.favorites = []
if 'language' not in st.session_state:
    st.session_state.language = "English"
if 'dark_mode' not in st.session_state:
    st.session_state.dark_mode = False
if 'itinerary' not in st.session_state:
    st.session_state.itinerary = []
if 'rsvp' not in st.session_state:
    st.session_state.rsvp = []
if 'quiz_score' not in st.session_state:
    st.session_state.quiz_score = 0
if 'badges' not in st.session_state:
    st.session_state.badges = []
if 'user_profile' not in st.session_state:
    st.session_state.user_profile = {"name": "", "preferences": []}

# Set page config for multi-page app
st.set_page_config(page_title="Indian Arts & Cultural Tourism", layout="wide", initial_sidebar_state="expanded")

# Load CSS with Indian flag colors and arts elements
load_css()

# Add subtle art pattern background
st.markdown('<div class="art-pattern"></div>', unsafe_allow_html=True)

# Load data
artforms_df, sites_df, events_df, feedback_df = load_data()

# Language translations
translations = {
    "English": {"welcome": "Welcome to Indian Arts & Cultural Tourism"},
    "Hindi": {"welcome": "भारतीय कला और सांस्कृतिक पर्यटन में आपका स्वागत है"},
    "Tamil": {"welcome": "இந்திய கலை மற்றும் பண்பாட்டு சுற்றுலாவிற்கு வரவேற்கிறோம்"},
    "Bengali": {"welcome": "ভারতীয় শিল্প ও সাংস্কৃতিক পর্যটনে স্বাগতম"},
    "Telugu": {"welcome": "భారతీయ కళలు & సాంస్కృతిక పర్యాటకానికి స్వాగతం"}
}

# Sidebar settings
st.sidebar.markdown("---")
st.sidebar.subheader("Settings")
st.session_state.language = st.sidebar.selectbox("Language", ["English", "Hindi", "Tamil", "Bengali", "Telugu"], key="language_select")
st.session_state.dark_mode = st.sidebar.checkbox("Dark Mode", value=st.session_state.dark_mode)

# Onboarding tour
if "onboarding" not in st.session_state:
    st.session_state.onboarding = True
    st.balloons()
    st.info("Welcome! Use the sidebar to explore India’s rich arts, tourist sites, events, and more!")

# Sidebar navigation
st.sidebar.markdown("### Navigation")
page = st.sidebar.radio("Go to", ["Home", "Art Forms", "Tourist Sites", "Events", "Feedback", "About", "Dashboard", "Profile"])

# Page routing
if page == "Home":
    # Home Page
    st.title(translations[st.session_state.language]["welcome"])
    st.markdown("🎨 Explore the vibrant tapestry of India's cultural heritage through traditional art forms, tourist sites, and events.")
    # Note: Ensure 'a.png', 'n1.jfif', and 'n2.jfif' exist in the correct directory (E:\Projects\SCRIPTS\).
    # If the files are missing, place them in the directory or update the paths below.
    # st.image(["a.png", "n1.jfif", "n2.jfif"], caption=["Cultural Heritage", "Art Forms", "Tourism"], use_container_width=True)
elif page == "Art Forms":
    from pages import Art_Forms
elif page == "Tourist Sites":
    from pages import Tourist_Sites
elif page == "Events":
    from pages import Events
elif page == "Feedback":
    from pages import Feedback
elif page == "About":
    from pages import About
elif page == "Dashboard":
    from pages import Dashboard
elif page == "Profile":
    from pages import Profile

# Display Favorites
st.sidebar.subheader("⭐ Your Favorites")
if st.session_state.favorites:
    for fav in st.session_state.favorites:
        col1, col2 = st.sidebar.columns([3, 1])
        col1.write(fav)
        if col2.button("Remove", key=f"remove_{fav}"):
            st.session_state.favorites.remove(fav)
            st.experimental_rerun()
else:
    st.sidebar.write("No favorites yet.")

# Footer
st.markdown('<div class="footer">🇮🇳 Celebrating India’s Cultural Heritage | Powered by xAI</div>', unsafe_allow_html=True)
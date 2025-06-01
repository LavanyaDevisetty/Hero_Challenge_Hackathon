import streamlit as st
import plotly.express as px
from utils.db_connect import load_data
from utils.styles import load_css

# Load CSS
load_css()

# Add subtle art pattern background
st.markdown('<div class="art-pattern"></div>', unsafe_allow_html=True)

# Load data
artforms_df, sites_df, events_df, _ = load_data()

# Language translations
translations = {
    "English": {"dashboard": "Dashboard"},
    "Hindi": {"dashboard": "डैशबोर्ड"},
    "Tamil": {"dashboard": "டாஷ்போர்டு"},
    "Bengali": {"dashboard": "ড্যাশবোর্ড"},
    "Telugu": {"dashboard": "డాష్‌బోర్డ్"}
}

# Dashboard Page
st.title(translations[st.session_state.language]["dashboard"])

# Art Forms Distribution
st.subheader("🎨 Art Forms Distribution by State")
if not artforms_df.empty:
    art_dist = artforms_df.groupby('STATE').size().reset_index(name='Count')
    fig = px.bar(art_dist, x='Count', y='STATE', title="Art Forms per State", color='Count', color_continuous_scale='Oranges')
    st.plotly_chart(fig)
else:
    st.info("No art forms data available.")

# Tourist Sites Distribution
st.subheader("🏛️ Tourist Sites Distribution by Type")
if not sites_df.empty:
    site_dist = sites_df.groupby('TYPE').size().reset_index(name='Count')
    fig = px.pie(site_dist, values='Count', names='TYPE', title="Tourist Sites by Type")
    st.plotly_chart(fig)
else:
    st.info("No tourist sites data available.")

# Events Distribution
st.subheader("🎉 Events Distribution by State")
if not events_df.empty:
    event_dist = events_df.groupby('STATE').size().reset_index(name='Count')
    fig = px.bar(event_dist, x='Count', y='STATE', title="Events per State", color='Count', color_continuous_scale='Blues')
    st.plotly_chart(fig)
else:
    st.info("No events data available.")

# Footer
st.markdown('<div class="footer">🇮🇳 Celebrating India’s Cultural Heritage | Powered by xAI</div>', unsafe_allow_html=True)
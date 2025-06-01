import streamlit as st
import plotly.express as px
from datetime import datetime
from utils.db_connect import load_data
from utils.styles import load_css

# Load CSS
load_css()

# Add subtle art pattern background
st.markdown('<div class="art-pattern"></div>', unsafe_allow_html=True)

# Load data
_, sites_df, _, _ = load_data()

# Language translations
translations = {
    "English": {"tourist_sites": "Tourist Sites"},
    "Hindi": {"tourist_sites": "पर्यटक स्थल"},
    "Tamil": {"tourist_sites": "சுற்றுலா தலங்கள்"},
    "Bengali": {"tourist_sites": "পর্যটন স্থান"},
    "Telugu": {"tourist_sites": "పర్యాటక స్థలాలు"}
}

# Tourist Sites Page
st.title(translations[st.session_state.language]["tourist_sites"])

# Filters
col1, col2, col3 = st.columns(3)
with col1:
    state_filter = st.multiselect("Select State(s)", options=sites_df['STATE'].unique() if not sites_df.empty else [], key="state_filter_sites")
with col2:
    type_filter = st.multiselect("Select Type(s)", options=sites_df['TYPE'].unique() if not sites_df.empty else [], key="type_filter")
with col3:
    accessibility_filter = st.multiselect("Accessibility Features", options=sites_df['ACCESSIBILITY'].unique() if not sites_df.empty else [], key="accessibility_filter")

# Filter data
filtered_sites = sites_df.copy()
if state_filter and not filtered_sites.empty:
    filtered_sites = filtered_sites[filtered_sites['STATE'].isin(state_filter)]
if type_filter and not filtered_sites.empty:
    filtered_sites = filtered_sites[filtered_sites['TYPE'].isin(type_filter)]
if accessibility_filter and not filtered_sites.empty:
    filtered_sites = filtered_sites[filtered_sites['ACCESSIBILITY'].isin(accessibility_filter)]

# Interactive Map (Placeholder for coordinates)
if not filtered_sites.empty:
    st.subheader("🗺️ Explore Sites")
    for _, site in filtered_sites.iterrows():
        st.write(f"**{site['SITE_NAME']}** - {site['CITY']}, {site['STATE']}")
else:
    st.info("No sites found for selected filters.")

# Site Details with Additional Features
if not filtered_sites.empty:
    for _, site in filtered_sites.iterrows():
        with st.expander(f"🏛️ {site['SITE_NAME']}"):
            st.image('n1.jfif', width=300, caption=site['SITE_NAME'])  # Placeholder image
            st.write(f"**City**: {site['CITY']}")
            st.write(f"**State**: {site['STATE']}")
            st.write(f"**Type**: {site['TYPE']}")
            st.write(f"**Accessibility**: {site['ACCESSIBILITY']}")
            st.write(f"**Visitor Capacity**: {site['VISITOR_CAPACITY']}")
            if st.button("Add to Itinerary", key=f"site_{site['SITE_NAME']}"):
                st.session_state.itinerary.append({"name": site['SITE_NAME'], "date": "2025-06-01"})
                st.success(f"Added {site['SITE_NAME']} to your itinerary!")
else:
    st.info("No sites available for the selected filters.")

# Itinerary Scheduler
st.subheader("📅 Your Itinerary")
if st.session_state.itinerary:
    for i, item in enumerate(st.session_state.itinerary):
        item['date'] = st.date_input(f"Schedule {item['name']}", value=datetime(2025, 6, 1), key=f"date_{i}")
    if st.button("Export to Calendar"):
        st.write("Placeholder: Export itinerary to Google Calendar.")
    st.write(pd.DataFrame(st.session_state.itinerary))

# Footer
st.markdown('<div class="footer">🇮🇳 Celebrating India’s Cultural Heritage | Powered by xAI</div>', unsafe_allow_html=True)
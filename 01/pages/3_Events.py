import streamlit as st
import pandas as pd
from datetime import datetime
from utils.db_connect import load_data
from utils.styles import load_css

# Load CSS
load_css()

# Add subtle art pattern background
st.markdown('<div class="art-pattern"></div>', unsafe_allow_html=True)

# Load data
_, _, events_df, _ = load_data()

# Language translations
translations = {
    "English": {"events": "Events"},
    "Hindi": {"events": "आयोजन"},
    "Tamil": {"events": "நிகழ்வுகள்"},
    "Bengali": {"events": "ঘটনা"},
    "Telugu": {"events": "ఈవெంట్‌లు"}
}

# Events Page
st.title(translations[st.session_state.language]["events"])

# Filters
col1, col2, col3 = st.columns(3)
with col1:
    state_filter = st.multiselect("Select State(s)", options=sorted(events_df['STATE'].unique() if not events_df.empty else []), key="state_filter_events")
with col2:
    type_filter = st.multiselect("Select Event Type(s)", options=sorted(events_df['EVENT_NAME'].unique() if not events_df.empty else []), key="type_filter_events")
with col3:
    date_filter = st.date_input("Select Date", value=datetime(2025, 6, 1), key="date_filter")

# Filter data
filtered_events = events_df.copy()
if state_filter and not filtered_events.empty:
    filtered_events = filtered_events[filtered_events['STATE'].isin(state_filter)]
if type_filter and not filtered_events.empty:
    filtered_events = filtered_events[filtered_events['EVENT_NAME'].isin(type_filter)]
if date_filter and not filtered_events.empty:
    filtered_events['START_DATE'] = pd.to_datetime(filtered_events['START_DATE'])
    filtered_events['END_DATE'] = pd.to_datetime(filtered_events['END_DATE'])
    date_filter = pd.to_datetime(date_filter)
    filtered_events = filtered_events[
        (filtered_events['START_DATE'] <= date_filter) & (filtered_events['END_DATE'] >= date_filter)
    ]

# Display events
if not filtered_events.empty:
    for _, event in filtered_events.iterrows():
        with st.expander(f"🎉 {event['EVENT_NAME']}"):
            st.write(f"**State**: {event['STATE']}")
            st.write(f"**Location**: {event['SITE_ID']}")
            st.write(f"**Start Date**: {event['START_DATE']}")
            st.write(f"**End Date**: {event['END_DATE']}")
            st.write(f"**Expected Attendance**: {event['EXPECTED_ATTENDANCE']}")
            if st.button("RSVP", key=f"rsvp_{event['EVENT_NAME']}"):
                st.session_state.rsvp.append(event['EVENT_NAME'])
                st.success(f"RSVP'd for {event['EVENT_NAME']}!")
else:
    st.info("No events found for selected filters.")

# Display RSVP list
st.subheader("📋 Your RSVPs")
if st.session_state.rsvp:
    st.write(st.session_state.rsvp)
else:
    st.write("No RSVPs yet.")

# Footer
st.markdown('<div class="footer">🇮🇳 Celebrating India’s Cultural Heritage | Powered by xAI</div>', unsafe_allow_html=True)
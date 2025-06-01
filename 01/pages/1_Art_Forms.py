import streamlit as st
import pandas as pd
import plotly.express as px
from utils.db_connect import load_data
from utils.styles import load_css

# Load CSS
load_css()

# Add subtle art pattern background
st.markdown('<div class="art-pattern"></div>', unsafe_allow_html=True)

# Load data
artforms_df, _, _, _ = load_data()

# Language translations for titles
translations = {
    "English": {"art_forms": "Art Forms"},
    "Hindi": {"art_forms": "कला रूप"},
    "Tamil": {"art_forms": "கலை வடிவங்கள்"},
    "Bengali": {"art_forms": "শিল্প ফর্ম"},
    "Telugu": {"art_forms": "కళా రూపాలు"}
}

# Art Forms Page
st.title(translations[st.session_state.language]["art_forms"])

# Filters
col1, col2, col3, col4 = st.columns(4)
with col1:
    state_filter = st.multiselect("Select State(s)", options=artforms_df['STATE'].unique() if not artforms_df.empty else [], key="state_filter")
with col2:
    status_filter = st.multiselect("Select Status", options=artforms_df['STATUS'].unique() if not artforms_df.empty else [], key="status_filter")
with col3:
    region_filter = st.multiselect("Select Region", options=artforms_df['REGION'].unique() if not artforms_df.empty else [], key="region_filter")
with col4:
    search_term = st.text_input("Search Art Forms", key="search_term")

# Filter data with proper logic
filtered_art = artforms_df.copy()
if state_filter and not filtered_art.empty:
    filtered_art = filtered_art[filtered_art['STATE'].isin(state_filter)]
if status_filter and not filtered_art.empty:
    filtered_art = filtered_art[filtered_art['STATUS'].isin(status_filter)]
if region_filter and not filtered_art.empty:
    filtered_art = filtered_art[filtered_art['REGION'].isin(region_filter)]
if search_term and not filtered_art.empty:
    filtered_art = filtered_art[filtered_art['ART_NAME'].str.contains(search_term, case=False, na=False)]

# Art Form Popularity Index
st.subheader("🎨 Art Form Popularity")
if not filtered_art.empty:
    art_views = filtered_art['ART_NAME'].value_counts().reset_index()
    art_views.columns = ['Art Form', 'Views']
    fig = px.bar(art_views, x='Views', y='Art Form', title="Most Viewed Art Forms", color='Views', color_continuous_scale='Oranges')
    st.plotly_chart(fig)
else:
    st.info("No art forms available for the selected filters.")

# Display art forms with details
if not filtered_art.empty:
    for _, row in filtered_art.iterrows():
        with st.expander(f"🖌️ {row['ART_NAME']} - {row['STATE']}"):
            st.image('a.png', width=300, caption=row['ART_NAME'])  # Placeholder image
            st.write(f"**State**: {row['STATE']}")
            st.write(f"**Region**: {row['REGION']}")
            st.write(f"**Description**: {row['DESCRIPTION']}")
            st.write(f"**Status**: {row['STATUS']}")
            if st.button("Favorite", key=f"art_{row['STATE']}_{row['ART_NAME']}"):
                if row['ART_NAME'] not in st.session_state.favorites:
                    if len(st.session_state.favorites) >= 5 and "Explorer" not in st.session_state.badges:
                        st.session_state.badges.append("Explorer")
                        st.success("Badge Earned: Explorer!")
                    st.session_state.favorites.append(row['ART_NAME'])
                    st.success(f"Added {row['ART_NAME']} to favorites!")
            if st.button("Listen to Description", key=f"audio_{row['STATE']}_{row['ART_NAME']}"):
                st.write("Placeholder: Audio narration of description.")
            if st.button("View in AR", key=f"ar_{row['STATE']}_{row['ART_NAME']}"):
                st.write("Placeholder: AR visualization of this art form.")
            if st.button("Learn More (Tutorial)", key=f"tutorial_{row['STATE']}_{row['ART_NAME']}"):
                st.write("Placeholder: Link to tutorial video for this art form.")
else:
    st.info("No art forms found for selected filters.")

# Footer
st.markdown('<div class="footer">🇮🇳 Celebrating India’s Cultural Heritage | Powered by xAI</div>', unsafe_allow_html=True)
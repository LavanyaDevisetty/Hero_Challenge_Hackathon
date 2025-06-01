import streamlit as st
import pandas as pd
import os
from dotenv import load_dotenv
from snowflake.snowpark import Session

# Load environment variables
load_dotenv()

# Snowflake connection (skipped to avoid errors if not using Snowflake)
def get_snowflake_session():
    return None  # Skip Snowflake connection

# Load data with fallback to CSV
@st.cache_data
def load_data():
    session = get_snowflake_session()
    
    if session:
        try:
            artforms_df = session.table("HERO_CHALLENGE.DIM.T_ART_FORMS").to_pandas()
            sites_df = session.table("HERO_CHALLENGE.DIM.T_TOURIST_SITE").to_pandas()
            events_df = session.table("HERO_CHALLENGE.DIM.T_EVENTS").to_pandas()
            feedback_df = session.table("HERO_CHALLENGE.DIM.T_FEEDBACK").to_pandas()
        except Exception as e:
            st.error(f"Error loading data from Snowflake: {e}")
            # Fallback to CSV files
            try:
                artforms_df = pd.read_csv("data/art_forms.csv")
            except FileNotFoundError:
                st.error("art_forms.csv not found in data/ directory.")
                artforms_df = pd.DataFrame()
            try:
                sites_df = pd.read_csv("data/tourist_sites.csv", dtype={'SITE_ID': str})
            except FileNotFoundError:
                st.error("tourist_sites.csv not found in data/ directory.")
                sites_df = pd.DataFrame()
            try:
                events_df = pd.read_csv("data/events.csv", dtype={'SITE_ID': str})
            except FileNotFoundError:
                st.error("events.csv not found in data/ directory.")
                events_df = pd.DataFrame()
            try:
                feedback_df = pd.read_csv("data/feedback.csv", dtype={'SITE_ID': str})
            except FileNotFoundError:
                st.error("feedback.csv not found in data/ directory.")
                feedback_df = pd.DataFrame()
    else:
        # Load from CSV files if no Snowflake session
        try:
            artforms_df = pd.read_csv("data/art_forms.csv")
        except FileNotFoundError:
            st.error("art_forms.csv not found in data/ directory.")
            artforms_df = pd.DataFrame()
        try:
            sites_df = pd.read_csv("data/tourist_sites.csv", dtype={'SITE_ID': str})
        except FileNotFoundError:
            st.error("tourist_sites.csv not found in data/ directory.")
            sites_df = pd.DataFrame()
        try:
            events_df = pd.read_csv("data/events.csv", dtype={'SITE_ID': str})
        except FileNotFoundError:
            st.error("events.csv not found in data/ directory.")
            events_df = pd.DataFrame()
        try:
            feedback_df = pd.read_csv("data/feedback.csv", dtype={'SITE_ID': str})
        except FileNotFoundError:
            st.error("feedback.csv not found in data/ directory.")
            feedback_df = pd.DataFrame()

    return artforms_df, sites_df, events_df, feedback_df
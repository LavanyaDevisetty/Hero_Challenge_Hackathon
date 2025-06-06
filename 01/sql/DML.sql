-- Clear existing data
DELETE FROM HERO_CHALLENGE.DIM.T_TOURIST_SITE;
DELETE FROM HERO_CHALLENGE.DIM.T_ART_FORMS;
DELETE FROM HERO_CHALLENGE.DIM.T_Tourists;
DELETE FROM HERO_CHALLENGE.DIM.T_Events;
DELETE FROM HERO_CHALLENGE.FACT.T_Economic_Impact;
DELETE FROM HERO_CHALLENGE.DIM.T_Feedback;

-- Tourist Sites (2 per state, total 58 entries)
INSERT INTO HERO_CHALLENGE.DIM.T_TOURIST_SITE VALUES
('S1', 'Tirupati Temple', 'Andhra Pradesh', 'Tirupati', 'Monument', 'Road, Rail', 50000),
('S2', 'Araku Valley', 'Andhra Pradesh', 'Araku', 'Nature Reserve', 'Road', 10000),
('S3', 'Tawang Monastery', 'Arunachal Pradesh', 'Tawang', 'Monument', 'Road', 5000),
('S4', 'Ziro Valley', 'Arunachal Pradesh', 'Ziro', 'Nature Reserve', 'Road', 8000),
('S5', 'Kaziranga National Park', 'Assam', 'Golaghat', 'Nature Reserve', 'Road', 20000),
('S6', 'Kamakhya Temple', 'Assam', 'Guwahati', 'Monument', 'Road, Rail', 15000),
('S7', 'Mahabodhi Temple', 'Bihar', 'Bodh Gaya', 'Monument', 'Road, Rail', 30000),
('S8', 'Nalanda Ruins', 'Bihar', 'Nalanda', 'Monument', 'Road', 10000),
('S9', 'Chitrakote Falls', 'Chhattisgarh', 'Bastar', 'Nature Reserve', 'Road', 12000),
('S10', 'Bhoramdeo Temple', 'Chhattisgarh', 'Kawardha', 'Monument', 'Road', 8000),
('S11', 'Basilica of Bom Jesus', 'Goa', 'Old Goa', 'Monument', 'Road, Rail', 20000),
('S12', 'Dudhsagar Falls', 'Goa', 'Mollem', 'Nature Reserve', 'Road', 15000),
('S13', 'Gir National Park', 'Gujarat', 'Junagadh', 'Nature Reserve', 'Road', 18000),
('S14', 'Rani ki Vav', 'Gujarat', 'Patan', 'Monument', 'Road, Rail', 10000),
('S15', 'Sultanpur Bird Sanctuary', 'Haryana', 'Gurgaon', 'Nature Reserve', 'Road', 8000),
('S16', 'Kurukshetra', 'Haryana', 'Kurukshetra', 'Monument', 'Road, Rail', 15000),
('S17', 'Rohtang Pass', 'Himachal Pradesh', 'Manali', 'Nature Reserve', 'Road', 10000),
('S18', 'Hadimba Temple', 'Himachal Pradesh', 'Manali', 'Monument', 'Road', 12000),
('S19', 'Dassam Falls', 'Jharkhand', 'Ranchi', 'Nature Reserve', 'Road', 7000),
('S20', 'Betla National Park', 'Jharkhand', 'Latehar', 'Nature Reserve', 'Road', 9000),
('S21', 'Hampi Heritage Site', 'Karnataka', 'Hampi', 'Monument', 'Road, Rail', 25000),
('S22', 'Mysore Palace', 'Karnataka', 'Mysore', 'Monument', 'Road, Rail', 30000),
('S23', 'Backwaters of Alleppey', 'Kerala', 'Alleppey', 'Nature Reserve', 'Boat', 20000),
('S24', 'Athirappilly Falls', 'Kerala', 'Thrissur', 'Nature Reserve', 'Road', 15000),
('S25', 'Khajuraho Temples', 'Madhya Pradesh', 'Khajuraho', 'Monument', 'Road, Rail', 20000),
('S26', 'Sanchi Stupa', 'Madhya Pradesh', 'Sanchi', 'Monument', 'Road', 10000),
('S27', 'Ajanta Caves', 'Maharashtra', 'Aurangabad', 'Monument', 'Road, Rail', 15000),
('S28', 'Gateway of India', 'Maharashtra', 'Mumbai', 'Monument', 'Road, Rail', 50000),
('S29', 'Loktak Lake', 'Manipur', 'Moirang', 'Nature Reserve', 'Boat', 8000),
('S30', 'Kangla Fort', 'Manipur', 'Imphal', 'Monument', 'Road', 6000),
('S31', 'Living Root Bridges', 'Meghalaya', 'Cherrapunji', 'Nature Reserve', 'Road', 5000),
('S32', 'Mawlynnong Village', 'Meghalaya', 'Mawlynnong', 'Nature Reserve', 'Road', 4000),
('S33', 'Vangchhia Waterfall', 'Mizoram', 'Champhai', 'Nature Reserve', 'Road', 3000),
('S34', 'Durtlang Hills', 'Mizoram', 'Aizawl', 'Nature Reserve', 'Road', 4000),
('S35', 'Kohima War Cemetery', 'Nagaland', 'Kohima', 'Monument', 'Road', 5000),
('S36', 'Dzukou Valley', 'Nagaland', 'Kohima', 'Nature Reserve', 'Road', 6000),
('S37', 'Jagannath Temple', 'Odisha', 'Puri', 'Monument', 'Road, Rail', 40000),
('S38', 'Konark Sun Temple', 'Odisha', 'Konark', 'Monument', 'Road, Rail', 20000),
('S39', 'Golden Temple', 'Punjab', 'Amritsar', 'Monument', 'Road, Rail', 100000),
('S40', 'Jallianwala Bagh', 'Punjab', 'Amritsar', 'Monument', 'Road', 15000),
('S41', 'Mehrangarh Fort', 'Rajasthan', 'Jodhpur', 'Monument', 'Road', 25000),
('S42', 'Pushkar Fair', 'Rajasthan', 'Pushkar', 'Festival', 'Road', 20000),
('S43', 'Rumtek Monastery', 'Sikkim', 'Gangtok', 'Monument', 'Road', 8000),
('S44', 'Nathula Pass', 'Sikkim', 'Gangtok', 'Nature Reserve', 'Road', 5000),
('S45', 'Meenakshi Temple', 'Tamil Nadu', 'Madurai', 'Monument', 'Road, Rail', 30000),
('S46', 'Ooty Hill Station', 'Tamil Nadu', 'Ooty', 'Nature Reserve', 'Road, Rail', 20000),
('S47', 'Charminar', 'Telangana', 'Hyderabad', 'Monument', 'Road, Rail', 40000),
('S48', 'Golconda Fort', 'Telangana', 'Hyderabad', 'Monument', 'Road', 20000),
('S49', 'Taj Mahal', 'Uttar Pradesh', 'Agra', 'Monument', 'Road, Rail', 50000),
('S50', 'Varanasi Ghats', 'Uttar Pradesh', 'Varanasi', 'Monument', 'Road, Rail', 40000),
('S51', 'Valley of Flowers', 'Uttarakhand', 'Chamoli', 'Nature Reserve', 'Road', 8000),
('S52', 'Haridwar', 'Uttarakhand', 'Haridwar', 'Monument', 'Road, Rail', 30000),
('S53', 'Victoria Memorial', 'West Bengal', 'Kolkata', 'Monument', 'Road, Rail', 30000),
('S54', 'Sundarbans National Park', 'West Bengal', 'Sundarbans', 'Nature Reserve', 'Road, Boat', 15000),
('S55', 'Ujjayanta Palace', 'Tripura', 'Agartala', 'Monument', 'Road', 7000),
('S56', 'Neermahal Palace', 'Tripura', 'Melaghar', 'Monument', 'Road, Boat', 5000),
('S57', 'Bastar Dussehra', 'Chhattisgarh', 'Bastar', 'Festival', 'Road', 20000),
('S58', 'Goa Carnival', 'Goa', 'Panaji', 'Festival', 'Road', 50000);

-- Art Forms (2 per state, total 58 entries)
INSERT INTO HERO_CHALLENGE.DIM.T_ART_FORMS VALUES
('AF1', 'Kalamkari', 'Srikalahasti', 'Hand-painted or block-printed textile art depicting mythological narratives.', 'Active', 'Andhra Pradesh'),
('AF2', 'Kuchipudi Dance Art', 'Vijayawada', 'Paintings inspired by the expressive Kuchipudi dance form.', 'Declining', 'Andhra Pradesh'),
('AF3', 'Thangka Painting', 'Tawang', 'Buddhist scroll paintings with intricate details.', 'Active', 'Arunachal Pradesh'),
('AF4', 'Bamboo Weaving', 'Itanagar', 'Intricate baskets and mats woven by tribal communities.', 'Active', 'Arunachal Pradesh'),
('AF5', 'Assamese Scroll Painting', 'Majuli', 'Depicts mythological themes on long scrolls.', 'Declining', 'Assam'),
('AF6', 'Sitalpati Mat Weaving', 'Goalpara', 'Mats woven from cane splits, known for their cooling effect.', 'Active', 'Assam'),
('AF7', 'Madhubani Painting', 'Mithila', 'Intricate geometric patterns depicting rural life and mythology.', 'Active', 'Bihar'),
('AF8', 'Manjusha Painting', 'Bhagalpur', 'Folk art with snake motifs and vibrant colors.', 'Declining', 'Bihar'),
('AF9', 'Bell Metal Craft', 'Bastar', 'Metal casting for decorative items and idols.', 'Active', 'Chhattisgarh'),
('AF10', 'Bastar Wood Carving', 'Jagdalpur', 'Tribal carvings depicting nature and deities.', 'Active', 'Chhattisgarh'),
('AF11', 'Dekhni Dance Art', 'Panaji', 'Art inspired by the Dekhni folk dance, often depicted in paintings.', 'Active', 'Goa'),
('AF12', 'Kunbi Weaving', 'Margao', 'Traditional handwoven textiles with geometric patterns.', 'Declining', 'Goa'),
('AF13', 'Patola Weaving', 'Patan', 'Double ikat weaving with vibrant patterns.', 'Active', 'Gujarat'),
('AF14', 'Rogan Art', 'Nirona', 'Oil-based fabric painting with intricate designs.', 'Declining', 'Gujarat'),
('AF15', 'Phulkari Embroidery', 'Hisar', 'Floral embroidery on textiles, shared with Punjab.', 'Active', 'Haryana'),
('AF16', 'Saang Folk Art', 'Rohtak', 'Paintings inspired by Saang, a folk theatre form.', 'Declining', 'Haryana'),
('AF17', 'Pahari Painting', 'Kangra', 'Miniature paintings with serene landscapes.', 'Active', 'Himachal Pradesh'),
('AF18', 'Chamba Rumal', 'Chamba', 'Embroidered handkerchiefs with mythological themes.', 'Active', 'Himachal Pradesh'),
('AF19', 'Sohrai Painting', 'Hazaribagh', 'Tribal wall art celebrating harvest.', 'Declining', 'Jharkhand'),
('AF20', 'Jadopatia Painting', 'Dumka', 'Scroll paintings by the Santhal tribe.', 'Declining', 'Jharkhand'),
('AF21', 'Mysore Painting', 'Mysore', 'Intricate paintings with gold leaf work.', 'Active', 'Karnataka'),
('AF22', 'Chittara Art', 'Shivamogga', 'Folk art with geometric patterns for rituals.', 'Active', 'Karnataka'),
('AF23', 'Mural Painting', 'Thrissur', 'Temple wall art with vibrant colors.', 'Active', 'Kerala'),
('AF24', 'Kathakali Mask Making', 'Kochi', 'Wooden masks for Kathakali dance performances.', 'Active', 'Kerala'),
('AF25', 'Gond Art', 'Mandla', 'Tribal art with nature-inspired patterns.', 'Active', 'Madhya Pradesh'),
('AF26', 'Bhil Painting', 'Jhabua', 'Tribal art with dot patterns depicting stories.', 'Active', 'Madhya Pradesh'),
('AF27', 'Warli Painting', 'Palghar', 'Geometric tribal art depicting daily life.', 'Active', 'Maharashtra'),
('AF28', 'Paithani Weaving', 'Aurangabad', 'Silk sarees with intricate gold borders.', 'Active', 'Maharashtra'),
('AF29', 'Manipuri Textile Weaving', 'Imphal', 'Handwoven textiles with cultural motifs.', 'Active', 'Manipur'),
('AF30', 'Kauna Grass Craft', 'Thoubal', 'Mats and baskets woven from kauna grass.', 'Active', 'Manipur'),
('AF31', 'Khasi Bamboo Craft', 'Shillong', 'Intricate bamboo weaving for utility items.', 'Active', 'Meghalaya'),
('AF32', 'Garo Textile Weaving', 'Tura', 'Handwoven textiles with tribal patterns.', 'Active', 'Meghalaya'),
('AF33', 'Mizo Textile Art', 'Aizawl', 'Handwoven shawls with tribal patterns.', 'Active', 'Mizoram'),
('AF34', 'Bamboo Dance Props', 'Lunglei', 'Bamboo props for Cheraw dance performances.', 'Active', 'Mizoram'),
('AF35', 'Naga Wood Carving', 'Kohima', 'Carvings depicting tribal motifs.', 'Active', 'Nagaland'),
('AF36', 'Naga Beadwork', 'Dimapur', 'Intricate bead jewelry with tribal designs.', 'Active', 'Nagaland'),
('AF37', 'Pattachitra', 'Puri', 'Cloth-based scroll painting with mythological themes.', 'Active', 'Odisha'),
('AF38', 'Appliqué Work', 'Pipli', 'Textile art with colorful patchwork for decorations.', 'Active', 'Odisha'),
('AF39', 'Punjabi Kissa Art', 'Amritsar', 'Paintings depicting folk tales.', 'Active', 'Punjab'),
('AF40', 'Phulkari Embroidery', 'Patiala', 'Floral embroidery on textiles.', 'Active', 'Punjab'),
('AF41', 'Phad Painting', 'Bhilwara', 'Traditional scroll painting depicting folk legends.', 'Active', 'Rajasthan'),
('AF42', 'Miniature Painting', 'Jaipur', 'Detailed paintings of Rajput legends.', 'Active', 'Rajasthan'),
('AF43', 'Sikkimese Thangka', 'Gangtok', 'Buddhist art with spiritual themes.', 'Active', 'Sikkim'),
('AF44', 'Handwoven Carpets', 'Namchi', 'Woolen carpets with Buddhist motifs.', 'Active', 'Sikkim'),
('AF45', 'Tanjore Painting', 'Thanjavur', 'Gold foil paintings of deities.', 'Active', 'Tamil Nadu'),
('AF46', 'Kolam', 'Chennai', 'Geometric floor art with rice flour.', 'Active', 'Tamil Nadu'),
('AF47', 'Cheriyal Scroll Painting', 'Warangal', 'Narrative scrolls depicting local stories.', 'Declining', 'Telangana'),
('AF48', 'Nirmal Painting', 'Nirmal', 'Wooden paintings with gold leaf and natural themes.', 'Active', 'Telangana'),
('AF49', 'Mughal Miniature', 'Lucknow', 'Court paintings with Persian influence.', 'Active', 'Uttar Pradesh'),
('AF50', 'Chikankari Embroidery', 'Lucknow', 'Delicate embroidery with Persian influences.', 'Active', 'Uttar Pradesh'),
('AF51', 'Aipan Art', 'Almora', 'Ritualistic floor art with geometric patterns.', 'Active', 'Uttarakhand'),
('AF52', 'Garhwali Painting', 'Pauri', 'Folk paintings depicting Himalayan life.', 'Active', 'Uttarakhand'),
('AF53', 'Patachitra', 'Kolkata', 'Scroll paintings with mythological narratives.', 'Active', 'West Bengal'),
('AF54', 'Kantha Embroidery', 'Bolpur', 'Stitched quilts with narrative designs.', 'Active', 'West Bengal'),
('AF55', 'Tripuri Bamboo Art', 'Agartala', 'Bamboo crafts with tribal designs.', 'Active', 'Tripura'),
('AF56', 'Handwoven Shawls', 'Dharmanagar', 'Textiles with traditional patterns.', 'Active', 'Tripura'),
('AF57', 'Tholu Bommalata', 'Tirupati', 'Shadow puppet theatre using leather puppets.', 'Endangered', 'Andhra Pradesh'),
('AF58', 'Bihu Dance Art', 'Guwahati', 'Art inspired by the Bihu dance form.', 'Active', 'Assam');

-- Events (2 per state, total 58 entries)
INSERT INTO HERO_CHALLENGE.DIM.T_Events VALUES
('E1', 'Sankranti', 'S1', '2025-01-14', '2025-01-16', 100000),
('E2', 'Ugadi', 'S1', '2025-03-30', '2025-03-30', 50000),
('E3', 'Losar', 'S3', '2025-02-28', '2025-03-02', 5000),
('E4', 'Nyokum', 'S4', '2025-02-26', '2025-02-26', 3000),
('E5', 'Bihu', 'S5', '2025-04-14', '2025-04-16', 80000),
('E6', 'Ambubachi Mela', 'S6', '2025-06-22', '2025-06-26', 50000),
('E7', 'Chhath Puja', 'S7', '2025-11-07', '2025-11-10', 100000),
('E8', 'Buddha Purnima', 'S7', '2025-05-12', '2025-05-12', 30000),
('E9', 'Bastar Dussehra', 'S57', '2025-10-02', '2025-10-12', 20000),
('E10', 'Chakradhar Samaroh', 'S9', '2025-09-10', '2025-09-12', 10000),
('E11', 'Goa Carnival', 'S58', '2025-02-15', '2025-02-18', 50000),
('E12', 'Shigmo Festival', 'S11', '2025-03-15', '2025-03-20', 30000),
('E13', 'Navratri', 'S13', '2025-09-23', '2025-10-01', 60000),
('E14', 'Kutch Festival', 'S13', '2025-12-01', '2025-12-15', 40000),
('E15', 'Teej Festival', 'S15', '2025-08-05', '2025-08-07', 15000),
('E16', 'Surajkund Mela', 'S15', '2025-02-01', '2025-02-15', 20000),
('E17', 'Kullu Dussehra', 'S17', '2025-10-02', '2025-10-09', 25000),
('E18', 'Lavi Fair', 'S17', '2025-11-11', '2025-11-14', 10000),
('E19', 'Sarhul', 'S19', '2025-03-21', '2025-03-23', 8000),
('E20', 'Karma Festival', 'S19', '2025-09-01', '2025-09-03', 6000),
('E21', 'Hampi Utsav', 'S21', '2025-02-15', '2025-02-20', 30000),
('E22', 'Dasara Festival', 'S22', '2025-10-02', '2025-10-12', 50000),
('E23', 'Onam', 'S23', '2025-08-30', '2025-09-08', 40000),
('E24', 'Thrissur Pooram', 'S23', '2025-04-15', '2025-04-15', 30000),
('E25', 'Khajuraho Dance Festival', 'S25', '2025-02-20', '2025-02-25', 20000),
('E26', 'Tansen Samaroh', 'S25', '2025-12-15', '2025-12-20', 15000),
('E27', 'Ganesh Chaturthi', 'S28', '2025-08-27', '2025-09-05', 100000),
('E28', 'Pune Festival', 'S27', '2025-09-01', '2025-09-10', 25000),
('E29', 'Yaoshang Festival', 'S29', '2025-03-15', '2025-03-20', 10000),
('E30', 'Ningol Chakouba', 'S29', '2025-11-05', '2025-11-05', 8000),
('E31', 'Shad Suk Mynsiem', 'S31', '2025-04-10', '2025-04-12', 6000),
('E32', 'Wangala Festival', 'S31', '2025-11-08', '2025-11-10', 5000),
('E33', 'Chapchar Kut', 'S33', '2025-03-07', '2025-03-07', 4000),
('E34', 'Mim Kut', 'S33', '2025-09-01', '2025-09-01', 3000),
('E35', 'Hornbill Festival', 'S35', '2025-12-01', '2025-12-10', 20000),
('E36', 'Aoling Festival', 'S35', '2025-04-01', '2025-04-07', 5000),
('E37', 'Rath Yatra', 'S37', '2025-07-07', '2025-07-15', 100000),
('E38', 'Konark Dance Festival', 'S38', '2025-12-05', '2025-12-10', 25000),
('E39', 'Baisakhi', 'S39', '2025-04-14', '2025-04-14', 80000),
('E40', 'Lohri', 'S39', '2025-01-13', '2025-01-13', 40000),
('E41', 'Pushkar Camel Fair', 'S42', '2025-11-01', '2025-11-10', 150000),
('E42', 'Teej Festival', 'S41', '2025-08-05', '2025-08-07', 30000),
('E43', 'Losar Festival', 'S43', '2025-02-28', '2025-03-02', 7000),
('E44', 'Pang Lhabsol', 'S43', '2025-09-01', '2025-09-03', 5000),
('E45', 'Pongal', 'S45', '2025-01-14', '2025-01-17', 60000),
('E46', 'Chithirai Festival', 'S45', '2025-04-14', '2025-04-23', 40000),
('E47', 'Bonalu', 'S47', '2025-07-15', '2025-07-30', 50000),
('E48', 'Bathukamma', 'S47', '2025-09-23', '2025-10-01', 40000),
('E49', 'Taj Mahotsav', 'S49', '2025-02-18', '2025-02-28', 30000),
('E50', 'Ganga Aarti', 'S50', '2025-06-01', '2025-06-01', 20000),
('E51', 'Kumbh Mela', 'S52', '2025-01-14', '2025-02-26', 1000000),
('E52', 'Uttarayani Mela', 'S51', '2025-01-14', '2025-01-14', 15000),
('E53', 'Durga Puja', 'S53', '2025-10-02', '2025-10-06', 100000),
('E54', 'Kalighat Festival', 'S53', '2025-11-01', '2025-11-05', 30000),
('E55', 'Garia Puja', 'S55', '2025-04-15', '2025-04-15', 5000),
('E56', 'Kharchi Puja', 'S55', '2025-07-01', '2025-07-07', 4000),
('E57', 'Rann Utsav', 'S13', '2025-12-01', '2025-12-15', 50000),
('E58', 'Hornbill Festival', 'S35', '2025-12-01', '2025-12-10', 20000);

-- Tourists (Sample data for 5 tourists)
INSERT INTO HERO_CHALLENGE.DIM.T_Tourists VALUES
('T1', 28, 'Female', 'India', '2025-01-15', 1, 'Culture', 1500.00),
('T2', 35, 'Male', 'USA', '2025-02-10', 2, 'Leisure', 2000.00),
('T3', 42, 'Female', 'UK', '2025-01-20', 3, 'Culture', 1000.00),
('T4', 23, 'Male', 'India', '2025-03-05', 4, 'Adventure', 1200.00),
('T5', 30, 'Other', 'Germany', '2025-01-25', 5, 'Culture', 1800.00);

-- Economic Impact (Sample data for 5 sites in 2024)
INSERT INTO HERO_CHALLENGE.FACT.T_Economic_Impact VALUES
('S1', 2024, 5000000.00, 2000000.00, 1500),
('S2', 2024, 3000000.00, 1500000.00, 800),
('S3', 2024, 10000000.00, 5000000.00, 3000),
('S4', 2024, 1000000.00, 700000.00, 400),
('S5', 2024, 4000000.00, 1800000.00, 1200);

-- Feedback (Sample data for 5 feedbacks)
INSERT INTO HERO_CHALLENGE.DIM.T_Feedback VALUES
('F1', 1, 1, 5, 'Breathtaking heritage site, loved the architecture!', '2025-01-16'),
('F2', 2, 2, 4, 'Beautiful temple but needs better signage.', '2025-02-11'),
('F3', 3, 3, 5, 'Amazing festival experience with vibrant culture.', '2025-01-21'),
('F4', 4, 4, 3, 'Good adventure spots but limited facilities.', '2025-03-06'),
('F5', 5, 5, 4, 'Temples are stunning, enjoyed the guided tour.', '2025-01-26');
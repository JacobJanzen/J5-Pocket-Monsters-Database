create table FoughtAt
(
    TID          integer  not null
        references Trainer,
    LocationName char(32) not null
        references Location,
    primary key (TID, LocationName),
    check ("TID" > -1)
);

INSERT INTO FoughtAt (TID, LocationName) VALUES (1, 'Abandoned Ship');
INSERT INTO FoughtAt (TID, LocationName) VALUES (10, 'Ever Grande City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (100, 'Hoenn Route 112');
INSERT INTO FoughtAt (TID, LocationName) VALUES (101, 'Hoenn Route 112');
INSERT INTO FoughtAt (TID, LocationName) VALUES (102, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (103, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (104, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (105, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (106, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (107, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (108, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (109, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (11, 'Ever Grande City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (110, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (111, 'Hoenn Route 113');
INSERT INTO FoughtAt (TID, LocationName) VALUES (112, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (113, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (114, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (115, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (116, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (117, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (118, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (119, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (12, 'Ever Grande City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (120, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (121, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (122, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (123, 'Hoenn Route 114');
INSERT INTO FoughtAt (TID, LocationName) VALUES (124, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (125, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (126, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (127, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (128, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (129, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (13, 'Hoenn Route 102');
INSERT INTO FoughtAt (TID, LocationName) VALUES (130, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (131, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (132, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (133, 'Hoenn Route 115');
INSERT INTO FoughtAt (TID, LocationName) VALUES (134, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (135, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (136, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (137, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (138, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (139, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (14, 'Hoenn Route 102');
INSERT INTO FoughtAt (TID, LocationName) VALUES (140, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (141, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (142, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (143, 'Hoenn Route 116');
INSERT INTO FoughtAt (TID, LocationName) VALUES (144, 'Hoenn Route 117');
INSERT INTO FoughtAt (TID, LocationName) VALUES (145, 'Hoenn Route 117');
INSERT INTO FoughtAt (TID, LocationName) VALUES (146, 'Hoenn Route 117');
INSERT INTO FoughtAt (TID, LocationName) VALUES (147, 'Hoenn Route 117');
INSERT INTO FoughtAt (TID, LocationName) VALUES (148, 'Hoenn Route 117');
INSERT INTO FoughtAt (TID, LocationName) VALUES (149, 'Hoenn Route 117');
INSERT INTO FoughtAt (TID, LocationName) VALUES (15, 'Hoenn Route 102');
INSERT INTO FoughtAt (TID, LocationName) VALUES (150, 'Hoenn Route 117');
INSERT INTO FoughtAt (TID, LocationName) VALUES (151, 'Hoenn Route 117');
INSERT INTO FoughtAt (TID, LocationName) VALUES (152, 'Hoenn Route 117');
INSERT INTO FoughtAt (TID, LocationName) VALUES (153, 'Hoenn Route 118');
INSERT INTO FoughtAt (TID, LocationName) VALUES (154, 'Hoenn Route 118');
INSERT INTO FoughtAt (TID, LocationName) VALUES (155, 'Hoenn Route 118');
INSERT INTO FoughtAt (TID, LocationName) VALUES (156, 'Hoenn Route 118');
INSERT INTO FoughtAt (TID, LocationName) VALUES (157, 'Hoenn Route 118');
INSERT INTO FoughtAt (TID, LocationName) VALUES (158, 'Hoenn Route 118');
INSERT INTO FoughtAt (TID, LocationName) VALUES (159, 'Hoenn Route 118');
INSERT INTO FoughtAt (TID, LocationName) VALUES (16, 'Hoenn Route 102');
INSERT INTO FoughtAt (TID, LocationName) VALUES (160, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (161, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (162, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (163, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (164, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (165, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (166, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (167, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (168, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (169, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (17, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (17, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (17, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (17, 'Lilycove City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (17, 'Rustboro City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (170, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (171, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (172, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (173, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (174, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (175, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (176, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (177, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (178, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (179, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (18, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (18, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (18, 'Hoenn Route 119');
INSERT INTO FoughtAt (TID, LocationName) VALUES (18, 'Lilycove City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (18, 'Rustboro City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (180, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (181, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (182, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (183, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (184, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (185, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (186, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (187, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (188, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (189, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (19, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (190, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (191, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (192, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (193, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (194, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (195, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (196, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (197, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (198, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (199, 'Hoenn Route 121');
INSERT INTO FoughtAt (TID, LocationName) VALUES (2, 'Abandoned Ship');
INSERT INTO FoughtAt (TID, LocationName) VALUES (20, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (200, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (201, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (202, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (203, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (204, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (205, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (206, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (207, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (208, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (209, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (21, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (210, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (211, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (212, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (213, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (214, 'Hoenn Route 123');
INSERT INTO FoughtAt (TID, LocationName) VALUES (215, 'Hoenn Route 124');
INSERT INTO FoughtAt (TID, LocationName) VALUES (216, 'Hoenn Route 124');
INSERT INTO FoughtAt (TID, LocationName) VALUES (217, 'Hoenn Route 124');
INSERT INTO FoughtAt (TID, LocationName) VALUES (218, 'Hoenn Route 124');
INSERT INTO FoughtAt (TID, LocationName) VALUES (219, 'Hoenn Route 124');
INSERT INTO FoughtAt (TID, LocationName) VALUES (22, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (220, 'Hoenn Route 124');
INSERT INTO FoughtAt (TID, LocationName) VALUES (221, 'Hoenn Route 124');
INSERT INTO FoughtAt (TID, LocationName) VALUES (222, 'Hoenn Route 124');
INSERT INTO FoughtAt (TID, LocationName) VALUES (223, 'Hoenn Route 125');
INSERT INTO FoughtAt (TID, LocationName) VALUES (224, 'Hoenn Route 125');
INSERT INTO FoughtAt (TID, LocationName) VALUES (225, 'Hoenn Route 125');
INSERT INTO FoughtAt (TID, LocationName) VALUES (226, 'Hoenn Route 125');
INSERT INTO FoughtAt (TID, LocationName) VALUES (227, 'Hoenn Route 125');
INSERT INTO FoughtAt (TID, LocationName) VALUES (228, 'Hoenn Route 125');
INSERT INTO FoughtAt (TID, LocationName) VALUES (229, 'Hoenn Route 125');
INSERT INTO FoughtAt (TID, LocationName) VALUES (23, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (230, 'Hoenn Route 125');
INSERT INTO FoughtAt (TID, LocationName) VALUES (231, 'Hoenn Route 126');
INSERT INTO FoughtAt (TID, LocationName) VALUES (232, 'Hoenn Route 126');
INSERT INTO FoughtAt (TID, LocationName) VALUES (233, 'Hoenn Route 126');
INSERT INTO FoughtAt (TID, LocationName) VALUES (234, 'Hoenn Route 126');
INSERT INTO FoughtAt (TID, LocationName) VALUES (235, 'Hoenn Route 126');
INSERT INTO FoughtAt (TID, LocationName) VALUES (236, 'Hoenn Route 126');
INSERT INTO FoughtAt (TID, LocationName) VALUES (237, 'Hoenn Route 126');
INSERT INTO FoughtAt (TID, LocationName) VALUES (238, 'Hoenn Route 126');
INSERT INTO FoughtAt (TID, LocationName) VALUES (239, 'Hoenn Route 127');
INSERT INTO FoughtAt (TID, LocationName) VALUES (24, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (240, 'Hoenn Route 127');
INSERT INTO FoughtAt (TID, LocationName) VALUES (241, 'Hoenn Route 127');
INSERT INTO FoughtAt (TID, LocationName) VALUES (242, 'Hoenn Route 127');
INSERT INTO FoughtAt (TID, LocationName) VALUES (243, 'Hoenn Route 127');
INSERT INTO FoughtAt (TID, LocationName) VALUES (244, 'Hoenn Route 127');
INSERT INTO FoughtAt (TID, LocationName) VALUES (245, 'Hoenn Route 127');
INSERT INTO FoughtAt (TID, LocationName) VALUES (246, 'Hoenn Route 127');
INSERT INTO FoughtAt (TID, LocationName) VALUES (247, 'Hoenn Route 128');
INSERT INTO FoughtAt (TID, LocationName) VALUES (248, 'Hoenn Route 128');
INSERT INTO FoughtAt (TID, LocationName) VALUES (249, 'Hoenn Route 128');
INSERT INTO FoughtAt (TID, LocationName) VALUES (25, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (250, 'Hoenn Route 128');
INSERT INTO FoughtAt (TID, LocationName) VALUES (251, 'Hoenn Route 128');
INSERT INTO FoughtAt (TID, LocationName) VALUES (252, 'Hoenn Route 128');
INSERT INTO FoughtAt (TID, LocationName) VALUES (253, 'Hoenn Route 128');
INSERT INTO FoughtAt (TID, LocationName) VALUES (254, 'Hoenn Route 129');
INSERT INTO FoughtAt (TID, LocationName) VALUES (255, 'Hoenn Route 129');
INSERT INTO FoughtAt (TID, LocationName) VALUES (256, 'Hoenn Route 129');
INSERT INTO FoughtAt (TID, LocationName) VALUES (257, 'Hoenn Route 129');
INSERT INTO FoughtAt (TID, LocationName) VALUES (258, 'Hoenn Route 129');
INSERT INTO FoughtAt (TID, LocationName) VALUES (259, 'Hoenn Route 130');
INSERT INTO FoughtAt (TID, LocationName) VALUES (26, 'Hoenn Route 103');
INSERT INTO FoughtAt (TID, LocationName) VALUES (260, 'Hoenn Route 130');
INSERT INTO FoughtAt (TID, LocationName) VALUES (261, 'Hoenn Route 130');
INSERT INTO FoughtAt (TID, LocationName) VALUES (262, 'Hoenn Route 131');
INSERT INTO FoughtAt (TID, LocationName) VALUES (263, 'Hoenn Route 131');
INSERT INTO FoughtAt (TID, LocationName) VALUES (264, 'Hoenn Route 131');
INSERT INTO FoughtAt (TID, LocationName) VALUES (265, 'Hoenn Route 131');
INSERT INTO FoughtAt (TID, LocationName) VALUES (266, 'Hoenn Route 131');
INSERT INTO FoughtAt (TID, LocationName) VALUES (267, 'Hoenn Route 131');
INSERT INTO FoughtAt (TID, LocationName) VALUES (268, 'Hoenn Route 131');
INSERT INTO FoughtAt (TID, LocationName) VALUES (269, 'Hoenn Route 132');
INSERT INTO FoughtAt (TID, LocationName) VALUES (27, 'Hoenn Route 105');
INSERT INTO FoughtAt (TID, LocationName) VALUES (270, 'Hoenn Route 132');
INSERT INTO FoughtAt (TID, LocationName) VALUES (271, 'Hoenn Route 132');
INSERT INTO FoughtAt (TID, LocationName) VALUES (272, 'Hoenn Route 132');
INSERT INTO FoughtAt (TID, LocationName) VALUES (273, 'Hoenn Route 132');
INSERT INTO FoughtAt (TID, LocationName) VALUES (274, 'Hoenn Route 132');
INSERT INTO FoughtAt (TID, LocationName) VALUES (275, 'Hoenn Route 132');
INSERT INTO FoughtAt (TID, LocationName) VALUES (276, 'Hoenn Route 132');
INSERT INTO FoughtAt (TID, LocationName) VALUES (277, 'Hoenn Route 133');
INSERT INTO FoughtAt (TID, LocationName) VALUES (278, 'Hoenn Route 133');
INSERT INTO FoughtAt (TID, LocationName) VALUES (279, 'Hoenn Route 133');
INSERT INTO FoughtAt (TID, LocationName) VALUES (28, 'Hoenn Route 105');
INSERT INTO FoughtAt (TID, LocationName) VALUES (280, 'Hoenn Route 133');
INSERT INTO FoughtAt (TID, LocationName) VALUES (281, 'Hoenn Route 133');
INSERT INTO FoughtAt (TID, LocationName) VALUES (282, 'Hoenn Route 133');
INSERT INTO FoughtAt (TID, LocationName) VALUES (283, 'Hoenn Route 133');
INSERT INTO FoughtAt (TID, LocationName) VALUES (284, 'Hoenn Route 134');
INSERT INTO FoughtAt (TID, LocationName) VALUES (285, 'Hoenn Route 134');
INSERT INTO FoughtAt (TID, LocationName) VALUES (286, 'Hoenn Route 134');
INSERT INTO FoughtAt (TID, LocationName) VALUES (287, 'Hoenn Route 134');
INSERT INTO FoughtAt (TID, LocationName) VALUES (288, 'Hoenn Route 134');
INSERT INTO FoughtAt (TID, LocationName) VALUES (289, 'Hoenn Route 134');
INSERT INTO FoughtAt (TID, LocationName) VALUES (29, 'Hoenn Route 105');
INSERT INTO FoughtAt (TID, LocationName) VALUES (290, 'Hoenn Route 134');
INSERT INTO FoughtAt (TID, LocationName) VALUES (291, 'Hoenn Route 134');
INSERT INTO FoughtAt (TID, LocationName) VALUES (292, 'Hoenn Route 134');
INSERT INTO FoughtAt (TID, LocationName) VALUES (293, 'Jagged Pass');
INSERT INTO FoughtAt (TID, LocationName) VALUES (294, 'Jagged Pass');
INSERT INTO FoughtAt (TID, LocationName) VALUES (294, 'Magma Hideout (Jagged Pass)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (294, 'Mossdeep Space Center');
INSERT INTO FoughtAt (TID, LocationName) VALUES (294, 'Mt. Chimney');
INSERT INTO FoughtAt (TID, LocationName) VALUES (294, 'Rusturf Tunnel');
INSERT INTO FoughtAt (TID, LocationName) VALUES (295, 'Jagged Pass');
INSERT INTO FoughtAt (TID, LocationName) VALUES (296, 'Jagged Pass');
INSERT INTO FoughtAt (TID, LocationName) VALUES (297, 'Jagged Pass');
INSERT INTO FoughtAt (TID, LocationName) VALUES (298, 'Jagged Pass');
INSERT INTO FoughtAt (TID, LocationName) VALUES (299, 'Magma Hideout (Jagged Pass)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (299, 'Mossdeep Space Center');
INSERT INTO FoughtAt (TID, LocationName) VALUES (299, 'Mt. Chimney');
INSERT INTO FoughtAt (TID, LocationName) VALUES (3, 'Abandoned Ship');
INSERT INTO FoughtAt (TID, LocationName) VALUES (30, 'Hoenn Route 105');
INSERT INTO FoughtAt (TID, LocationName) VALUES (300, 'Magma Hideout (Jagged Pass)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (300, 'Mossdeep Space Center');
INSERT INTO FoughtAt (TID, LocationName) VALUES (300, 'Mt. Chimney');
INSERT INTO FoughtAt (TID, LocationName) VALUES (301, 'Mauville City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (301, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (302, 'Meteor Falls');
INSERT INTO FoughtAt (TID, LocationName) VALUES (303, 'Meteor Falls');
INSERT INTO FoughtAt (TID, LocationName) VALUES (304, 'Meteor Falls');
INSERT INTO FoughtAt (TID, LocationName) VALUES (304, 'Mossdeep Space Center');
INSERT INTO FoughtAt (TID, LocationName) VALUES (305, 'Mt. Chimney');
INSERT INTO FoughtAt (TID, LocationName) VALUES (306, 'Mt. Chimney');
INSERT INTO FoughtAt (TID, LocationName) VALUES (307, 'Mt. Chimney');
INSERT INTO FoughtAt (TID, LocationName) VALUES (308, 'Mt. Chimney');
INSERT INTO FoughtAt (TID, LocationName) VALUES (309, 'Mt. Chimney');
INSERT INTO FoughtAt (TID, LocationName) VALUES (31, 'Hoenn Route 105');
INSERT INTO FoughtAt (TID, LocationName) VALUES (310, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (311, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (312, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (313, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (314, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (315, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (316, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (317, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (318, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (319, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (32, 'Hoenn Route 105');
INSERT INTO FoughtAt (TID, LocationName) VALUES (320, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (321, 'Mt. Pyre');
INSERT INTO FoughtAt (TID, LocationName) VALUES (321, 'Oceanic Museum');
INSERT INTO FoughtAt (TID, LocationName) VALUES (321, 'Petalburg Woods');
INSERT INTO FoughtAt (TID, LocationName) VALUES (321, 'Rusturf Tunnel');
INSERT INTO FoughtAt (TID, LocationName) VALUES (321, 'Seafloor Cavern');
INSERT INTO FoughtAt (TID, LocationName) VALUES (321, 'Team Aqua Hideout');
INSERT INTO FoughtAt (TID, LocationName) VALUES (321, 'Weather Institute');
INSERT INTO FoughtAt (TID, LocationName) VALUES (322, 'Petalburg Woods');
INSERT INTO FoughtAt (TID, LocationName) VALUES (323, 'Petalburg Woods');
INSERT INTO FoughtAt (TID, LocationName) VALUES (326, 'Rusturf Tunnel');
INSERT INTO FoughtAt (TID, LocationName) VALUES (327, 'S.S. Tidal');
INSERT INTO FoughtAt (TID, LocationName) VALUES (328, 'S.S. Tidal');
INSERT INTO FoughtAt (TID, LocationName) VALUES (329, 'S.S. Tidal');
INSERT INTO FoughtAt (TID, LocationName) VALUES (33, 'Hoenn Route 105');
INSERT INTO FoughtAt (TID, LocationName) VALUES (330, 'S.S. Tidal');
INSERT INTO FoughtAt (TID, LocationName) VALUES (331, 'S.S. Tidal');
INSERT INTO FoughtAt (TID, LocationName) VALUES (332, 'S.S. Tidal');
INSERT INTO FoughtAt (TID, LocationName) VALUES (333, 'S.S. Tidal');
INSERT INTO FoughtAt (TID, LocationName) VALUES (334, 'S.S. Tidal');
INSERT INTO FoughtAt (TID, LocationName) VALUES (335, 'Seafloor Cavern');
INSERT INTO FoughtAt (TID, LocationName) VALUES (335, 'Weather Institute');
INSERT INTO FoughtAt (TID, LocationName) VALUES (336, 'Seafloor Cavern');
INSERT INTO FoughtAt (TID, LocationName) VALUES (337, 'Seaside Cycling Road');
INSERT INTO FoughtAt (TID, LocationName) VALUES (338, 'Seaside Cycling Road');
INSERT INTO FoughtAt (TID, LocationName) VALUES (339, 'Seaside Cycling Road');
INSERT INTO FoughtAt (TID, LocationName) VALUES (34, 'Hoenn Route 106');
INSERT INTO FoughtAt (TID, LocationName) VALUES (340, 'Seaside Cycling Road');
INSERT INTO FoughtAt (TID, LocationName) VALUES (341, 'Seaside Cycling Road');
INSERT INTO FoughtAt (TID, LocationName) VALUES (342, 'Seaside Cycling Road');
INSERT INTO FoughtAt (TID, LocationName) VALUES (343, 'Team Aqua Hideout');
INSERT INTO FoughtAt (TID, LocationName) VALUES (344, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (345, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (346, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (347, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (348, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (349, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (35, 'Hoenn Route 106');
INSERT INTO FoughtAt (TID, LocationName) VALUES (350, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (351, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (352, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (353, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (354, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (355, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (356, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (357, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (358, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (359, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (36, 'Hoenn Route 106');
INSERT INTO FoughtAt (TID, LocationName) VALUES (360, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (361, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (362, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (363, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (364, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (365, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (366, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (367, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (368, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (369, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (37, 'Hoenn Route 106');
INSERT INTO FoughtAt (TID, LocationName) VALUES (370, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (371, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (372, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (373, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (374, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (375, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (376, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (377, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (378, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (379, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (38, 'Hoenn Route 107');
INSERT INTO FoughtAt (TID, LocationName) VALUES (380, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (381, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (382, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (383, 'Trainer Hill');
INSERT INTO FoughtAt (TID, LocationName) VALUES (384, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (385, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (386, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (387, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (388, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (389, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (39, 'Hoenn Route 107');
INSERT INTO FoughtAt (TID, LocationName) VALUES (390, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (391, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (392, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (393, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (394, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (395, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (396, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (397, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (398, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (399, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (4, 'Abandoned Ship');
INSERT INTO FoughtAt (TID, LocationName) VALUES (40, 'Hoenn Route 107');
INSERT INTO FoughtAt (TID, LocationName) VALUES (400, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (401, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (402, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (403, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (404, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (405, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (406, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (407, 'Trick House');
INSERT INTO FoughtAt (TID, LocationName) VALUES (408, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (409, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (41, 'Hoenn Route 107');
INSERT INTO FoughtAt (TID, LocationName) VALUES (410, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (411, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (412, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (413, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (414, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (415, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (416, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (417, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (418, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (419, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (42, 'Hoenn Route 107');
INSERT INTO FoughtAt (TID, LocationName) VALUES (420, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (421, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (422, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (423, 'Victory Road (Hoenn)');
INSERT INTO FoughtAt (TID, LocationName) VALUES (424, 'Rustboro City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (425, 'Rustboro City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (426, 'Rustboro City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (427, 'Rustboro City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (428, 'Dewford Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (429, 'Dewford Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (43, 'Hoenn Route 107');
INSERT INTO FoughtAt (TID, LocationName) VALUES (430, 'Dewford Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (431, 'Dewford Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (432, 'Dewford Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (433, 'Dewford Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (434, 'Dewford Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (435, 'Mauville City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (436, 'Mauville City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (437, 'Mauville City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (438, 'Mauville City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (439, 'Mauville City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (44, 'Hoenn Route 108');
INSERT INTO FoughtAt (TID, LocationName) VALUES (440, 'Mauville City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (441, 'Lavaridge Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (442, 'Lavaridge Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (443, 'Lavaridge Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (444, 'Lavaridge Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (445, 'Lavaridge Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (446, 'Lavaridge Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (447, 'Lavaridge Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (448, 'Lavaridge Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (449, 'Lavaridge Town');
INSERT INTO FoughtAt (TID, LocationName) VALUES (45, 'Hoenn Route 108');
INSERT INTO FoughtAt (TID, LocationName) VALUES (450, 'Petalburg City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (451, 'Petalburg City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (452, 'Petalburg City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (453, 'Petalburg City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (454, 'Petalburg City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (455, 'Petalburg City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (456, 'Petalburg City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (457, 'Petalburg City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (458, 'Fortree City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (459, 'Fortree City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (46, 'Hoenn Route 108');
INSERT INTO FoughtAt (TID, LocationName) VALUES (460, 'Fortree City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (461, 'Fortree City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (462, 'Fortree City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (463, 'Fortree City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (464, 'Fortree City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (465, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (466, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (467, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (468, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (469, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (47, 'Hoenn Route 108');
INSERT INTO FoughtAt (TID, LocationName) VALUES (470, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (471, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (472, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (473, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (474, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (475, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (476, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (477, 'Mossdeep City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (478, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (479, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (48, 'Hoenn Route 108');
INSERT INTO FoughtAt (TID, LocationName) VALUES (480, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (481, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (482, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (483, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (484, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (485, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (486, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (487, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (488, 'Sootopolis City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (489, 'Hoenn Route 104');
INSERT INTO FoughtAt (TID, LocationName) VALUES (49, 'Hoenn Route 108');
INSERT INTO FoughtAt (TID, LocationName) VALUES (490, 'Hoenn Route 104');
INSERT INTO FoughtAt (TID, LocationName) VALUES (491, 'Hoenn Route 104');
INSERT INTO FoughtAt (TID, LocationName) VALUES (492, 'Hoenn Route 104');
INSERT INTO FoughtAt (TID, LocationName) VALUES (493, 'Hoenn Route 104');
INSERT INTO FoughtAt (TID, LocationName) VALUES (494, 'Hoenn Route 104');
INSERT INTO FoughtAt (TID, LocationName) VALUES (495, 'Hoenn Route 104');
INSERT INTO FoughtAt (TID, LocationName) VALUES (5, 'Abandoned Ship');
INSERT INTO FoughtAt (TID, LocationName) VALUES (50, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (51, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (52, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (53, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (54, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (55, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (56, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (57, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (58, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (59, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (6, 'Abandoned Ship');
INSERT INTO FoughtAt (TID, LocationName) VALUES (60, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (61, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (62, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (63, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (64, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (65, 'Hoenn Route 109');
INSERT INTO FoughtAt (TID, LocationName) VALUES (66, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (67, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (68, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (69, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (7, 'Abandoned Ship');
INSERT INTO FoughtAt (TID, LocationName) VALUES (70, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (71, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (72, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (73, 'Hoenn Route 110');
INSERT INTO FoughtAt (TID, LocationName) VALUES (74, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (75, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (76, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (77, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (78, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (79, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (8, 'Ever Grande City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (80, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (81, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (82, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (82, 'Hoenn Route 118');
INSERT INTO FoughtAt (TID, LocationName) VALUES (82, 'Hoenn Route 120');
INSERT INTO FoughtAt (TID, LocationName) VALUES (83, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (84, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (85, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (86, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (87, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (88, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (89, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (9, 'Ever Grande City');
INSERT INTO FoughtAt (TID, LocationName) VALUES (90, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (91, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (92, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (93, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (94, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (95, 'Hoenn Route 111');
INSERT INTO FoughtAt (TID, LocationName) VALUES (96, 'Hoenn Route 112');
INSERT INTO FoughtAt (TID, LocationName) VALUES (97, 'Hoenn Route 112');
INSERT INTO FoughtAt (TID, LocationName) VALUES (98, 'Hoenn Route 112');
INSERT INTO FoughtAt (TID, LocationName) VALUES (99, 'Hoenn Route 112');
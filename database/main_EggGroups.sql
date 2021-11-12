create table EggGroups
(
    Dex       integer  not null
        references Pokemon
            on delete cascade,
    GroupName char(16) not null,
    primary key (Dex, GroupName),
    check ("Dex" > 0)
);

INSERT INTO EggGroups (Dex, GroupName) VALUES (1, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (1, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (10, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (100, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (101, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (102, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (103, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (104, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (105, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (106, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (107, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (108, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (109, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (11, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (110, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (111, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (111, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (112, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (112, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (113, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (114, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (115, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (116, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (116, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (117, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (117, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (118, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (119, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (12, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (120, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (121, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (122, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (123, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (124, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (125, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (126, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (127, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (128, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (129, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (129, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (13, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (130, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (130, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (131, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (131, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (132, 'Ditto');
INSERT INTO EggGroups (Dex, GroupName) VALUES (133, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (134, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (135, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (136, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (137, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (138, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (138, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (139, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (139, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (14, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (140, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (140, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (141, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (141, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (142, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (143, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (144, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (145, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (146, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (147, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (147, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (148, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (148, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (149, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (149, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (15, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (150, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (151, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (152, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (152, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (153, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (153, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (154, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (154, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (155, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (156, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (157, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (158, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (158, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (159, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (159, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (16, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (160, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (160, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (161, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (162, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (163, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (164, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (165, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (166, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (167, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (168, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (169, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (17, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (170, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (171, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (172, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (173, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (174, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (175, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (176, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (176, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (177, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (178, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (179, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (179, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (18, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (180, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (180, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (181, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (181, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (182, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (183, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (183, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (184, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (184, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (185, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (186, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (187, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (187, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (188, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (188, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (189, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (189, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (19, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (190, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (191, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (192, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (193, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (194, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (194, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (195, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (195, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (196, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (197, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (198, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (199, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (199, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (2, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (2, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (20, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (200, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (201, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (202, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (203, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (204, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (205, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (206, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (207, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (208, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (209, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (209, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (21, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (210, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (210, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (211, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (212, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (213, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (214, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (215, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (216, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (217, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (218, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (219, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (22, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (220, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (221, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (222, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (222, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (223, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (223, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (224, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (224, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (225, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (225, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (226, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (227, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (228, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (229, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (23, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (23, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (230, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (230, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (231, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (232, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (233, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (234, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (235, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (236, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (237, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (238, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (239, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (24, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (24, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (240, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (241, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (242, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (243, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (244, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (245, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (246, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (247, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (248, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (249, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (25, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (25, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (250, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (251, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (252, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (252, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (253, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (253, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (254, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (254, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (255, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (256, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (257, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (258, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (258, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (259, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (259, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (26, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (26, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (260, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (260, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (261, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (262, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (263, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (264, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (265, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (266, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (267, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (268, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (269, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (27, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (270, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (270, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (271, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (271, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (272, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (272, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (273, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (273, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (274, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (274, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (275, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (275, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (276, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (277, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (278, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (278, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (279, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (279, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (28, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (280, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (280, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (281, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (281, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (282, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (282, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (283, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (283, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (284, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (284, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (285, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (285, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (286, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (286, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (287, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (288, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (289, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (29, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (29, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (290, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (291, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (292, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (293, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (293, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (294, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (294, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (295, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (295, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (296, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (297, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (298, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (299, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (3, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (3, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (30, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (300, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (300, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (301, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (301, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (302, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (303, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (303, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (304, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (305, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (306, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (307, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (308, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (309, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (31, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (310, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (311, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (312, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (313, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (313, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (314, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (314, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (315, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (315, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (316, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (317, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (318, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (319, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (32, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (32, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (320, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (320, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (321, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (321, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (322, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (323, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (324, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (325, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (326, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (327, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (327, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (328, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (328, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (329, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (329, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (33, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (33, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (330, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (330, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (331, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (331, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (332, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (332, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (333, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (333, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (334, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (334, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (335, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (336, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (336, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (337, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (338, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (339, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (34, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (34, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (340, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (341, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (341, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (342, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (342, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (343, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (344, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (345, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (346, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (347, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (348, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (349, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (349, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (35, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (350, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (350, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (351, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (351, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (352, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (353, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (354, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (355, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (356, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (357, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (357, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (358, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (359, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (36, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (360, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (361, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (361, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (362, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (362, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (363, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (363, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (364, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (364, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (365, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (365, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (366, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (367, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (368, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (369, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (369, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (37, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (370, 'Water 2');
INSERT INTO EggGroups (Dex, GroupName) VALUES (371, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (372, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (373, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (374, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (375, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (376, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (377, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (378, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (379, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (38, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (380, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (381, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (382, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (383, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (384, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (385, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (386, 'Undiscovered');
INSERT INTO EggGroups (Dex, GroupName) VALUES (39, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (4, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (4, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (40, 'Fairy');
INSERT INTO EggGroups (Dex, GroupName) VALUES (41, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (42, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (43, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (44, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (45, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (46, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (46, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (47, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (47, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (48, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (49, 'Bug');
INSERT INTO EggGroups (Dex, GroupName) VALUES (5, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (5, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (50, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (51, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (52, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (53, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (54, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (54, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (55, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (55, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (56, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (57, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (58, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (59, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (6, 'Dragon');
INSERT INTO EggGroups (Dex, GroupName) VALUES (6, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (60, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (61, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (62, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (63, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (64, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (65, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (66, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (67, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (68, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (69, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (7, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (7, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (70, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (71, 'Grass');
INSERT INTO EggGroups (Dex, GroupName) VALUES (72, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (73, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (74, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (75, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (76, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (77, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (78, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (79, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (79, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (8, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (8, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (80, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (80, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (81, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (82, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (83, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (83, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (84, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (85, 'Flying');
INSERT INTO EggGroups (Dex, GroupName) VALUES (86, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (86, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (87, 'Field');
INSERT INTO EggGroups (Dex, GroupName) VALUES (87, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (88, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (89, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (9, 'Monster');
INSERT INTO EggGroups (Dex, GroupName) VALUES (9, 'Water 1');
INSERT INTO EggGroups (Dex, GroupName) VALUES (90, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (91, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (92, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (93, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (94, 'Amorphous');
INSERT INTO EggGroups (Dex, GroupName) VALUES (95, 'Mineral');
INSERT INTO EggGroups (Dex, GroupName) VALUES (96, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (97, 'Human-Like');
INSERT INTO EggGroups (Dex, GroupName) VALUES (98, 'Water 3');
INSERT INTO EggGroups (Dex, GroupName) VALUES (99, 'Water 3');
{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 411.0, 89.0, 1029.0, 753.0 ],
		"bgcolor" : [ 0.945098, 0.933333, 0.882353, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 411.0, 89.0, 1029.0, 753.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numoutlets" : 2,
					"patching_rect" : [ 691.0, 391.0, 79.0, 20.0 ],
					"id" : "obj-11",
					"outlettype" : [ "float", "bang" ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0.",
					"numoutlets" : 1,
					"patching_rect" : [ 691.0, 365.0, 54.0, 18.0 ],
					"id" : "obj-4",
					"outlettype" : [ "float" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.mass",
					"numoutlets" : 2,
					"patching_rect" : [ 691.0, 336.0, 57.0, 18.0 ],
					"id" : "obj-3",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-description[1]",
					"text" : "Convert to greyscale and threshold to obtain a binary image.",
					"linecount" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 491.0, 233.0, 134.0, 44.0 ],
					"id" : "obj-7",
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cvjit_random_bg_colour",
					"hidden" : 1,
					"numoutlets" : 3,
					"patching_rect" : [ 59.0, 508.0, 117.0, 18.0 ],
					"id" : "obj-6",
					"outlettype" : [ "int", "int", "int" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bgcolor",
					"hidden" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 59.0, 532.546204, 165.5, 18.0 ],
					"id" : "obj-10",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "copyright-comment",
					"text" : "Copyright ©2003-2010",
					"numoutlets" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"patching_rect" : [ 50.0, 671.0, 111.0, 18.0 ],
					"id" : "obj-17",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "support-comment",
					"text" : "Support:\nInternational Academy of Media Arts & Sciences (IAMAS) \n– Gifu, Japan",
					"linecount" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 628.5, 243.0, 38.0 ],
					"id" : "obj-18",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "email-comment",
					"text" : "jmp@jmpelletier.com\n",
					"numoutlets" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"patching_rect" : [ 185.0, 606.0, 105.0, 18.0 ],
					"id" : "obj-19",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "me-comment",
					"text" : "By Jean-Marc Pelletier\n",
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 604.0, 135.0, 20.0 ],
					"id" : "obj-22",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-comment",
					"text" : "Output",
					"numoutlets" : 0,
					"patching_rect" : [ 55.5, 238.0, 44.0, 19.0 ],
					"id" : "obj-31",
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "input-comment",
					"text" : "Input",
					"numoutlets" : 0,
					"patching_rect" : [ 60.0, 210.0, 35.0, 19.0 ],
					"id" : "obj-34",
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "input-description",
					"text" : "Any plane, any type",
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 210.0, 175.0, 19.0 ],
					"id" : "obj-37",
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-description",
					"text" : "Float list",
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 238.0, 175.0, 19.0 ],
					"id" : "obj-38",
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "io-cat-panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.556863, 0.556863, 0.556863, 0.2 ],
					"patching_rect" : [ 50.0, 205.0, 55.0, 57.0 ],
					"border" : 1,
					"id" : "obj-39",
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "output-panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.615686, 0.607843, 0.607843, 0.2 ],
					"patching_rect" : [ 50.0, 233.0, 240.0, 29.0 ],
					"border" : 1,
					"id" : "obj-42",
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "input-panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.615686, 0.607843, 0.607843, 0.2 ],
					"patching_rect" : [ 50.0, 205.0, 240.0, 29.0 ],
					"border" : 1,
					"id" : "obj-44",
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "copyright-panel",
					"numoutlets" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.403922 ],
					"patching_rect" : [ 45.0, 599.0, 250.0, 95.0 ],
					"border" : 1,
					"id" : "obj-49",
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.647059 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "comments",
					"text" : "Now works a lot like cv.jit.sum but is provided for backward-compatibility of patches.\n\nThe values of all cells are added together. If the input is char, then the result is divided by 255, so that for binary matrices, the object returns the number of ON pixels.\n",
					"linecount" : 7,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 95.0, 243.0, 95.0 ],
					"id" : "obj-62",
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "comments-panel",
					"numoutlets" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"patching_rect" : [ 45.0, 90.0, 250.0, 105.0 ],
					"border" : 1,
					"id" : "obj-65",
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.517647 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "io-panel",
					"numoutlets" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.403922 ],
					"patching_rect" : [ 45.0, 200.0, 250.0, 67.0 ],
					"border" : 1,
					"id" : "obj-5",
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.517647 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.0, 0.0, 1.0, 0.05098 ],
					"patching_rect" : [ 682.0, 332.0, 78.0, 27.0 ],
					"border" : 1,
					"id" : "obj-9",
					"bordercolor" : [ 0.0, 0.0, 1.0, 0.733333 ],
					"rounded" : 30,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numoutlets" : 2,
					"patching_rect" : [ 411.0, 233.0, 48.0, 18.0 ],
					"id" : "obj-74",
					"outlettype" : [ "float", "bang" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.threshold @mode 1 @radius 20 @threshold 40",
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 282.0, 243.0, 18.0 ],
					"id" : "obj-71",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.fpsgui",
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 603.0, 80.0, 36.0 ],
					"id" : "obj-70",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.rgb2luma",
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 233.0, 62.0, 18.0 ],
					"id" : "obj-69",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.pwindow",
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 350.0, 320.0, 240.0 ],
					"id" : "obj-67",
					"outlettype" : [ "", "" ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"hidden" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 427.0, 130.0, 31.0, 16.0 ],
					"id" : "obj-64",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"hidden" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 633.0, 149.0, 31.0, 16.0 ],
					"id" : "obj-63",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"hidden" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 388.0, 128.0, 32.0, 18.0 ],
					"id" : "obj-61",
					"outlettype" : [ "bang", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Use pre-recorded movie",
					"numoutlets" : 0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 512.0, 102.0, 163.0, 19.0 ],
					"id" : "obj-60",
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Use live camera input",
					"numoutlets" : 0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 350.0, 102.0, 116.0, 19.0 ],
					"id" : "obj-59",
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1 0",
					"hidden" : 1,
					"numoutlets" : 3,
					"patching_rect" : [ 553.0, 128.0, 40.0, 18.0 ],
					"id" : "obj-57",
					"outlettype" : [ "bang", "bang", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numoutlets" : 1,
					"patching_rect" : [ 487.0, 101.0, 20.0, 20.0 ],
					"id" : "obj-51",
					"outlettype" : [ "int" ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "qmetro 2",
					"numoutlets" : 1,
					"patching_rect" : [ 487.0, 128.0, 50.0, 18.0 ],
					"id" : "obj-52",
					"outlettype" : [ "bang" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "stop",
					"numoutlets" : 1,
					"patching_rect" : [ 593.0, 151.0, 29.0, 16.0 ],
					"id" : "obj-53",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "start",
					"numoutlets" : 1,
					"patching_rect" : [ 553.0, 151.0, 30.0, 16.0 ],
					"id" : "obj-54",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "read",
					"numoutlets" : 1,
					"patching_rect" : [ 514.0, 151.0, 31.0, 16.0 ],
					"id" : "obj-55",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.qt.movie 320 240 @unique 1",
					"numoutlets" : 2,
					"patching_rect" : [ 487.0, 178.0, 149.0, 18.0 ],
					"id" : "obj-56",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numoutlets" : 1,
					"patching_rect" : [ 325.0, 101.0, 20.0, 20.0 ],
					"id" : "obj-50",
					"outlettype" : [ "int" ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "qmetro 2",
					"numoutlets" : 1,
					"patching_rect" : [ 325.0, 128.0, 50.0, 18.0 ],
					"id" : "obj-48",
					"outlettype" : [ "bang" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "settings",
					"numoutlets" : 1,
					"patching_rect" : [ 431.0, 151.0, 45.0, 16.0 ],
					"id" : "obj-47",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "close",
					"numoutlets" : 1,
					"patching_rect" : [ 391.0, 151.0, 34.0, 16.0 ],
					"id" : "obj-46",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open",
					"numoutlets" : 1,
					"patching_rect" : [ 352.0, 151.0, 33.0, 16.0 ],
					"id" : "obj-45",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.grab 320 240",
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 178.0, 92.0, 18.0 ],
					"id" : "obj-43",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.2 ],
					"patching_rect" : [ 315.0, 90.0, 366.0, 130.0 ],
					"border" : 1,
					"id" : "obj-58",
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "threshold $1",
					"numoutlets" : 1,
					"patching_rect" : [ 411.0, 255.0, 64.0, 16.0 ],
					"id" : "obj-72",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "fpic",
					"numoutlets" : 0,
					"patching_rect" : [ 769.0, 7.0, 255.0, 72.0 ],
					"pic" : "cvtitle.png",
					"id" : "obj-2",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"patching_rect" : [ 15.0, 45.0, 778.0, 4.0 ],
					"border" : 1,
					"id" : "obj-20",
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.207843 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Calculate the weighted sum of all pixels",
					"numoutlets" : 0,
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"patching_rect" : [ 45.0, 45.0, 441.0, 29.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"fontsize" : 20.0,
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "cv.jit.mass",
					"numoutlets" : 0,
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"patching_rect" : [ 45.0, 15.0, 565.0, 41.0 ],
					"id" : "obj-15",
					"fontname" : "Arial",
					"fontface" : 1,
					"fontsize" : 30.028469,
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.101961 ],
					"patching_rect" : [ 317.0, 342.0, 336.0, 256.0 ],
					"border" : 1,
					"id" : "obj-147",
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"rounded" : 15,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 0.0 ],
					"patching_rect" : [ 317.0, 228.0, 314.0, 79.0 ],
					"border" : 1,
					"id" : "obj-141",
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"rounded" : 15,
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [ 420.5, 277.0, 334.5, 277.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [ 496.5, 205.5, 334.5, 205.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-64", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-61", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 1 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 1,
					"midpoints" : [ 573.0, 149.0, 602.5, 149.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 1,
					"midpoints" : [ 496.5, 124.0, 562.5, 124.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [ 602.5, 173.0, 496.5, 173.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [ 562.5, 173.0, 496.5, 173.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [ 523.5, 173.0, 496.5, 173.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 361.5, 173.0, 334.5, 173.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 400.5, 173.0, 334.5, 173.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 440.5, 173.0, 334.5, 173.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 1 ],
					"destination" : [ "obj-10", 1 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 2 ],
					"destination" : [ "obj-10", 2 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 334.5, 321.0, 700.5, 321.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}

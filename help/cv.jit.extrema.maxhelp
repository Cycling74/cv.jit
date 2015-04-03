{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 2,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 182.0, 79.0, 993.0, 695.0 ],
		"bgcolor" : [ 0.823529, 0.823529, 0.764706, 1.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-1",
					"linecount" : 7,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 699.0, 461.0, 124.0, 77.0 ],
					"style" : "",
					"text" : "By Jean-Marc Pelletier\rjmp@iamas.ac.jp\rChristopher P. Baker bakercp@umn.edu\rMateusz Herczka\rmsz@westerplatte.net\rCopyright ©2005-2008"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"id" : "obj-2",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 692.0, 454.0, 140.0, 111.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-3",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 694.0, 459.0, 142.0, 110.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-4",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 479.0, 96.0, 87.0, 27.0 ],
					"style" : "",
					"text" : "Use geometrical shape",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 410.0, 137.0, 472.0, 305.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 389.0, 90.0, 34.0, 19.0 ],
									"style" : "",
									"text" : "* 12."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 351.0, 90.0, 35.0, 19.0 ],
									"style" : "",
									"text" : "cos 0."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 389.0, 113.0, 34.0, 19.0 ],
									"style" : "",
									"text" : "* 12."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 351.0, 113.0, 34.0, 19.0 ],
									"style" : "",
									"text" : "sin 0."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 4,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 203.0, 114.0, 82.0, 19.0 ],
									"style" : "",
									"text" : "counter 0 0 360"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-6",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 353.0, 154.0, 55.0, 47.0 ],
									"style" : "",
									"text" : "Translate or rotate the test geometry."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-7",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 81.0, 149.0, 16.0, 17.0 ],
									"style" : "",
									"text" : "x",
									"textcolor" : [ 0.058824, 0.007843, 0.007843, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 242.0, 149.0, 39.0, 17.0 ],
									"style" : "",
									"text" : "rotate",
									"textcolor" : [ 0.058824, 0.007843, 0.007843, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 158.0, 149.0, 16.0, 17.0 ],
									"style" : "",
									"text" : "y",
									"textcolor" : [ 0.058824, 0.007843, 0.007843, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"format" : 6,
									"id" : "obj-10",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 203.0, 149.0, 35.0, 19.0 ],
									"style" : "",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"triscale" : 0.9
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-11",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 122.0, 149.0, 35.0, 19.0 ],
									"style" : "",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"triscale" : 0.9
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-12",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 46.0, 149.0, 35.0, 19.0 ],
									"style" : "",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"triscale" : 0.9
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 122.0, 188.0, 62.0, 19.0 ],
									"style" : "",
									"text" : "offset_y $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-14",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 46.0, 188.0, 62.0, 19.0 ],
									"style" : "",
									"text" : "offset_x $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-15",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 203.0, 188.0, 45.0, 19.0 ],
									"style" : "",
									"text" : "theta $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 203.0, 168.0, 135.0, 19.0 ],
									"style" : "",
									"text" : "expr ($f1/360.)*6.283185"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-17",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 18.0, 49.0, 368.0, 19.0 ],
									"style" : "",
									"text" : "clear, color 0, brgb 0 0 0, paintpoly 60 110 30 25 90 20 140 60 60 110, bang"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 18.0, 112.0, 110.0, 19.0 ],
									"style" : "",
									"text" : "jit.lcd 4 char 160 120"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 18.0, 222.0, 245.0, 19.0 ],
									"style" : "",
									"text" : "jit.rota @boundmode 1 @anchor_x 80 @anchor_y 60"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-20",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 18.0, 252.0, 15.0, 15.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-21",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 18.0, 22.0, 15.0, 15.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
									"border" : 1,
									"bordercolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
									"id" : "obj-22",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 38.0, 138.0, 385.0, 78.0 ],
									"proportion" : 0.39,
									"rounded" : 0,
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 131.5, 212.0, 27.5, 212.0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 55.5, 212.0, 27.5, 212.0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 212.5, 212.0, 27.5, 212.0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 27.0, 42.0, 212.5, 42.0 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 398.5, 134.0, 131.5, 134.0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 453.0, 176.0, 84.0, 19.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p test_geometry"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 453.0, 97.0, 15.0, 15.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 453.0, 129.0, 52.0, 19.0 ],
					"style" : "",
					"text" : "qmetro 2"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-8",
					"maxclass" : "number",
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 308.0, 307.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-9",
					"maxclass" : "number",
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 308.0, 357.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 308.0, 381.0, 65.0, 19.0 ],
					"style" : "",
					"text" : "maxlines $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 308.0, 330.0, 65.0, 19.0 ],
					"style" : "",
					"text" : "threshold $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-12",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 216.0, 424.0, 239.0, 37.0 ],
					"style" : "",
					"text" : "Since the output of cv.jit.hough2lines is in the same format as cv.jit.lines, you can use cv.jit.lines.draw for display."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 35.0, 432.0, 85.0, 19.0 ],
					"style" : "",
					"text" : "cv.jit.lines.draw"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 35.0, 350.0, 132.0, 19.0 ],
					"style" : "",
					"text" : "cv.jit.hough2lines 160 120"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-15",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 116.0, 232.0, 147.0, 27.0 ],
					"style" : "",
					"text" : "Find edges and compute Hough space."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 60.0, 477.0, 100.0, 17.0 ],
					"style" : "",
					"text" : "Lines and edges"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "jit.pwindow",
					"name" : "u314003128",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 34.0, 491.0, 160.0, 120.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 35.0, 291.0, 165.0, 19.0 ],
					"style" : "",
					"text" : "cv.jit.hough @rho 5.6 @theta 0.03"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 35.0, 237.0, 66.0, 19.0 ],
					"style" : "",
					"text" : "jit.rgb2luma"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-20",
					"maxclass" : "jit.fpsgui",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 35.0, 622.0, 60.0, 32.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-21",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 276.0, 96.0, 135.0, 17.0 ],
					"style" : "",
					"text" : "Use movie file input",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 55.0, 96.0, 135.0, 17.0 ],
					"style" : "",
					"text" : "Use live camera input",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "jit.pwindow",
					"name" : "u663003134",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 203.0, 490.0, 100.0, 100.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 35.0, 261.0, 138.0, 19.0 ],
					"style" : "",
					"text" : "cv.jit.canny @threshold 150"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 339.0, 148.0, 29.0, 19.0 ],
					"style" : "",
					"text" : "stop"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-26",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 304.0, 148.0, 33.0, 19.0 ],
					"style" : "",
					"text" : "start"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-27",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 272.0, 148.0, 30.0, 19.0 ],
					"style" : "",
					"text" : "read"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 257.0, 97.0, 15.0, 15.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 257.0, 121.0, 46.0, 19.0 ],
					"style" : "",
					"text" : "qmetro 2"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 257.0, 176.0, 133.0, 19.0 ],
					"style" : "",
					"text" : "jit.qt.movie 160 120 @unique 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-32",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 106.0, 147.0, 33.0, 19.0 ],
					"style" : "",
					"text" : "close"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-33",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 74.0, 147.0, 30.0, 19.0 ],
					"style" : "",
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 35.0, 96.0, 15.0, 15.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 35.0, 120.0, 46.0, 19.0 ],
					"style" : "",
					"text" : "qmetro 2"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 35.0, 175.0, 119.0, 19.0 ],
					"style" : "",
					"text" : "jit.grab 160 120 @unique 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 24.0,
					"id" : "obj-37",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 27.0, 22.0, 684.0, 33.0 ],
					"style" : "",
					"text" : "cv.jit.hough2Lines: find lines in Hough space",
					"textcolor" : [ 0.054902, 0.2, 0.270588, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.435294, 0.498039, 0.494118, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-38",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 27.0, 89.0, 214.0, 118.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.435294, 0.498039, 0.494118, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-39",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 244.0, 89.0, 187.0, 118.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.968627, 0.972549, 0.972549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"id" : "obj-40",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 26.0, 417.0, 452.0, 53.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.858824, 0.878431, 0.862745, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-41",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 28.0, 339.0, 154.0, 41.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-42",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 27.0, 51.0, 600.0, 4.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"bordercolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"id" : "obj-43",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 27.0, 50.0, 600.0, 5.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-44",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 29.0, 420.0, 453.0, 54.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-45",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 219.0, 477.0, 64.0, 17.0 ],
					"style" : "",
					"text" : "Hough space"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.968627, 0.972549, 0.972549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"id" : "obj-46",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 23.0, 226.0, 263.0, 91.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-47",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 26.0, 229.0, 264.0, 92.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-48",
					"linecount" : 7,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 381.0, 310.0, 130.0, 77.0 ],
					"style" : "",
					"text" : "There are 2 attributes: \"threshold\" and \"maxlines\" The lower the threshold, the more lines are found. \"Maxlines\" specifies the maximum number of lines to be found."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-49",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 719.0, 383.0, 163.0, 17.0 ],
					"style" : "",
					"text" : "4-plane float32"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-50",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 717.0, 348.0, 163.0, 17.0 ],
					"style" : "",
					"text" : "Single-plane char"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-51",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 671.0, 383.0, 185.0, 17.0 ],
					"style" : "",
					"text" : "Output:",
					"textcolor" : [ 0.968627, 0.968627, 0.968627, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-52",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 671.0, 348.0, 185.0, 17.0 ],
					"style" : "",
					"text" : "Input:",
					"textcolor" : [ 0.968627, 0.968627, 0.968627, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-53",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 667.0, 341.0, 51.0, 37.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"id" : "obj-54",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 667.0, 341.0, 218.0, 36.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-55",
					"linecount" : 17,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 609.0, 94.0, 333.0, 177.0 ],
					"style" : "",
					"text" : "Using the abstraction \"cv.jit.hough2lines\", you can find lines in the Hough space calculated with cv.jit.hough. cv.jit.lines encapsulates similar methods and the output is similar. However, whereas cv.jit.lines outputs line segments, cv.jit.hough2lines only finds whole lines. That is, line segments in the source image are found as lines that extend infinitely. \rWhile cv.jit.lines is more robust and efficient, using cv.jit.hough + cv.jit.hough2lines allows the user to visualize Hough space. (Which is pretty enough in itself.)\r\rThe output is a 4-plane matrix describing the start and end points of line segments:\rPlane 1: always 0\rPlane 2: y-coordinate at x=0\rPlane 3: always equals width of source image\rPlane 4: y-coordinate at x=image width\r\rThe number of cells corresponds to the number of lines found."
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-56",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 667.0, 375.0, 51.0, 37.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"id" : "obj-57",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 667.0, 376.0, 218.0, 36.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-58",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 670.0, 344.0, 218.0, 72.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-59",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 595.0, 88.0, 364.0, 240.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-60",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 599.0, 93.0, 364.0, 240.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-61",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 775.0, 286.0, 4.0, 98.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-62",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 766.0, 286.0, 4.0, 98.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-63",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 757.0, 286.0, 4.0, 98.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.968627, 0.972549, 0.972549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"id" : "obj-64",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 298.0, 297.0, 233.0, 110.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-65",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 301.0, 300.0, 234.0, 111.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.435294, 0.498039, 0.494118, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-66",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 436.0, 89.0, 138.0, 117.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-67",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 92.0, 549.0, 119.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-68",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 569.0, 108.0, 148.0, 4.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-69",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 569.0, 100.0, 148.0, 4.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-70",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 570.0, 92.0, 148.0, 4.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 617.0, 16.0, 255.0, 72.0 ],
					"pic" : "cvtitle.gif"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 184.5, 621.0, 197.5, 621.0, 197.5, 420.0, 110.5, 420.0 ],
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 44.5, 328.0, 212.5, 328.0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 44.5, 282.0, 223.0, 282.0, 223.0, 404.0, 77.5, 404.0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 348.5, 169.0, 266.5, 169.0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 313.5, 169.0, 266.5, 169.0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 281.5, 169.0, 266.5, 169.0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 266.5, 218.0, 44.5, 218.0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 115.5, 168.0, 44.5, 168.0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 83.5, 168.0, 44.5, 168.0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 462.5, 218.0, 44.5, 218.0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "cvtitle.gif",
				"bootpath" : "~/Desktop/cv.jit/help",
				"patcherrelativepath" : ".",
				"type" : "GIFf",
				"implicit" : 1
			}
, 			{
				"name" : "cv.jit.hough2lines.maxpat",
				"bootpath" : "~/Desktop/cv.jit/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "cv.jit.lines.draw.maxpat",
				"bootpath" : "~/Desktop/cv.jit/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "cv.jit.scale_source_&_lcd.maxpat",
				"bootpath" : "~/Desktop/cv.jit/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "cv.jit.canny.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "cv.jit.hough.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "cv.jit.extrema.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}

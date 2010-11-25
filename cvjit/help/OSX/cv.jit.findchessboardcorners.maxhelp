{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 84.0, 48.0, 1033.0, 708.0 ],
		"bgcolor" : [ 0.941176, 0.941176, 0.87451, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 84.0, 48.0, 1033.0, 708.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
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
					"maxclass" : "comment",
					"varname" : "output-description[2]",
					"text" : "Finding chessboard corners could be very slow.",
					"linecount" : 2,
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 675.0, 585.0, 180.0, 32.0 ],
					"id" : "obj-13",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 1.0, 0.0, 0.0, 0.647059 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.396078 ],
					"numoutlets" : 0,
					"patching_rect" : [ 667.0, 577.0, 195.0, 48.0 ],
					"id" : "obj-14",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess plane -1",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 825.0, 270.0, 92.0, 18.0 ],
					"id" : "obj-12",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "corners coordinates",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 735.0, 345.0, 98.0, 18.0 ],
					"id" : "obj-8",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"rows" : 1,
					"fontsize" : 10.0,
					"cols" : 1,
					"numinlets" : 2,
					"numoutlets" : 4,
					"patching_rect" : [ 480.0, 360.0, 480.0, 35.0 ],
					"id" : "obj-1",
					"fontname" : "Arial",
					"outlettype" : [ "list", "", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p color_convert",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 325.0, 375.0, 79.0, 18.0 ],
					"id" : "obj-77",
					"fontname" : "Arial",
					"outlettype" : [ "jit_matrix" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 640.0, 480.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 12.0, 12.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.matrix @planemap 3 0 1 2",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 132.0, 288.0, 138.0, 18.0 ],
									"id" : "obj-11",
									"fontname" : "Arial",
									"outlettype" : [ "jit_matrix", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 360.0, 25.0, 25.0 ],
									"id" : "obj-10",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 2",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 168.0, 192.0, 22.0, 18.0 ],
									"id" : "obj-9",
									"fontname" : "Arial",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "gate 2",
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 2,
									"patching_rect" : [ 108.0, 252.0, 38.0, 18.0 ],
									"id" : "obj-8",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1",
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 132.0, 192.0, 32.5, 16.0 ],
									"id" : "obj-7",
									"fontname" : "Arial",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 1",
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 2,
									"patching_rect" : [ 132.0, 168.0, 53.5, 18.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route planecount",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 132.0, 144.0, 85.0, 18.0 ],
									"id" : "obj-4",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.matrixinfo",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 132.0, 120.0, 64.0, 18.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t l l",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 108.0, 96.0, 32.5, 18.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 108.0, 60.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"outlettype" : [ "jit_matrix" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 1 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-8", 1 ],
									"hidden" : 0,
									"midpoints" : [ 117.5, 225.0, 136.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p color_convert",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 325.0, 228.0, 79.0, 18.0 ],
					"id" : "obj-76",
					"fontname" : "Arial",
					"outlettype" : [ "jit_matrix" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 640.0, 480.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 12.0, 12.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.matrix @planemap 1 2 3 0",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 132.0, 288.0, 138.0, 18.0 ],
									"id" : "obj-11",
									"fontname" : "Arial",
									"outlettype" : [ "jit_matrix", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 360.0, 25.0, 25.0 ],
									"id" : "obj-10",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 2",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 168.0, 192.0, 22.0, 18.0 ],
									"id" : "obj-9",
									"fontname" : "Arial",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "gate 2",
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 2,
									"patching_rect" : [ 108.0, 252.0, 38.0, 18.0 ],
									"id" : "obj-8",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1",
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 132.0, 192.0, 32.5, 16.0 ],
									"id" : "obj-7",
									"fontname" : "Arial",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 1",
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 2,
									"patching_rect" : [ 132.0, 168.0, 53.5, 18.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route planecount",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 132.0, 144.0, 85.0, 18.0 ],
									"id" : "obj-4",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.matrixinfo",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 132.0, 120.0, 64.0, 18.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t l l",
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 108.0, 96.0, 32.5, 18.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 108.0, 60.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"outlettype" : [ "jit_matrix" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 1 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-8", 1 ],
									"hidden" : 0,
									"midpoints" : [ 117.5, 225.0, 136.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-description[1]",
					"text" : "OpenCV uses RGBA planemap instead of ARGB. You need to convert colored images before processing. See subpatchs color_convert for some tips.",
					"linecount" : 5,
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 675.0, 480.0, 174.0, 70.0 ],
					"id" : "obj-41",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 1.0, 0.0, 0.0, 0.647059 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.396078 ],
					"numoutlets" : 0,
					"patching_rect" : [ 667.0, 472.0, 191.0, 84.0 ],
					"id" : "obj-68",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "set the number of inner corners in the 2 dimensions of your chessboard pattern. 7 6 by default, and at leat 3 3.",
					"linecount" : 3,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 515.0, 261.0, 187.0, 41.0 ],
					"id" : "obj-27",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 465.0, 270.0, 50.0, 18.0 ],
					"id" : "obj-25",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 405.0, 270.0, 50.0, 18.0 ],
					"id" : "obj-24",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pak pattern_size 7 6",
					"fontsize" : 10.0,
					"numinlets" : 3,
					"numoutlets" : 1,
					"patching_rect" : [ 360.0, 300.0, 101.0, 18.0 ],
					"id" : "obj-7",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-description[3]",
					"text" : "You need a chessboard pattern printed on a rigid paper to perform calibration.",
					"linecount" : 3,
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 675.0, 405.0, 174.0, 44.0 ],
					"id" : "obj-11",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cvjit_random_bg_colour",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numinlets" : 0,
					"numoutlets" : 3,
					"patching_rect" : [ 720.0, 135.0, 117.0, 18.0 ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"outlettype" : [ "int", "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bgcolor",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 720.0, 159.546204, 165.5, 18.0 ],
					"id" : "obj-10",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "copyright-comment",
					"text" : "Copyright © 2010",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 626.0, 111.0, 18.0 ],
					"id" : "obj-17",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "support-comment",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 594.0, 240.0, 17.0 ],
					"id" : "obj-18",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "email-comment",
					"text" : "antoine.villeret@gmail.com",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 159.0, 561.0, 131.0, 18.0 ],
					"id" : "obj-19",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "me-comment",
					"text" : "By Antoine Villeret",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 559.0, 135.0, 20.0 ],
					"id" : "obj-22",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-comment",
					"text" : "Output",
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 55.5, 218.5, 44.0, 19.0 ],
					"id" : "obj-31",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "input-comment",
					"text" : "Input",
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 60.0, 159.0, 35.0, 19.0 ],
					"id" : "obj-34",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "input-description",
					"text" : "1 or 4 planes, char matrix",
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 159.0, 175.0, 19.0 ],
					"id" : "obj-37",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-description",
					"text" : "1 or 4 plane, char matrix, same dimension as input. Draw chessboard corners if found.\n\n2 planes float32 n matrix of corners coordinates.",
					"linecount" : 6,
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 187.0, 175.0, 82.0 ],
					"id" : "obj-38",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "io-cat-panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"bgcolor" : [ 0.556863, 0.556863, 0.556863, 0.2 ],
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 154.0, 55.0, 120.0 ],
					"id" : "obj-39",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "output-panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"bgcolor" : [ 0.615686, 0.607843, 0.607843, 0.2 ],
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 182.0, 240.0, 92.0 ],
					"id" : "obj-42",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "input-panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"bgcolor" : [ 0.615686, 0.607843, 0.607843, 0.2 ],
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 154.0, 240.0, 29.0 ],
					"id" : "obj-44",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "copyright-panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.647059 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.403922 ],
					"numoutlets" : 0,
					"patching_rect" : [ 45.0, 554.0, 250.0, 95.0 ],
					"id" : "obj-49"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "comments",
					"text" : "cv.jit.finchessboardcorners finds the chessboard corners in an input stream.\nIt useful for video projector calibration.",
					"linecount" : 3,
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 95.0, 240.0, 44.0 ],
					"id" : "obj-62",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "comments-panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.517647 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"numoutlets" : 0,
					"patching_rect" : [ 45.0, 90.0, 250.0, 54.0 ],
					"id" : "obj-65",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "io-panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.517647 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.403922 ],
					"numoutlets" : 0,
					"patching_rect" : [ 45.0, 149.0, 250.0, 130.0 ],
					"id" : "obj-5",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.findchessboardcorners",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"patching_rect" : [ 325.0, 327.0, 134.0, 18.0 ],
					"id" : "obj-71",
					"fontname" : "Arial",
					"outlettype" : [ "jit_matrix", "jit_matrix", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.fpsgui",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 663.0, 80.0, 36.0 ],
					"id" : "obj-70",
					"fontname" : "Arial",
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 410.0, 320.0, 240.0 ],
					"id" : "obj-67",
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 1.0, 0.0, 0.0, 0.647059 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.396078 ],
					"numoutlets" : 0,
					"patching_rect" : [ 667.0, 397.0, 191.0, 59.0 ],
					"id" : "obj-66",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 427.0, 130.0, 31.0, 16.0 ],
					"id" : "obj-64",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 633.0, 149.0, 31.0, 16.0 ],
					"id" : "obj-63",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 388.0, 128.0, 32.0, 18.0 ],
					"id" : "obj-61",
					"fontname" : "Arial",
					"outlettype" : [ "bang", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Use pre-recorded movie",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 512.0, 102.0, 163.0, 19.0 ],
					"id" : "obj-60",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Use live camera input",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fontsize" : 11.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 350.0, 102.0, 116.0, 19.0 ],
					"id" : "obj-59",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1 0",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"patching_rect" : [ 553.0, 128.0, 40.0, 18.0 ],
					"id" : "obj-57",
					"fontname" : "Arial",
					"outlettype" : [ "bang", "bang", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 487.0, 101.0, 20.0, 20.0 ],
					"id" : "obj-51",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "qmetro 2",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 487.0, 128.0, 50.0, 18.0 ],
					"id" : "obj-52",
					"fontname" : "Arial",
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "stop",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 593.0, 151.0, 29.0, 16.0 ],
					"id" : "obj-53",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "start",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 553.0, 151.0, 30.0, 16.0 ],
					"id" : "obj-54",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "read",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 514.0, 151.0, 31.0, 16.0 ],
					"id" : "obj-55",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.qt.movie 320 240 @unique 1",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 487.0, 178.0, 149.0, 18.0 ],
					"id" : "obj-56",
					"fontname" : "Arial",
					"outlettype" : [ "jit_matrix", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 325.0, 101.0, 20.0, 20.0 ],
					"id" : "obj-50",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "qmetro 2",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 325.0, 128.0, 50.0, 18.0 ],
					"id" : "obj-48",
					"fontname" : "Arial",
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "settings",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 431.0, 151.0, 45.0, 16.0 ],
					"id" : "obj-47",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "close",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 391.0, 151.0, 34.0, 16.0 ],
					"id" : "obj-46",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 352.0, 151.0, 33.0, 16.0 ],
					"id" : "obj-45",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.grab 320 240",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 178.0, 92.0, 18.0 ],
					"id" : "obj-43",
					"fontname" : "Arial",
					"outlettype" : [ "jit_matrix", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 769.0, 7.0, 255.0, 72.0 ],
					"pic" : "cvtitle.png",
					"id" : "obj-2"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.207843 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 45.0, 778.0, 4.0 ],
					"id" : "obj-20",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Find chessboardcorners in an input stream.",
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"fontsize" : 20.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 45.0, 45.0, 441.0, 29.0 ],
					"id" : "obj-16",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "cv.jit.findchessboardcorners",
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"fontface" : 1,
					"fontsize" : 30.028469,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 45.0, 15.0, 565.0, 41.0 ],
					"id" : "obj-15",
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 0.0, 0.0, 1.0, 0.733333 ],
					"bgcolor" : [ 0.0, 0.0, 1.0, 0.05098 ],
					"numoutlets" : 0,
					"patching_rect" : [ 321.0, 323.0, 144.0, 26.0 ],
					"id" : "obj-9",
					"rounded" : 30
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"background" : 1,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 0.0 ],
					"numoutlets" : 0,
					"patching_rect" : [ 315.0, 255.0, 416.0, 104.0 ],
					"id" : "obj-141",
					"rounded" : 15
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"background" : 1,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.2 ],
					"numoutlets" : 0,
					"patching_rect" : [ 315.0, 90.0, 366.0, 130.0 ],
					"id" : "obj-58",
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"border" : 1,
					"numinlets" : 1,
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"background" : 1,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.101961 ],
					"numoutlets" : 0,
					"patching_rect" : [ 317.0, 402.0, 336.0, 256.0 ],
					"id" : "obj-147",
					"rounded" : 15
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-76", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [ 369.5, 320.0, 334.5, 320.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-7", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-7", 2 ],
					"hidden" : 0,
					"midpoints" : [ 474.5, 293.5, 451.5, 293.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-77", 0 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 496.5, 205.5, 334.5, 205.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
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
					"source" : [ "obj-6", 1 ],
					"destination" : [ "obj-10", 1 ],
					"hidden" : 1,
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
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 440.5, 173.0, 334.5, 173.0 ]
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
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 361.5, 173.0, 334.5, 173.0 ]
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
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-48", 0 ],
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
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
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
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [ 562.5, 173.0, 496.5, 173.0 ]
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
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 1,
					"midpoints" : [ 496.5, 124.0, 562.5, 124.0 ]
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
					"source" : [ "obj-57", 1 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 1,
					"midpoints" : [ 573.0, 149.0, 602.5, 149.0 ]
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
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-63", 0 ],
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
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
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
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-77", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 1 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 392.0, 352.0, 489.5, 352.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
 ]
	}

}

{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 3,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 287.0, 135.0, 828.0, 560.0 ],
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
					"hidden" : 1,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 173.0, 524.0, 47.0, 0.0 ],
					"style" : "",
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 20.0, 74.0, 600.0, 400.0 ],
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
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 269.0, 92.0, 32.0, 0.0 ],
									"style" : "",
									"text" : "print"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 171.0, 294.0, 15.0, 15.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 171.0, 264.0, 66.0, 0.0 ],
									"style" : "",
									"text" : "prepend help"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 197.0, 216.0, 44.0, 0.0 ],
									"style" : "",
									"text" : "zl nth 3"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 197.0, 105.0, 57.0, 0.0 ],
									"style" : "",
									"text" : "t l l"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 171.0, 242.0, 36.0, 0.0 ],
									"style" : "",
									"text" : "zl reg"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 197.0, 193.0, 57.0, 0.0 ],
									"style" : "",
									"text" : "zl reg"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 197.0, 152.0, 32.0, 0.0 ],
									"style" : "",
									"text" : "sel 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 116.0, 217.0, 32.0, 0.0 ],
									"style" : "",
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 116.0, 196.0, 27.0, 0.0 ],
									"style" : "",
									"text" : "> 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 116.0, 174.0, 34.0, 0.0 ],
									"style" : "",
									"text" : "zl len"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 116.0, 134.0, 14.0, 0.0 ],
									"style" : "",
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 116.0, 153.0, 52.0, 0.0 ],
									"style" : "",
									"text" : "thresh 400"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 197.0, 131.0, 44.0, 0.0 ],
									"style" : "",
									"text" : "zl nth 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-15",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 197.0, 85.0, 15.0, 15.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 125.5, 239.0, 180.5, 239.0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 173.0, 502.0, 70.0, 0.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p launch_help"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 668.0, 210.0, 27.0, 0.0 ],
					"style" : "",
					"text" : "- 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 758.0, 231.0, 48.0, 0.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 651.0, 191.0, 27.0, 0.0 ],
					"style" : "",
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 668.0, 232.0, 58.0, 0.0 ],
					"style" : "",
					"text" : "sort -1 $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 651.0, 171.0, 86.0, 0.0 ],
					"style" : "",
					"text" : "pvar cvjit_ubu 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.0, 74.0, 57.0, 17.0 ],
					"style" : "",
					"text" : "Description"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 189.0, 74.0, 57.0, 17.0 ],
					"style" : "",
					"text" : "Group"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 25.0, 74.0, 65.0, 17.0 ],
					"style" : "",
					"text" : "Object name"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 9.0,
					"id" : "obj-11",
					"items" : [ "Name", ",", "Group" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 526.0, 71.0, 100.0, 19.0 ],
					"style" : "",
					"varname" : "cvjit_ubu"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 23.0, 507.0, 106.0, 0.0 ],
					"style" : "",
					"text" : "bgcolor 210 210 195"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-13",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 644.0, 455.0, 129.0, 27.0 ],
					"style" : "",
					"text" : "International Academy of Media Arts & Sciences",
					"textcolor" : [ 0.058824, 0.007843, 0.007843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-14",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 644.0, 440.0, 110.0, 17.0 ],
					"style" : "",
					"text" : "support:",
					"textcolor" : [ 0.058824, 0.007843, 0.007843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-15",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 642.0, 384.0, 121.0, 37.0 ],
					"style" : "",
					"text" : "By Jean-Marc Pelletier\rjmp@iamas.ac.jp\rCopyright ©2003-2008"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"id" : "obj-16",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 635.0, 377.0, 140.0, 111.0 ],
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
					"id" : "obj-17",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 637.0, 382.0, 142.0, 110.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 24.0,
					"id" : "obj-18",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 23.0, 26.0, 453.0, 33.0 ],
					"style" : "",
					"text" : "cv.jit object guide",
					"textcolor" : [ 0.054902, 0.2, 0.270588, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"id" : "obj-19",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 23.0, 55.0, 600.0, 4.0 ],
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
					"id" : "obj-20",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 23.0, 54.0, 600.0, 5.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 651.0, 277.0, 80.0, 0.0 ],
					"style" : "",
					"text" : "refer externals"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 651.0, 295.0, 101.0, 0.0 ],
					"style" : "",
					"text" : "pvar cvjit_list 4"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.992218, 0.992218, 0.992218, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"coldef" : [ [ 0, 165, 1, 0.368627, 0.0, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, 2, 1 ], [ -1, 5, 1, 0.368627, 0.0, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, 2, 1 ], [ -2, 5, 1, 0.368627, 0.0, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, 2, 1 ], [ 2, 360, 1, 0.368627, 0.0, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, 2, 1 ], [ 1, 64, 1, 0.513726, 0.086275, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, 2, 1 ] ],
					"cols" : 3,
					"colwidth" : 45,
					"fontface" : 0,
					"fontname" : "Geneva",
					"fontsize" : 9.0,
					"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hcellcolor" : [ 0.801556, 0.801556, 0.801556, 1.0 ],
					"headercolor" : [ 0.992218, 0.992218, 0.992218, 1.0 ],
					"hscroll" : 0,
					"id" : "obj-23",
					"maxclass" : "jit.cellblock",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "list", "", "", "" ],
					"patching_rect" : [ 23.0, 92.0, 605.0, 401.0 ],
					"precision" : 4,
					"rowhead" : 1,
					"rowheight" : 25,
					"rows" : 61,
					"selmode" : 3,
					"varname" : "cvjit_list"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 61,
						"data" : [ 							{
								"key" : "cv.jit.binedge",
								"value" : [ "edges", "Extract edge pixels from a binary image" ]
							}
, 							{
								"key" : "cv.jit.blobs.bounds",
								"value" : [ "blobs", "Return the bounding boxes of each connected component" ]
							}
, 							{
								"key" : "cv.jit.blobs.bounds.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.blobs.bounds" ]
							}
, 							{
								"key" : "cv.jit.blobs.centroids",
								"value" : [ "blobs", "Return the center of mass of each connected component" ]
							}
, 							{
								"key" : "cv.jit.blobs.centroids.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.blobs.centroids" ]
							}
, 							{
								"key" : "cv.jit.blobs.color",
								"value" : [ "drawing", "Paint each connected component a different colour" ]
							}
, 							{
								"key" : "cv.jit.blobs.colour",
								"value" : [ "drawing", "Paint each connected component a different color" ]
							}
, 							{
								"key" : "cv.jit.blobs.direction",
								"value" : [ "blobs", "Return the direction each connected component points to" ]
							}
, 							{
								"key" : "cv.jit.blobs.direction.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.blobs.direction" ]
							}
, 							{
								"key" : "cv.jit.blobs.elongation",
								"value" : [ "blobs", "Return the elongation (thinness) of each connected component" ]
							}
, 							{
								"key" : "cv.jit.blobs.elongation.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.blobs.elongation" ]
							}
, 							{
								"key" : "cv.jit.blobs.moments",
								"value" : [ "blobs", "Return moments and invariants of each connected component" ]
							}
, 							{
								"key" : "cv.jit.blobs.orient.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.blobs.orientation" ]
							}
, 							{
								"key" : "cv.jit.blobs.orientation",
								"value" : [ "blobs", "Return the orientation of each connected component" ]
							}
, 							{
								"key" : "cv.jit.blobs.orientation.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.blobs.orientation" ]
							}
, 							{
								"key" : "cv.jit.blobs.recon",
								"value" : [ "blobs", "Compare each connected component to a pre-calculated model" ]
							}
, 							{
								"key" : "cv.jit.blobs.sort",
								"value" : [ "blobs", "Try to keep blob labels in order" ]
							}
, 							{
								"key" : "cv.jit.canny",
								"value" : [ "edges", "Extract a binary edge from a greyscale image" ]
							}
, 							{
								"key" : "cv.jit.cartopol",
								"value" : [ "utilities", "Convert cartesian coordinates to polar form (matrix version)" ]
							}
, 							{
								"key" : "cv.jit.centroids",
								"value" : [ "shape", "Calculate the center of mass of the image" ]
							}
, 							{
								"key" : "cv.jit.centroids.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.centroids" ]
							}
, 							{
								"key" : "cv.jit.circularity",
								"value" : [ "shape", "Calculate how compact a shape is." ]
							}
, 							{
								"key" : "cv.jit.close",
								"value" : [ "morphology", "Morphological close operator (dilate+erode)" ]
							}
, 							{
								"key" : "cv.jit.dilate",
								"value" : [ "morphology", "Morphological open operator" ]
							}
, 							{
								"key" : "cv.jit.direction",
								"value" : [ "shape", "Calculate the direction of a shape from its moments" ]
							}
, 							{
								"key" : "cv.jit.elongation",
								"value" : [ "shape", "Calculate how thin a shape is from its moments" ]
							}
, 							{
								"key" : "cv.jit.erode",
								"value" : [ "morphology", "Morphological erosion" ]
							}
, 							{
								"key" : "cv.jit.faces",
								"value" : [ "patterns", "Find faces in a greyscale image" ]
							}
, 							{
								"key" : "cv.jit.faces.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.faces" ]
							}
, 							{
								"key" : "cv.jit.features",
								"value" : [ "patterns", "Find salient points in a greyscale image" ]
							}
, 							{
								"key" : "cv.jit.features.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.features" ]
							}
, 							{
								"key" : "cv.jit.features2track",
								"value" : [ "tracking", "Initialize cv.jit.track to salient points in the image" ]
							}
, 							{
								"key" : "cv.jit.floodfill",
								"value" : [ "blobs", "Isolate a single connected component from a binary image" ]
							}
, 							{
								"key" : "cv.jit.framesub",
								"value" : [ "movement", "Find the difference between the current frame and the previous one" ]
							}
, 							{
								"key" : "cv.jit.hough",
								"value" : [ "patterns", "Calculate Hough space" ]
							}
, 							{
								"key" : "cv.jit.hough2lines",
								"value" : [ "patterns", "Use the Hough space to find straight lines in an image" ]
							}
, 							{
								"key" : "cv.jit.hsflow",
								"value" : [ "movement", "Use the Horn-Schunk method to estimate optical flow" ]
							}
, 							{
								"key" : "cv.jit.label",
								"value" : [ "blobs", "Assign a different value to each connected component in a binary image" ]
							}
, 							{
								"key" : "cv.jit.learn",
								"value" : [ "recognition", "Simple pattern learning and recognition" ]
							}
, 							{
								"key" : "cv.jit.lines",
								"value" : [ "patterns", "Find straight lines in a greyscale image" ]
							}
, 							{
								"key" : "cv.jit.lines.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.lines" ]
							}
, 							{
								"key" : "cv.jit.lkflow",
								"value" : [ "movement", "Use the Lucas-Kanade method to estimate optical flow" ]
							}
, 							{
								"key" : "cv.jit.mass",
								"value" : [ "shape", "Sum all the pixel values togther (char data is normalized between 0 and 1)" ]
							}
, 							{
								"key" : "cv.jit.mean",
								"value" : [ "statistics", "Calculate the time-wise mean of an image stream" ]
							}
, 							{
								"key" : "cv.jit.moments",
								"value" : [ "shape", "Calculate moments of inertia and shape invariants for an image" ]
							}
, 							{
								"key" : "cv.jit.open",
								"value" : [ "morphology", "Morphological open operator (erode+dilate)" ]
							}
, 							{
								"key" : "cv.jit.orientation",
								"value" : [ "shape", "Find the orientation of an image from its moments" ]
							}
, 							{
								"key" : "cv.jit.perimeter",
								"value" : [ "shape", "Count the number of edge pixels in a binary image" ]
							}
, 							{
								"key" : "cv.jit.poltocar",
								"value" : [ "utilities", "Convert polar coordinates to cartesian form (matrix version)" ]
							}
, 							{
								"key" : "cv.jit.ravg",
								"value" : [ "statistics", "Calculate the time-wise running average of an image stream" ]
							}
, 							{
								"key" : "cv.jit.resize",
								"value" : [ "utilities", "Use bi-cubic interpolation to resize a matrix" ]
							}
, 							{
								"key" : "cv.jit.shift",
								"value" : [ "tracking", "Use MeanShift and CAMShift algorithms to track bright regions" ]
							}
, 							{
								"key" : "cv.jit.shift.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.shift" ]
							}
, 							{
								"key" : "cv.jit.snake",
								"value" : [ "patterns", "Fit a shape to image edges" ]
							}
, 							{
								"key" : "cv.jit.snake.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.snake" ]
							}
, 							{
								"key" : "cv.jit.stddev",
								"value" : [ "statistics", "Calculate the time-wise standard deviation of an image stream" ]
							}
, 							{
								"key" : "cv.jit.sum",
								"value" : [ "statistics", "Add all the pixel values together" ]
							}
, 							{
								"key" : "cv.jit.track",
								"value" : [ "tracking", "Track individual pixels" ]
							}
, 							{
								"key" : "cv.jit.track.draw",
								"value" : [ "drawing", "Drawing utility for cv.jit.track" ]
							}
, 							{
								"key" : "cv.jit.undergrad",
								"value" : [ "recognition", "Very simple pattern learning and recognition" ]
							}
, 							{
								"key" : "cv.jit.variance",
								"value" : [ "statistics", "Calculate the time-wise variance of an image stream" ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 668.0, 253.0, 86.0, 0.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "",
					"text" : "coll externals -1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-25",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 467.0, 74.0, 56.0, 17.0 ],
					"style" : "",
					"text" : "Sort by:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-26",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 640.0, 99.0, 115.0, 37.0 ],
					"style" : "",
					"text" : "Double-click on a row to display the object's help file. (If it exists.)"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.858824, 0.878431, 0.862745, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-27",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 633.0, 92.0, 132.0, 55.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 32.5, 498.0, 182.5, 498.0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 767.5, 274.0, 660.5, 274.0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ],
		"embedsnapshot" : 0
	}

}

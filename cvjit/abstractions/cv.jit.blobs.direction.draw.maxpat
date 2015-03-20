{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 177.0, 48.0, 674.0, 672.0 ],
		"bglocked" : 0,
		"defrect" : [ 177.0, 48.0, 674.0, 672.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 13.0,
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
					"varname" : "copyright-comment",
					"text" : "Copyright ©2003-2010",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"patching_rect" : [ 309.0, 555.0, 111.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-31",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "support-comment",
					"text" : "Support:\nInternational Academy of Media Arts & Sciences (IAMAS) \n– Gifu, Japan",
					"linecount" : 3,
					"fontsize" : 9.0,
					"patching_rect" : [ 309.0, 512.5, 243.0, 38.0 ],
					"numinlets" : 1,
					"id" : "obj-32",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "email-comment",
					"text" : "jmp@jmpelletier.com\n",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"patching_rect" : [ 444.0, 490.0, 105.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-33",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "me-comment",
					"text" : "By Jean-Marc Pelletier\n",
					"fontsize" : 12.0,
					"patching_rect" : [ 309.0, 488.0, 135.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-34",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "copyright-panel",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.403922 ],
					"border" : 1,
					"patching_rect" : [ 304.0, 483.0, 250.0, 95.0 ],
					"numinlets" : 1,
					"id" : "obj-49",
					"numoutlets" : 0,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.647059 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p random_bg_colour",
					"fontsize" : 10.0,
					"hidden" : 1,
					"patching_rect" : [ 325.0, 586.0, 102.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-5",
					"fontname" : "Arial",
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 98.0, 217.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 98.0, 217.0, 640.0, 480.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadbang",
									"fontsize" : 10.0,
									"patching_rect" : [ 50.0, 100.0, 59.0, 18.0 ],
									"numinlets" : 1,
									"id" : "obj-13",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "!- 215",
									"fontsize" : 10.0,
									"patching_rect" : [ 168.0, 161.004089, 36.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-9",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "!- 225",
									"fontsize" : 10.0,
									"patching_rect" : [ 109.0, 161.004089, 36.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-8",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 225",
									"fontsize" : 10.0,
									"patching_rect" : [ 50.0, 161.004089, 36.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-7",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 3",
									"fontsize" : 10.0,
									"patching_rect" : [ 50.0, 120.621155, 137.0, 18.0 ],
									"numinlets" : 1,
									"id" : "obj-6",
									"fontname" : "Arial",
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "random 10",
									"fontsize" : 10.0,
									"patching_rect" : [ 168.0, 140.745117, 58.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-5",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "random 10",
									"fontsize" : 10.0,
									"patching_rect" : [ 109.0, 140.745117, 58.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-4",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "random 3",
									"fontsize" : 10.0,
									"patching_rect" : [ 50.0, 140.964417, 53.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 50.0, 239.004089, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-37",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 109.0, 239.004089, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-38",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 168.0, 239.004089, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-39",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-39", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-38", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 2 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontsize" : 12.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bgcolor",
					"fontsize" : 10.0,
					"hidden" : 1,
					"patching_rect" : [ 325.0, 606.379517, 143.5, 18.0 ],
					"numinlets" : 4,
					"id" : "obj-35",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend dim",
					"fontsize" : 9.0,
					"patching_rect" : [ 356.0, 210.0, 64.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-6",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route dim",
					"fontsize" : 9.0,
					"patching_rect" : [ 356.0, 164.0, 53.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-7",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.matrixinfo",
					"fontsize" : 9.0,
					"patching_rect" : [ 356.0, 140.0, 72.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-8",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p change_dim",
					"fontsize" : 9.0,
					"patching_rect" : [ 356.0, 187.0, 70.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-9",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 20.0, 74.0, 600.0, 426.0 ],
						"bglocked" : 0,
						"defrect" : [ 20.0, 74.0, 600.0, 426.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 13.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "160 120",
									"fontsize" : 9.0,
									"patching_rect" : [ 194.0, 125.0, 49.0, 15.0 ],
									"numinlets" : 2,
									"id" : "obj-1",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadbang",
									"fontsize" : 9.0,
									"patching_rect" : [ 194.0, 100.0, 48.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-2",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 50.0, 333.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-3",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "gate",
									"fontsize" : 9.0,
									"patching_rect" : [ 50.0, 294.0, 29.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-4",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 69.0, 62.0, 15.0, 15.0 ],
									"numinlets" : 0,
									"id" : "obj-5",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t l l l",
									"fontsize" : 9.0,
									"patching_rect" : [ 69.0, 125.0, 40.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-6",
									"fontname" : "Arial",
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "||",
									"fontsize" : 9.0,
									"patching_rect" : [ 80.0, 234.0, 27.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-7",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "unpack",
									"fontsize" : 9.0,
									"patching_rect" : [ 80.0, 209.0, 40.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-8",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "vexpr $i1 != $i2",
									"fontsize" : 9.0,
									"patching_rect" : [ 80.0, 183.0, 85.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-9",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-9", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-9", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 1 ],
									"destination" : [ "obj-7", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-7", 0 ],
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
									"source" : [ "obj-6", 2 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-4", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 268.0, 59.5, 268.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontsize" : 13.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 13.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p route_messages",
					"fontsize" : 9.0,
					"patching_rect" : [ 57.0, 97.0, 91.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-10",
					"fontname" : "Arial",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 420.0, 169.0, 348.0, 418.0 ],
						"bglocked" : 0,
						"defrect" : [ 420.0, 169.0, 348.0, 418.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 13.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 139.0, 236.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-1",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "prepend frgb",
									"fontsize" : 9.0,
									"patching_rect" : [ 175.0, 124.0, 67.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-2",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "prepend dim",
									"fontsize" : 9.0,
									"patching_rect" : [ 109.0, 124.0, 64.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1.",
									"fontsize" : 9.0,
									"patching_rect" : [ 64.0, 174.0, 17.0, 15.0 ],
									"numinlets" : 2,
									"id" : "obj-4",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "57.29578",
									"fontsize" : 9.0,
									"patching_rect" : [ 49.0, 152.0, 62.0, 15.0 ],
									"numinlets" : 2,
									"id" : "obj-5",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 1 0",
									"fontsize" : 9.0,
									"patching_rect" : [ 49.0, 124.0, 41.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-6",
									"fontname" : "Arial",
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route mode dim frgb",
									"fontsize" : 9.0,
									"patching_rect" : [ 49.0, 92.0, 101.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-7",
									"fontname" : "Arial",
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 226.0, 234.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-8",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 23.0, 234.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-9",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 49.0, 50.0, 15.0, 15.0 ],
									"numinlets" : 0,
									"id" : "obj-10",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 73.5, 197.0, 235.0, 197.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 58.5, 193.0, 235.0, 193.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 2 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 3 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 1 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 184.5, 218.0, 32.0, 218.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 118.5, 209.0, 32.0, 209.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontsize" : 13.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 13.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p prepare_for_lcd",
					"fontsize" : 9.0,
					"patching_rect" : [ 114.0, 318.0, 104.0, 17.0 ],
					"numinlets" : 2,
					"id" : "obj-11",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 229.0, 121.0, 504.0, 508.0 ],
						"bglocked" : 0,
						"defrect" : [ 229.0, 121.0, 504.0, 508.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 13.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "moveto $1 $2, lineto $3 $4, lineto $5 $6, lineto $1 $2",
									"fontsize" : 9.0,
									"patching_rect" : [ 68.0, 338.0, 256.0, 15.0 ],
									"numinlets" : 2,
									"id" : "obj-1",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack 0 0 0 0 0 0",
									"fontsize" : 9.0,
									"patching_rect" : [ 68.0, 311.0, 208.0, 17.0 ],
									"numinlets" : 6,
									"id" : "obj-2",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 60",
									"fontsize" : 9.0,
									"patching_rect" : [ 263.0, 289.0, 31.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 80",
									"fontsize" : 9.0,
									"patching_rect" : [ 224.0, 289.0, 31.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-4",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 60",
									"fontsize" : 9.0,
									"patching_rect" : [ 185.0, 289.0, 31.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-5",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 80",
									"fontsize" : 9.0,
									"patching_rect" : [ 146.0, 289.0, 31.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-6",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 60",
									"fontsize" : 9.0,
									"patching_rect" : [ 107.0, 289.0, 31.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-7",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 80",
									"fontsize" : 9.0,
									"patching_rect" : [ 68.0, 289.0, 31.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-8",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b f f f",
									"fontsize" : 9.0,
									"patching_rect" : [ 68.0, 189.0, 123.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-9",
									"fontname" : "Arial",
									"numoutlets" : 4,
									"outlettype" : [ "bang", "float", "float", "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 2.513274",
									"fontsize" : 9.0,
									"patching_rect" : [ 156.0, 237.0, 67.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-10",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 3.77",
									"fontsize" : 9.0,
									"patching_rect" : [ 205.0, 216.0, 67.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-11",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "float",
									"fontsize" : 9.0,
									"patching_rect" : [ 68.0, 237.0, 31.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-12",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "poltocar",
									"fontsize" : 9.0,
									"patching_rect" : [ 168.0, 263.0, 47.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-13",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "poltocar",
									"fontsize" : 9.0,
									"patching_rect" : [ 119.0, 263.0, 47.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-14",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "poltocar",
									"fontsize" : 9.0,
									"patching_rect" : [ 68.0, 263.0, 47.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-15",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "/ 1.",
									"fontsize" : 9.0,
									"patching_rect" : [ 68.0, 138.0, 27.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-16",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "unpack 0. 0. 0. 0.",
									"fontsize" : 9.0,
									"patching_rect" : [ 68.0, 81.0, 88.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-17",
									"fontname" : "Arial",
									"numoutlets" : 4,
									"outlettype" : [ "float", "float", "float", "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sqrt",
									"fontsize" : 9.0,
									"patching_rect" : [ 263.0, 129.0, 29.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-18",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "direction, x, y, area",
									"fontsize" : 9.0,
									"patching_rect" : [ 162.0, 81.0, 100.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-19",
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 333.0, 58.0, 15.0, 15.0 ],
									"numinlets" : 0,
									"id" : "obj-20",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 68.0, 362.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-21",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 68.0, 58.0, 15.0, 15.0 ],
									"numinlets" : 0,
									"id" : "obj-22",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-17", 2 ],
									"destination" : [ "obj-3", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 5 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 1 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 3 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [ 146.5, 104.0, 272.5, 104.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 1 ],
									"destination" : [ "obj-4", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-2", 4 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 2 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-13", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 3 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 181.5, 211.0, 214.5, 211.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-2", 3 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 1 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [ 77.5, 258.0, 177.5, 258.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 1 ],
									"destination" : [ "obj-6", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-14", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 2 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 146.833328, 227.0, 165.5, 227.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-2", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 2 ],
									"destination" : [ "obj-7", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [ 77.5, 258.0, 128.5, 258.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-2", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 1 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 1 ],
									"destination" : [ "obj-15", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 1 ],
									"destination" : [ "obj-8", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-12", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-16", 1 ],
									"hidden" : 0,
									"midpoints" : [ 342.0, 120.0, 85.5, 120.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-21", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontsize" : 13.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 13.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l 1 clear",
					"fontsize" : 9.0,
					"patching_rect" : [ 97.0, 178.0, 63.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-12",
					"fontname" : "Arial",
					"numoutlets" : 4,
					"outlettype" : [ "bang", "", "int", "clear" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p merge_and_iter",
					"fontsize" : 9.0,
					"patching_rect" : [ 114.0, 268.0, 90.0, 17.0 ],
					"numinlets" : 2,
					"id" : "obj-13",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 10.0, 59.0, 600.0, 426.0 ],
						"bglocked" : 0,
						"defrect" : [ 10.0, 59.0, 600.0, 426.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 13.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.unpack 17",
									"fontsize" : 9.0,
									"patching_rect" : [ 88.0, 96.0, 235.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-1",
									"fontname" : "Arial",
									"numoutlets" : 18,
									"outlettype" : [ "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "jit_matrix", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.pack",
									"fontsize" : 9.0,
									"patching_rect" : [ 55.0, 166.0, 53.0, 17.0 ],
									"numinlets" : 4,
									"id" : "obj-2",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.iter",
									"fontsize" : 9.0,
									"patching_rect" : [ 55.0, 187.0, 41.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 55.0, 256.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-4",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 88.0, 59.0, 15.0, 15.0 ],
									"numinlets" : 0,
									"id" : "obj-5",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 55.0, 59.0, 15.0, 15.0 ],
									"numinlets" : 0,
									"id" : "obj-6",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-1", 16 ],
									"destination" : [ "obj-2", 3 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 15 ],
									"destination" : [ "obj-2", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 14 ],
									"destination" : [ "obj-2", 1 ],
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
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontsize" : 13.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 13.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p strict_buddy",
					"fontsize" : 9.0,
					"patching_rect" : [ 97.0, 154.0, 76.0, 17.0 ],
					"numinlets" : 2,
					"id" : "obj-14",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 388.0, 309.0, 331.0, 405.0 ],
						"bglocked" : 0,
						"defrect" : [ 388.0, 309.0, 331.0, 405.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 13.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 163.0, 306.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-1",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 94.0, 306.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-2",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 94.0, 49.0, 15.0, 15.0 ],
									"numinlets" : 0,
									"id" : "obj-3",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 185.0, 49.0, 15.0, 15.0 ],
									"numinlets" : 0,
									"id" : "obj-4",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 0 l",
									"fontsize" : 9.0,
									"patching_rect" : [ 75.0, 250.0, 29.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-5",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 1 l",
									"fontsize" : 9.0,
									"patching_rect" : [ 144.0, 183.0, 29.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-6",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "gate",
									"fontsize" : 9.0,
									"patching_rect" : [ 144.0, 162.0, 29.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-7",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "== 17",
									"fontsize" : 9.0,
									"patching_rect" : [ 185.0, 135.0, 37.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-8",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route planecount",
									"fontsize" : 9.0,
									"patching_rect" : [ 185.0, 114.0, 84.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-9",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.matrixinfo",
									"fontsize" : 9.0,
									"patching_rect" : [ 185.0, 93.0, 72.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-10",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "gate",
									"fontsize" : 9.0,
									"patching_rect" : [ 75.0, 224.0, 29.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-11",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-7", 1 ],
									"hidden" : 0,
									"midpoints" : [ 194.0, 87.0, 163.5, 87.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [ 194.5, 157.0, 153.5, 157.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-11", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 277.0, 69.0, 277.0, 69.0, 215.0, 84.5, 215.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 153.5, 206.0, 84.5, 206.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontsize" : 13.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 13.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend frgb",
					"fontsize" : 9.0,
					"patching_rect" : [ 218.0, 467.0, 67.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-15",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "57.29578",
					"fontsize" : 9.0,
					"patching_rect" : [ 498.0, 185.0, 91.0, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-16",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"fontsize" : 9.0,
					"patching_rect" : [ 498.0, 164.0, 32.0, 17.0 ],
					"numinlets" : 2,
					"id" : "obj-17",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route mode frgb",
					"fontsize" : 9.0,
					"patching_rect" : [ 498.0, 142.0, 82.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-18",
					"fontname" : "Arial",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 1 1",
					"fontsize" : 9.0,
					"patching_rect" : [ 234.0, 352.0, 47.0, 17.0 ],
					"numinlets" : 2,
					"id" : "obj-19",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "dim $1 $2",
					"fontsize" : 9.0,
					"patching_rect" : [ 444.0, 123.0, 56.0, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-20",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"fontsize" : 9.0,
					"patching_rect" : [ 444.0, 77.0, 48.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-21",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "patcherargs",
					"fontsize" : 9.0,
					"patching_rect" : [ 444.0, 98.0, 64.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-22",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t 0 l",
					"fontsize" : 9.0,
					"patching_rect" : [ 305.0, 85.0, 29.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-23",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"patching_rect" : [ 305.0, 58.0, 15.0, 15.0 ],
					"numinlets" : 0,
					"id" : "obj-24",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : "(matrix) Optional Background"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"patching_rect" : [ 114.0, 561.0, 15.0, 15.0 ],
					"numinlets" : 1,
					"id" : "obj-25",
					"numoutlets" : 0,
					"comment" : "(matrix) orientation visualization"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"fontsize" : 9.0,
					"patching_rect" : [ 503.0, 373.0, 48.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-26",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "brgb 0 0 0, frgb 0 255 0",
					"fontsize" : 9.0,
					"patching_rect" : [ 503.0, 398.0, 122.0, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-27",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.lcd 4 char 160 120",
					"fontsize" : 9.0,
					"patching_rect" : [ 114.0, 523.0, 111.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-28",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"patching_rect" : [ 163.0, 58.0, 15.0, 15.0 ],
					"numinlets" : 0,
					"id" : "obj-29",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : "(matrix) Blob centroids and mass"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"patching_rect" : [ 57.0, 58.0, 15.0, 15.0 ],
					"numinlets" : 0,
					"id" : "obj-30",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : "(matrix) blob moments"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-5", 2 ],
					"destination" : [ "obj-35", 2 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 1 ],
					"destination" : [ "obj-35", 1 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 1 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 1 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 324.5, 110.0, 365.5, 110.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 3 ],
					"destination" : [ "obj-19", 1 ],
					"hidden" : 0,
					"midpoints" : [ 150.5, 206.0, 271.5, 206.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [ 314.5, 338.0, 243.5, 338.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 2 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [ 135.833328, 220.0, 243.5, 220.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 1 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 539.0, 171.0, 565.0, 171.0, 565.0, 454.0, 227.5, 454.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-11", 1 ],
					"hidden" : 0,
					"midpoints" : [ 507.5, 299.0, 208.5, 299.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 2 ],
					"destination" : [ "obj-11", 1 ],
					"hidden" : 0,
					"midpoints" : [ 138.5, 127.0, 208.5, 127.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 1 ],
					"destination" : [ "obj-13", 1 ],
					"hidden" : 0,
					"midpoints" : [ 163.5, 242.0, 194.5, 242.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-14", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 106.5, 404.0, 123.5, 404.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 66.5, 510.0, 123.5, 510.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 243.5, 400.0, 123.5, 400.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 453.5, 420.0, 123.5, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 512.5, 442.0, 123.5, 442.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 227.5, 498.0, 123.5, 498.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 1 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 324.5, 410.0, 123.5, 410.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 1 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}

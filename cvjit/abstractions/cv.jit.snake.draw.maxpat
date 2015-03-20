{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 245.0, 74.0, 875.0, 676.0 ],
		"bglocked" : 0,
		"defrect" : [ 245.0, 74.0, 875.0, 676.0 ],
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
					"patching_rect" : [ 400.0, 563.0, 111.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-26",
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
					"patching_rect" : [ 400.0, 520.5, 243.0, 38.0 ],
					"numinlets" : 1,
					"id" : "obj-27",
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
					"patching_rect" : [ 535.0, 498.0, 105.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-28",
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
					"patching_rect" : [ 400.0, 496.0, 135.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-29",
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
					"patching_rect" : [ 395.0, 491.0, 250.0, 95.0 ],
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
					"patching_rect" : [ 416.0, 594.0, 102.0, 18.0 ],
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
					"patching_rect" : [ 416.0, 614.379517, 143.5, 18.0 ],
					"numinlets" : 4,
					"id" : "obj-30",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend dim",
					"fontsize" : 9.0,
					"patching_rect" : [ 363.0, 212.0, 64.0, 17.0 ],
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
					"patching_rect" : [ 363.0, 166.0, 53.0, 17.0 ],
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
					"patching_rect" : [ 363.0, 142.0, 72.0, 17.0 ],
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
					"patching_rect" : [ 363.0, 189.0, 70.0, 17.0 ],
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
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-9", 1 ],
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
					"patching_rect" : [ 69.0, 107.0, 91.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-10",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
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
									"patching_rect" : [ 187.0, 236.0, 15.0, 15.0 ],
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
									"patching_rect" : [ 115.0, 124.0, 67.0, 17.0 ],
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
									"patching_rect" : [ 49.0, 124.0, 64.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route dim frgb",
									"fontsize" : 9.0,
									"patching_rect" : [ 49.0, 92.0, 75.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-4",
									"fontname" : "Arial",
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 23.0, 234.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-5",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 49.0, 50.0, 15.0, 15.0 ],
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
									"source" : [ "obj-4", 2 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 114.5, 113.0, 196.0, 113.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 1 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 86.5, 117.0, 124.5, 117.0 ]
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
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 58.5, 209.0, 32.0, 209.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 124.5, 218.0, 32.0, 218.0 ]
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
					"patching_rect" : [ 126.0, 323.0, 104.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-11",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 83.0, 200.0, 358.0, 407.0 ],
						"bglocked" : 0,
						"defrect" : [ 83.0, 200.0, 358.0, 407.0 ],
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
									"text" : "t b l",
									"fontsize" : 9.0,
									"patching_rect" : [ 118.0, 79.0, 27.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-1",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "zl reg",
									"fontsize" : 9.0,
									"patching_rect" : [ 211.0, 205.0, 36.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-2",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel done",
									"fontsize" : 9.0,
									"patching_rect" : [ 211.0, 147.0, 46.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "lineto $1 $2",
									"fontsize" : 9.0,
									"patching_rect" : [ 79.0, 242.0, 65.0, 15.0 ],
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
									"text" : "moveto $1 $2",
									"fontsize" : 9.0,
									"patching_rect" : [ 135.0, 205.0, 73.0, 15.0 ],
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
									"text" : "gate 2",
									"fontsize" : 9.0,
									"patching_rect" : [ 79.0, 180.0, 66.0, 17.0 ],
									"numinlets" : 2,
									"id" : "obj-6",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 1",
									"fontsize" : 9.0,
									"patching_rect" : [ 150.0, 151.0, 27.0, 17.0 ],
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
									"text" : "== 0",
									"fontsize" : 9.0,
									"patching_rect" : [ 150.0, 130.0, 31.0, 17.0 ],
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
									"text" : "jit.iter",
									"fontsize" : 9.0,
									"patching_rect" : [ 135.0, 107.0, 41.0, 17.0 ],
									"numinlets" : 1,
									"id" : "obj-9",
									"fontname" : "Arial",
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 79.0, 292.0, 15.0, 15.0 ],
									"numinlets" : 1,
									"id" : "obj-10",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 118.0, 54.0, 15.0, 15.0 ],
									"numinlets" : 0,
									"id" : "obj-11",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-2", 1 ],
									"hidden" : 0,
									"midpoints" : [ 135.5, 201.0, 237.5, 201.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 2 ],
									"destination" : [ "obj-3", 0 ],
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
									"source" : [ "obj-9", 1 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-6", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 1 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-1", 0 ],
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
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 144.5, 225.0, 155.0, 225.0, 155.0, 265.0, 88.0, 265.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 127.5, 139.0, 63.0, 139.0, 63.0, 266.0, 88.0, 266.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 220.5, 234.0, 88.5, 234.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 174.0, 88.5, 174.0 ]
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
					"patching_rect" : [ 109.0, 183.0, 63.0, 17.0 ],
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
					"text" : "prepend frgb",
					"fontsize" : 9.0,
					"patching_rect" : [ 230.0, 472.0, 67.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-13",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route frgb",
					"fontsize" : 9.0,
					"patching_rect" : [ 531.0, 147.0, 59.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-14",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 1 1",
					"fontsize" : 9.0,
					"patching_rect" : [ 246.0, 357.0, 47.0, 17.0 ],
					"numinlets" : 2,
					"id" : "obj-15",
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
					"patching_rect" : [ 477.0, 128.0, 56.0, 15.0 ],
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
					"text" : "loadbang",
					"fontsize" : 9.0,
					"patching_rect" : [ 477.0, 82.0, 48.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-17",
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
					"patching_rect" : [ 477.0, 103.0, 64.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-18",
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
					"patching_rect" : [ 317.0, 90.0, 29.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-19",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"patching_rect" : [ 317.0, 63.0, 15.0, 15.0 ],
					"numinlets" : 0,
					"id" : "obj-20",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : "(matrix) Optional Background"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"patching_rect" : [ 126.0, 566.0, 15.0, 15.0 ],
					"numinlets" : 1,
					"id" : "obj-21",
					"numoutlets" : 0,
					"comment" : "(matrix) orientation visualization"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"fontsize" : 9.0,
					"patching_rect" : [ 613.0, 342.0, 48.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-22",
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
					"patching_rect" : [ 613.0, 367.0, 122.0, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-23",
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
					"patching_rect" : [ 126.0, 528.0, 111.0, 17.0 ],
					"numinlets" : 1,
					"id" : "obj-24",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"patching_rect" : [ 69.0, 63.0, 15.0, 15.0 ],
					"numinlets" : 0,
					"id" : "obj-25",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : "(matrix) Connect cv.jit.blobs.orientation"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-5", 2 ],
					"destination" : [ "obj-30", 2 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 1 ],
					"destination" : [ "obj-30", 1 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 1 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-18", 0 ],
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
					"source" : [ "obj-19", 1 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 336.5, 115.0, 372.5, 115.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 3 ],
					"destination" : [ "obj-15", 1 ],
					"hidden" : 0,
					"midpoints" : [ 162.5, 211.0, 283.5, 211.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 2 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 147.833328, 225.0, 255.5, 225.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 326.5, 343.0, 255.5, 343.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [ 540.5, 466.0, 239.5, 466.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 1 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [ 336.5, 415.0, 135.5, 415.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [ 78.5, 481.0, 135.5, 481.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [ 239.5, 503.0, 135.5, 503.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [ 622.5, 447.0, 135.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [ 486.5, 425.0, 135.5, 425.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [ 255.5, 405.0, 135.5, 405.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [ 118.5, 409.0, 135.5, 409.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 1 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [ 150.5, 153.0, 118.5, 153.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}

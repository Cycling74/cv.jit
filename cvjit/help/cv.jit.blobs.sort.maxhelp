{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 355.0, 44.0, 948.0, 830.0 ],
		"bgcolor" : [ 0.823529, 0.823529, 0.764706, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 355.0, 44.0, 948.0, 830.0 ],
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
					"text" : "International Academy of Media Arts & Sciences",
					"linecount" : 2,
					"numoutlets" : 0,
					"frgb" : [ 0.058824, 0.007843, 0.007843, 1.0 ],
					"patching_rect" : [ 775.0, 650.0, 129.0, 27.0 ],
					"id" : "obj-60",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"textcolor" : [ 0.058824, 0.007843, 0.007843, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "support:",
					"numoutlets" : 0,
					"frgb" : [ 0.058824, 0.007843, 0.007843, 1.0 ],
					"patching_rect" : [ 775.0, 635.0, 110.0, 17.0 ],
					"id" : "obj-61",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"textcolor" : [ 0.058824, 0.007843, 0.007843, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "By Jean-Marc Pelletier\njmp@iamas.ac.jp\nCopyright ©2003-2010",
					"linecount" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 773.0, 579.0, 121.0, 38.0 ],
					"id" : "obj-62",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"patching_rect" : [ 766.0, 572.0, 140.0, 111.0 ],
					"border" : 1,
					"id" : "obj-63",
					"bordercolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 768.0, 577.0, 142.0, 110.0 ],
					"id" : "obj-64",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "You can change the maximum allowed displacement with the \"threshold\" attribute. Default is 10 pixels.",
					"linecount" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 77.0, 333.0, 291.0, 27.0 ],
					"id" : "obj-1",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.968627, 0.972549, 0.972549, 1.0 ],
					"patching_rect" : [ 63.0, 329.0, 312.0, 36.0 ],
					"border" : 1,
					"id" : "obj-2",
					"bordercolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 66.0, 332.0, 313.0, 37.0 ],
					"id" : "obj-3",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Unprocessed labels. Notice that colours are not always the same for the same ball.",
					"linecount" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 395.0, 213.0, 27.0 ],
					"id" : "obj-4",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Convert to greyscale for labeling.",
					"linecount" : 2,
					"numoutlets" : 0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 100.0, 166.0, 108.0, 27.0 ],
					"id" : "obj-5",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Draw 3 randomly moving balls.",
					"linecount" : 2,
					"numoutlets" : 0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 103.0, 130.0, 111.0, 27.0 ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"numoutlets" : 4,
					"selmode" : 0,
					"vscroll" : 0,
					"hscroll" : 0,
					"bgcolor" : [ 0.992218, 0.992218, 0.992218, 1.0 ],
					"patching_rect" : [ 723.0, 432.0, 136.0, 20.0 ],
					"headercolor" : [ 0.743191, 0.743191, 0.743191, 1.0 ],
					"id" : "obj-7",
					"outlettype" : [ "list", "", "", "" ],
					"fontname" : "Geneva",
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"rows" : 1,
					"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"cols" : 3,
					"colwidth" : 45,
					"hcellcolor" : [ 0.836576, 0.836576, 0.933852, 1.0 ],
					"fontsize" : 9.0,
					"rowheight" : 17,
					"numinlets" : 2,
					"precision" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.blobs.color",
					"numoutlets" : 1,
					"patching_rect" : [ 385.0, 438.0, 87.0, 17.0 ],
					"id" : "obj-8",
					"outlettype" : [ "jit_matrix" ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.pwindow",
					"depthbuffer" : 0,
					"numoutlets" : 2,
					"patching_rect" : [ 384.0, 467.0, 320.0, 240.0 ],
					"id" : "obj-9",
					"outlettype" : [ "", "" ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.charmap",
					"numoutlets" : 2,
					"patching_rect" : [ 385.0, 418.0, 62.0, 17.0 ],
					"id" : "obj-10",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p make_charmap",
					"numoutlets" : 1,
					"patching_rect" : [ 437.0, 396.0, 85.0, 17.0 ],
					"id" : "obj-11",
					"outlettype" : [ "jit_matrix" ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 10.0, 59.0, 470.0, 392.0 ],
						"bglocked" : 0,
						"defrect" : [ 10.0, 59.0, 470.0, 392.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numoutlets" : 0,
									"patching_rect" : [ 83.0, 245.0, 15.0, 15.0 ],
									"id" : "obj-1",
									"numinlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numoutlets" : 1,
									"patching_rect" : [ 83.0, 44.0, 15.0, 15.0 ],
									"id" : "obj-2",
									"outlettype" : [ "jit_matrix" ],
									"numinlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t l l clear",
									"numoutlets" : 3,
									"patching_rect" : [ 83.0, 92.0, 52.0, 17.0 ],
									"id" : "obj-3",
									"outlettype" : [ "", "", "clear" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "dstdimend $1, dstdimstart 1",
									"numoutlets" : 1,
									"patching_rect" : [ 104.0, 161.0, 139.0, 15.0 ],
									"id" : "obj-4",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route dim",
									"numoutlets" : 2,
									"patching_rect" : [ 104.0, 139.0, 53.0, 17.0 ],
									"id" : "obj-5",
									"outlettype" : [ "", "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.matrixinfo",
									"numoutlets" : 1,
									"patching_rect" : [ 104.0, 117.0, 72.0, 17.0 ],
									"id" : "obj-6",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.matrix 1 char 256 @usedstdim 1",
									"numoutlets" : 2,
									"patching_rect" : [ 83.0, 188.0, 173.0, 17.0 ],
									"id" : "obj-7",
									"outlettype" : [ "jit_matrix", "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
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
									"source" : [ "obj-3", 1 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 2 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [ 125.5, 113.0, 198.0, 113.0, 198.0, 182.0, 92.5, 182.0 ]
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
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-7", 0 ],
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
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p three_balls",
					"numoutlets" : 1,
					"patching_rect" : [ 28.0, 135.0, 69.0, 17.0 ],
					"id" : "obj-12",
					"outlettype" : [ "jit_matrix" ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 20.0, 74.0, 600.0, 426.0 ],
						"bglocked" : 0,
						"defrect" : [ 20.0, 74.0, 600.0, 426.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.lcd 4 char 320 240",
									"numoutlets" : 2,
									"patching_rect" : [ 60.0, 168.0, 111.0, 17.0 ],
									"id" : "obj-1",
									"outlettype" : [ "jit_matrix", "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadbang",
									"numoutlets" : 1,
									"patching_rect" : [ 317.0, 30.0, 48.0, 17.0 ],
									"id" : "obj-2",
									"outlettype" : [ "bang" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "brgb 0 0 0, frgb 255 255 255",
									"numoutlets" : 1,
									"patching_rect" : [ 317.0, 52.0, 146.0, 15.0 ],
									"id" : "obj-3",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p moving_ball",
									"numoutlets" : 1,
									"patching_rect" : [ 224.0, 104.0, 72.0, 17.0 ],
									"id" : "obj-4",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1,
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 20.0, 74.0, 713.0, 599.0 ],
										"bglocked" : 0,
										"defrect" : [ 20.0, 74.0, 713.0, 599.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 200",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 224.0, 37.0, 17.0 ],
													"id" : "obj-1",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "loadbang",
													"numoutlets" : 1,
													"patching_rect" : [ 331.0, 80.0, 48.0, 17.0 ],
													"id" : "obj-2",
													"outlettype" : [ "bang" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 1
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "b",
													"numoutlets" : 2,
													"patching_rect" : [ 55.0, 62.0, 27.0, 17.0 ],
													"id" : "obj-3",
													"outlettype" : [ "bang", "bang" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 1
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"numoutlets" : 1,
													"patching_rect" : [ 55.0, 27.0, 15.0, 15.0 ],
													"id" : "obj-4",
													"outlettype" : [ "bang" ],
													"numinlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"numoutlets" : 0,
													"patching_rect" : [ 149.0, 505.0, 15.0, 15.0 ],
													"id" : "obj-5",
													"numinlets" : 1,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "paintoval $1 $2 $3 $4",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 479.0, 111.0, 15.0 ],
													"id" : "obj-6",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "- 20",
													"numoutlets" : 1,
													"patching_rect" : [ 182.0, 431.0, 30.0, 17.0 ],
													"id" : "obj-7",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "- 20",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 431.0, 30.0, 17.0 ],
													"id" : "obj-8",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 20",
													"numoutlets" : 1,
													"patching_rect" : [ 248.0, 431.0, 31.0, 17.0 ],
													"id" : "obj-9",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 20",
													"numoutlets" : 1,
													"patching_rect" : [ 215.0, 431.0, 31.0, 17.0 ],
													"id" : "obj-10",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "pack 0 0 0 0",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 454.0, 109.0, 17.0 ],
													"id" : "obj-11",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 4
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "clip 220. 300.",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 319.0, 74.0, 17.0 ],
													"id" : "obj-12",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 3
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "clip 20. 220.",
													"numoutlets" : 1,
													"patching_rect" : [ 234.0, 319.0, 68.0, 17.0 ],
													"id" : "obj-13",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 3
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "sel 1",
													"numoutlets" : 2,
													"patching_rect" : [ 72.0, 107.0, 32.0, 17.0 ],
													"id" : "obj-14",
													"outlettype" : [ "bang", "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 20",
													"numoutlets" : 1,
													"patching_rect" : [ 72.0, 85.0, 58.0, 17.0 ],
													"id" : "obj-15",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "float",
													"numoutlets" : 1,
													"patching_rect" : [ 184.0, 357.0, 31.0, 17.0 ],
													"id" : "obj-16",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "float",
													"numoutlets" : 1,
													"patching_rect" : [ 254.0, 357.0, 31.0, 17.0 ],
													"id" : "obj-17",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 0.",
													"numoutlets" : 1,
													"patching_rect" : [ 234.0, 296.0, 27.0, 17.0 ],
													"id" : "obj-18",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 0.",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 292.0, 27.0, 17.0 ],
													"id" : "obj-19",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 200",
													"numoutlets" : 1,
													"patching_rect" : [ 234.0, 216.0, 64.0, 17.0 ],
													"id" : "obj-20",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 100",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 198.0, 64.0, 17.0 ],
													"id" : "obj-21",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 6.283",
													"numoutlets" : 1,
													"patching_rect" : [ 454.0, 202.0, 47.0, 17.0 ],
													"id" : "obj-22",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 5.",
													"numoutlets" : 1,
													"patching_rect" : [ 388.0, 202.0, 29.0, 17.0 ],
													"id" : "obj-23",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "poltocar",
													"numoutlets" : 2,
													"patching_rect" : [ 388.0, 224.0, 76.0, 17.0 ],
													"id" : "obj-24",
													"outlettype" : [ "float", "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 0.01",
													"numoutlets" : 1,
													"patching_rect" : [ 454.0, 182.0, 41.0, 17.0 ],
													"id" : "obj-25",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 0.01",
													"numoutlets" : 1,
													"patching_rect" : [ 388.0, 182.0, 41.0, 17.0 ],
													"id" : "obj-26",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 100",
													"numoutlets" : 1,
													"patching_rect" : [ 454.0, 161.0, 64.0, 17.0 ],
													"id" : "obj-27",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 100",
													"numoutlets" : 1,
													"patching_rect" : [ 388.0, 161.0, 64.0, 17.0 ],
													"id" : "obj-28",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-22", 0 ],
													"destination" : [ "obj-24", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-25", 0 ],
													"destination" : [ "obj-22", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-27", 0 ],
													"destination" : [ "obj-25", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-14", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 0,
													"midpoints" : [ 81.5, 131.0, 463.5, 131.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-23", 0 ],
													"destination" : [ "obj-24", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-26", 0 ],
													"destination" : [ "obj-23", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-28", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-14", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 0,
													"midpoints" : [ 81.5, 131.0, 397.5, 131.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-13", 0 ],
													"destination" : [ "obj-17", 1 ],
													"hidden" : 0,
													"midpoints" : [ 243.5, 344.0, 275.5, 344.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 0,
													"midpoints" : [ 64.5, 351.0, 263.5, 351.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-24", 1 ],
													"destination" : [ "obj-18", 1 ],
													"hidden" : 0,
													"midpoints" : [ 454.5, 258.0, 251.5, 258.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-9", 0 ],
													"destination" : [ "obj-11", 3 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-13", 0 ],
													"destination" : [ "obj-9", 0 ],
													"hidden" : 0,
													"midpoints" : [ 243.5, 383.0, 257.5, 383.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-18", 0 ],
													"destination" : [ "obj-13", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-17", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 0,
													"midpoints" : [ 263.5, 377.0, 225.0, 377.0, 225.0, 289.0, 243.5, 289.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-20", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-20", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-10", 0 ],
													"destination" : [ "obj-11", 2 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-12", 0 ],
													"destination" : [ "obj-10", 0 ],
													"hidden" : 0,
													"midpoints" : [ 158.5, 412.0, 224.5, 412.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-12", 0 ],
													"destination" : [ "obj-16", 1 ],
													"hidden" : 0,
													"midpoints" : [ 158.5, 346.0, 205.5, 346.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-16", 0 ],
													"hidden" : 0,
													"midpoints" : [ 64.5, 351.0, 193.5, 351.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-7", 0 ],
													"destination" : [ "obj-11", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-13", 0 ],
													"destination" : [ "obj-7", 0 ],
													"hidden" : 0,
													"midpoints" : [ 243.5, 400.0, 191.5, 400.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-24", 0 ],
													"destination" : [ "obj-19", 1 ],
													"hidden" : 0,
													"midpoints" : [ 397.5, 250.0, 166.5, 250.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-6", 0 ],
													"destination" : [ "obj-5", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-11", 0 ],
													"destination" : [ "obj-6", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-8", 0 ],
													"destination" : [ "obj-11", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-12", 0 ],
													"destination" : [ "obj-8", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-19", 0 ],
													"destination" : [ "obj-12", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-16", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 0,
													"midpoints" : [ 193.5, 378.0, 140.0, 378.0, 140.0, 285.0, 158.5, 285.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-21", 0 ],
													"destination" : [ "obj-1", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-21", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-15", 0 ],
													"destination" : [ "obj-14", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 1 ],
													"destination" : [ "obj-15", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-4", 0 ],
													"destination" : [ "obj-3", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
										"default_fontname" : "Arial",
										"fontname" : "Arial",
										"default_fontsize" : 10.0,
										"globalpatchername" : "",
										"fontface" : 0,
										"fontsize" : 10.0,
										"default_fontface" : 0
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p moving_ball",
									"numoutlets" : 1,
									"patching_rect" : [ 148.0, 104.0, 72.0, 17.0 ],
									"id" : "obj-5",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1,
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 20.0, 74.0, 713.0, 599.0 ],
										"bglocked" : 0,
										"defrect" : [ 20.0, 74.0, 713.0, 599.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 100",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 227.0, 37.0, 17.0 ],
													"id" : "obj-1",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "loadbang",
													"numoutlets" : 1,
													"patching_rect" : [ 331.0, 80.0, 48.0, 17.0 ],
													"id" : "obj-2",
													"outlettype" : [ "bang" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 1
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "b",
													"numoutlets" : 2,
													"patching_rect" : [ 55.0, 62.0, 27.0, 17.0 ],
													"id" : "obj-3",
													"outlettype" : [ "bang", "bang" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 1
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"numoutlets" : 1,
													"patching_rect" : [ 55.0, 27.0, 15.0, 15.0 ],
													"id" : "obj-4",
													"outlettype" : [ "bang" ],
													"numinlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"numoutlets" : 0,
													"patching_rect" : [ 149.0, 505.0, 15.0, 15.0 ],
													"id" : "obj-5",
													"numinlets" : 1,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "paintoval $1 $2 $3 $4",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 479.0, 111.0, 15.0 ],
													"id" : "obj-6",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "- 20",
													"numoutlets" : 1,
													"patching_rect" : [ 182.0, 431.0, 30.0, 17.0 ],
													"id" : "obj-7",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "- 20",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 431.0, 30.0, 17.0 ],
													"id" : "obj-8",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 20",
													"numoutlets" : 1,
													"patching_rect" : [ 248.0, 431.0, 31.0, 17.0 ],
													"id" : "obj-9",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 20",
													"numoutlets" : 1,
													"patching_rect" : [ 215.0, 431.0, 31.0, 17.0 ],
													"id" : "obj-10",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "pack 0 0 0 0",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 454.0, 109.0, 17.0 ],
													"id" : "obj-11",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 4
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "clip 120. 179.",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 319.0, 74.0, 17.0 ],
													"id" : "obj-12",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 3
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "clip 20. 220.",
													"numoutlets" : 1,
													"patching_rect" : [ 234.0, 319.0, 68.0, 17.0 ],
													"id" : "obj-13",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 3
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "sel 1",
													"numoutlets" : 2,
													"patching_rect" : [ 72.0, 107.0, 32.0, 17.0 ],
													"id" : "obj-14",
													"outlettype" : [ "bang", "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 20",
													"numoutlets" : 1,
													"patching_rect" : [ 72.0, 85.0, 58.0, 17.0 ],
													"id" : "obj-15",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "float",
													"numoutlets" : 1,
													"patching_rect" : [ 184.0, 357.0, 31.0, 17.0 ],
													"id" : "obj-16",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "float",
													"numoutlets" : 1,
													"patching_rect" : [ 254.0, 357.0, 31.0, 17.0 ],
													"id" : "obj-17",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 0.",
													"numoutlets" : 1,
													"patching_rect" : [ 234.0, 296.0, 27.0, 17.0 ],
													"id" : "obj-18",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 0.",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 292.0, 27.0, 17.0 ],
													"id" : "obj-19",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 200",
													"numoutlets" : 1,
													"patching_rect" : [ 234.0, 216.0, 64.0, 17.0 ],
													"id" : "obj-20",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 100",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 202.0, 64.0, 17.0 ],
													"id" : "obj-21",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 6.283",
													"numoutlets" : 1,
													"patching_rect" : [ 454.0, 202.0, 47.0, 17.0 ],
													"id" : "obj-22",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 5.",
													"numoutlets" : 1,
													"patching_rect" : [ 388.0, 202.0, 29.0, 17.0 ],
													"id" : "obj-23",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "poltocar",
													"numoutlets" : 2,
													"patching_rect" : [ 388.0, 224.0, 76.0, 17.0 ],
													"id" : "obj-24",
													"outlettype" : [ "float", "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 0.01",
													"numoutlets" : 1,
													"patching_rect" : [ 454.0, 182.0, 41.0, 17.0 ],
													"id" : "obj-25",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 0.01",
													"numoutlets" : 1,
													"patching_rect" : [ 388.0, 182.0, 41.0, 17.0 ],
													"id" : "obj-26",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 100",
													"numoutlets" : 1,
													"patching_rect" : [ 454.0, 161.0, 64.0, 17.0 ],
													"id" : "obj-27",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 100",
													"numoutlets" : 1,
													"patching_rect" : [ 388.0, 161.0, 64.0, 17.0 ],
													"id" : "obj-28",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-22", 0 ],
													"destination" : [ "obj-24", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-25", 0 ],
													"destination" : [ "obj-22", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-27", 0 ],
													"destination" : [ "obj-25", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-14", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 0,
													"midpoints" : [ 81.5, 131.0, 463.5, 131.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-23", 0 ],
													"destination" : [ "obj-24", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-26", 0 ],
													"destination" : [ "obj-23", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-28", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-14", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 0,
													"midpoints" : [ 81.5, 131.0, 397.5, 131.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-13", 0 ],
													"destination" : [ "obj-17", 1 ],
													"hidden" : 0,
													"midpoints" : [ 243.5, 344.0, 275.5, 344.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 0,
													"midpoints" : [ 64.5, 351.0, 263.5, 351.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-24", 1 ],
													"destination" : [ "obj-18", 1 ],
													"hidden" : 0,
													"midpoints" : [ 454.5, 258.0, 251.5, 258.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-9", 0 ],
													"destination" : [ "obj-11", 3 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-13", 0 ],
													"destination" : [ "obj-9", 0 ],
													"hidden" : 0,
													"midpoints" : [ 243.5, 383.0, 257.5, 383.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-18", 0 ],
													"destination" : [ "obj-13", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-20", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-17", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 0,
													"midpoints" : [ 263.5, 377.0, 225.0, 377.0, 225.0, 289.0, 243.5, 289.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-20", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-10", 0 ],
													"destination" : [ "obj-11", 2 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-12", 0 ],
													"destination" : [ "obj-10", 0 ],
													"hidden" : 0,
													"midpoints" : [ 158.5, 412.0, 224.5, 412.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-12", 0 ],
													"destination" : [ "obj-16", 1 ],
													"hidden" : 0,
													"midpoints" : [ 158.5, 346.0, 205.5, 346.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-16", 0 ],
													"hidden" : 0,
													"midpoints" : [ 64.5, 351.0, 193.5, 351.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-7", 0 ],
													"destination" : [ "obj-11", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-13", 0 ],
													"destination" : [ "obj-7", 0 ],
													"hidden" : 0,
													"midpoints" : [ 243.5, 400.0, 191.5, 400.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-24", 0 ],
													"destination" : [ "obj-19", 1 ],
													"hidden" : 0,
													"midpoints" : [ 397.5, 250.0, 166.5, 250.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-6", 0 ],
													"destination" : [ "obj-5", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-11", 0 ],
													"destination" : [ "obj-6", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-8", 0 ],
													"destination" : [ "obj-11", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-12", 0 ],
													"destination" : [ "obj-8", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-19", 0 ],
													"destination" : [ "obj-12", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-16", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 0,
													"midpoints" : [ 193.5, 378.0, 140.0, 378.0, 140.0, 285.0, 158.5, 285.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-21", 0 ],
													"destination" : [ "obj-1", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-21", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-15", 0 ],
													"destination" : [ "obj-14", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 1 ],
													"destination" : [ "obj-15", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-4", 0 ],
													"destination" : [ "obj-3", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
										"default_fontname" : "Arial",
										"fontname" : "Arial",
										"default_fontsize" : 10.0,
										"globalpatchername" : "",
										"fontface" : 0,
										"fontsize" : 10.0,
										"default_fontface" : 0
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b b clear",
									"numoutlets" : 3,
									"patching_rect" : [ 50.0, 71.0, 56.0, 17.0 ],
									"id" : "obj-6",
									"outlettype" : [ "bang", "bang", "clear" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p moving_ball",
									"numoutlets" : 1,
									"patching_rect" : [ 73.0, 104.0, 72.0, 17.0 ],
									"id" : "obj-7",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1,
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 20.0, 74.0, 713.0, 599.0 ],
										"bglocked" : 0,
										"defrect" : [ 20.0, 74.0, 713.0, 599.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "loadbang",
													"numoutlets" : 1,
													"patching_rect" : [ 331.0, 80.0, 48.0, 17.0 ],
													"id" : "obj-1",
													"outlettype" : [ "bang" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 1
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "b",
													"numoutlets" : 2,
													"patching_rect" : [ 55.0, 62.0, 27.0, 17.0 ],
													"id" : "obj-2",
													"outlettype" : [ "bang", "bang" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 1
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"numoutlets" : 1,
													"patching_rect" : [ 55.0, 27.0, 15.0, 15.0 ],
													"id" : "obj-3",
													"outlettype" : [ "bang" ],
													"numinlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"numoutlets" : 0,
													"patching_rect" : [ 149.0, 505.0, 15.0, 15.0 ],
													"id" : "obj-4",
													"numinlets" : 1,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "paintoval $1 $2 $3 $4",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 479.0, 111.0, 15.0 ],
													"id" : "obj-5",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "- 20",
													"numoutlets" : 1,
													"patching_rect" : [ 182.0, 431.0, 30.0, 17.0 ],
													"id" : "obj-6",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "- 20",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 431.0, 30.0, 17.0 ],
													"id" : "obj-7",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 20",
													"numoutlets" : 1,
													"patching_rect" : [ 248.0, 431.0, 31.0, 17.0 ],
													"id" : "obj-8",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 20",
													"numoutlets" : 1,
													"patching_rect" : [ 215.0, 431.0, 31.0, 17.0 ],
													"id" : "obj-9",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "pack 0 0 0 0",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 454.0, 109.0, 17.0 ],
													"id" : "obj-10",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 4
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "clip 20. 79.",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 319.0, 62.0, 17.0 ],
													"id" : "obj-11",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 3
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "clip 20. 220.",
													"numoutlets" : 1,
													"patching_rect" : [ 234.0, 319.0, 68.0, 17.0 ],
													"id" : "obj-12",
													"outlettype" : [ "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 3
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "sel 1",
													"numoutlets" : 2,
													"patching_rect" : [ 72.0, 107.0, 32.0, 17.0 ],
													"id" : "obj-13",
													"outlettype" : [ "bang", "" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 20",
													"numoutlets" : 1,
													"patching_rect" : [ 72.0, 85.0, 58.0, 17.0 ],
													"id" : "obj-14",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "float",
													"numoutlets" : 1,
													"patching_rect" : [ 184.0, 357.0, 31.0, 17.0 ],
													"id" : "obj-15",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "float",
													"numoutlets" : 1,
													"patching_rect" : [ 254.0, 357.0, 31.0, 17.0 ],
													"id" : "obj-16",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 0.",
													"numoutlets" : 1,
													"patching_rect" : [ 234.0, 296.0, 27.0, 17.0 ],
													"id" : "obj-17",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "+ 0.",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 292.0, 27.0, 17.0 ],
													"id" : "obj-18",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 200",
													"numoutlets" : 1,
													"patching_rect" : [ 234.0, 216.0, 64.0, 17.0 ],
													"id" : "obj-19",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 100",
													"numoutlets" : 1,
													"patching_rect" : [ 149.0, 216.0, 64.0, 17.0 ],
													"id" : "obj-20",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 6.283",
													"numoutlets" : 1,
													"patching_rect" : [ 454.0, 202.0, 47.0, 17.0 ],
													"id" : "obj-21",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 5.",
													"numoutlets" : 1,
													"patching_rect" : [ 388.0, 202.0, 29.0, 17.0 ],
													"id" : "obj-22",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "poltocar",
													"numoutlets" : 2,
													"patching_rect" : [ 388.0, 224.0, 76.0, 17.0 ],
													"id" : "obj-23",
													"outlettype" : [ "float", "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 0.01",
													"numoutlets" : 1,
													"patching_rect" : [ 454.0, 182.0, 41.0, 17.0 ],
													"id" : "obj-24",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "* 0.01",
													"numoutlets" : 1,
													"patching_rect" : [ 388.0, 182.0, 41.0, 17.0 ],
													"id" : "obj-25",
													"outlettype" : [ "float" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 100",
													"numoutlets" : 1,
													"patching_rect" : [ 454.0, 161.0, 64.0, 17.0 ],
													"id" : "obj-26",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "random 100",
													"numoutlets" : 1,
													"patching_rect" : [ 388.0, 161.0, 64.0, 17.0 ],
													"id" : "obj-27",
													"outlettype" : [ "int" ],
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"numinlets" : 2
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-21", 0 ],
													"destination" : [ "obj-23", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-24", 0 ],
													"destination" : [ "obj-21", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-26", 0 ],
													"destination" : [ "obj-24", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-13", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 0,
													"midpoints" : [ 81.5, 131.0, 463.5, 131.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-22", 0 ],
													"destination" : [ "obj-23", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-25", 0 ],
													"destination" : [ "obj-22", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-27", 0 ],
													"destination" : [ "obj-25", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-13", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 0,
													"midpoints" : [ 81.5, 131.0, 397.5, 131.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-12", 0 ],
													"destination" : [ "obj-16", 1 ],
													"hidden" : 0,
													"midpoints" : [ 243.5, 344.0, 275.5, 344.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-16", 0 ],
													"hidden" : 0,
													"midpoints" : [ 64.5, 351.0, 263.5, 351.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-23", 1 ],
													"destination" : [ "obj-17", 1 ],
													"hidden" : 0,
													"midpoints" : [ 454.5, 258.0, 251.5, 258.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-8", 0 ],
													"destination" : [ "obj-10", 3 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-12", 0 ],
													"destination" : [ "obj-8", 0 ],
													"hidden" : 0,
													"midpoints" : [ 243.5, 383.0, 257.5, 383.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-17", 0 ],
													"destination" : [ "obj-12", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-16", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 0,
													"midpoints" : [ 263.5, 377.0, 225.0, 377.0, 225.0, 289.0, 243.5, 289.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-19", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-9", 0 ],
													"destination" : [ "obj-10", 2 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-11", 0 ],
													"destination" : [ "obj-9", 0 ],
													"hidden" : 0,
													"midpoints" : [ 158.5, 412.0, 224.5, 412.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-11", 0 ],
													"destination" : [ "obj-15", 1 ],
													"hidden" : 0,
													"midpoints" : [ 158.5, 346.0, 205.5, 346.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-15", 0 ],
													"hidden" : 0,
													"midpoints" : [ 64.5, 351.0, 193.5, 351.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-6", 0 ],
													"destination" : [ "obj-10", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-12", 0 ],
													"destination" : [ "obj-6", 0 ],
													"hidden" : 0,
													"midpoints" : [ 243.5, 400.0, 191.5, 400.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-23", 0 ],
													"destination" : [ "obj-18", 1 ],
													"hidden" : 0,
													"midpoints" : [ 397.5, 250.0, 166.5, 250.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-5", 0 ],
													"destination" : [ "obj-4", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-10", 0 ],
													"destination" : [ "obj-5", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-7", 0 ],
													"destination" : [ "obj-10", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-11", 0 ],
													"destination" : [ "obj-7", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-18", 0 ],
													"destination" : [ "obj-11", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-20", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-15", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 0,
													"midpoints" : [ 193.5, 378.0, 140.0, 378.0, 140.0, 285.0, 158.5, 285.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-20", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-14", 0 ],
													"destination" : [ "obj-13", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 1 ],
													"destination" : [ "obj-14", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-2", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
										"default_fontname" : "Arial",
										"fontname" : "Arial",
										"default_fontsize" : 10.0,
										"globalpatchername" : "",
										"fontface" : 0,
										"fontsize" : 10.0,
										"default_fontface" : 0
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 33",
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 50.0, 52.0, 17.0 ],
									"id" : "obj-8",
									"outlettype" : [ "bang" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 30.0, 15.0, 15.0 ],
									"id" : "obj-9",
									"outlettype" : [ "int" ],
									"numinlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numoutlets" : 0,
									"patching_rect" : [ 60.0, 244.0, 15.0, 15.0 ],
									"id" : "obj-10",
									"numinlets" : 1,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
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
									"midpoints" : [ 78.0, 97.0, 233.5, 97.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 78.0, 97.0, 157.5, 97.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 2 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 326.5, 148.0, 69.5, 148.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-1", 0 ],
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
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-6", 0 ],
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
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.blobs.sort @threshold 20",
					"numoutlets" : 2,
					"patching_rect" : [ 437.0, 354.0, 151.0, 17.0 ],
					"id" : "obj-13",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.blobs.centroids",
					"numoutlets" : 2,
					"patching_rect" : [ 437.0, 324.0, 106.0, 17.0 ],
					"id" : "obj-14",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.blobs.color",
					"numoutlets" : 1,
					"patching_rect" : [ 28.0, 399.0, 87.0, 17.0 ],
					"id" : "obj-15",
					"outlettype" : [ "jit_matrix" ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.label @charmode 1",
					"numoutlets" : 2,
					"patching_rect" : [ 28.0, 224.0, 122.0, 17.0 ],
					"id" : "obj-16",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.rgb2luma",
					"numoutlets" : 2,
					"patching_rect" : [ 28.0, 166.0, 66.0, 17.0 ],
					"id" : "obj-17",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numoutlets" : 1,
					"patching_rect" : [ 28.0, 108.0, 15.0, 15.0 ],
					"id" : "obj-18",
					"outlettype" : [ "int" ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.pwindow",
					"depthbuffer" : 0,
					"numoutlets" : 2,
					"patching_rect" : [ 27.0, 467.0, 320.0, 240.0 ],
					"id" : "obj-19",
					"outlettype" : [ "", "" ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Labeling must be done with char output.",
					"linecount" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 507.0, 513.0, 102.0, 27.0 ],
					"id" : "obj-20",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "1-plane single-row char",
					"numoutlets" : 0,
					"patching_rect" : [ 655.0, 342.0, 163.0, 17.0 ],
					"id" : "obj-21",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "3 or 17-plane single-row float32",
					"numoutlets" : 0,
					"patching_rect" : [ 653.0, 307.0, 163.0, 17.0 ],
					"id" : "obj-22",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Output:",
					"numoutlets" : 0,
					"frgb" : [ 0.968627, 0.968627, 0.968627, 1.0 ],
					"patching_rect" : [ 607.0, 342.0, 185.0, 17.0 ],
					"id" : "obj-23",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"textcolor" : [ 0.968627, 0.968627, 0.968627, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Input:",
					"numoutlets" : 0,
					"frgb" : [ 0.968627, 0.968627, 0.968627, 1.0 ],
					"patching_rect" : [ 607.0, 307.0, 185.0, 17.0 ],
					"id" : "obj-24",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"textcolor" : [ 0.968627, 0.968627, 0.968627, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"patching_rect" : [ 603.0, 300.0, 51.0, 37.0 ],
					"border" : 1,
					"id" : "obj-25",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"patching_rect" : [ 603.0, 300.0, 218.0, 36.0 ],
					"border" : 1,
					"id" : "obj-26",
					"bordercolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Labeling connected components with cv.jit.label, one often runs into the problem of objects having different labels from frame to frame due to changing position or area.\ncv.jit.blobs.sort provides a simple solution to this problem, that although might not work in every situation, at least greatly simplifies simple blob tracking.\nBlob centroids must first be computed using either cv.jit.blobs.centroids or cv.jit.blob.moments. For every blob identified in the current frame, the object tries to find the blob that was closest in the previous frame. If that blob is within user-defined bounds, it is considered to be the same and it is given the same label. If no corresponding blobs could be found in the previous frame, it is given a new label.\n\nThe output is a 1-plane single-row char matrix. The number of cells corresponds to the number of blobs in the image. The value of the output is that blob's permanent label. Once a blob dissapears, its label is freed so it can be taken by a new blob.\n",
					"linecount" : 12,
					"numoutlets" : 0,
					"patching_rect" : [ 265.0, 101.0, 474.0, 144.0 ],
					"id" : "obj-27",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Turn on animation",
					"numoutlets" : 0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 49.0, 109.0, 135.0, 17.0 ],
					"id" : "obj-32",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "cv.jit.blobs.sort: re-order labels for continuity",
					"numoutlets" : 0,
					"frgb" : [ 0.054902, 0.2, 0.270588, 1.0 ],
					"patching_rect" : [ 14.0, 23.0, 684.0, 34.0 ],
					"id" : "obj-33",
					"fontname" : "Arial",
					"fontsize" : 24.0,
					"textcolor" : [ 0.054902, 0.2, 0.270588, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.435294, 0.498039, 0.494118, 1.0 ],
					"patching_rect" : [ 14.0, 95.0, 214.0, 118.0 ],
					"id" : "obj-34",
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.968627, 0.972549, 0.972549, 1.0 ],
					"patching_rect" : [ 19.0, 387.0, 326.0, 44.0 ],
					"border" : 1,
					"id" : "obj-35",
					"bordercolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.858824, 0.878431, 0.862745, 1.0 ],
					"patching_rect" : [ 430.0, 350.0, 166.0, 26.0 ],
					"border" : 1,
					"id" : "obj-36",
					"bordercolor" : [ 0.5, 0.5, 0.5, 0.5 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"patching_rect" : [ 603.0, 334.0, 51.0, 37.0 ],
					"border" : 1,
					"id" : "obj-37",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"patching_rect" : [ 603.0, 335.0, 218.0, 36.0 ],
					"border" : 1,
					"id" : "obj-38",
					"bordercolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 14.0, 52.0, 600.0, 4.0 ],
					"id" : "obj-40",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"patching_rect" : [ 14.0, 51.0, 600.0, 5.0 ],
					"id" : "obj-41",
					"bordercolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 22.0, 390.0, 327.0, 45.0 ],
					"id" : "obj-42",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 17.0, 98.0, 216.0, 119.0 ],
					"id" : "obj-43",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 606.0, 303.0, 218.0, 72.0 ],
					"id" : "obj-44",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"patching_rect" : [ 251.0, 94.0, 553.0, 184.0 ],
					"border" : 1,
					"id" : "obj-45",
					"bordercolor" : [ 0.5, 0.5, 0.5, 0.5 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 255.0, 99.0, 553.0, 184.0 ],
					"id" : "obj-46",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 211.0, 114.0, 148.0, 4.0 ],
					"id" : "obj-47",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 211.0, 106.0, 148.0, 4.0 ],
					"id" : "obj-48",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 211.0, 98.0, 148.0, 4.0 ],
					"id" : "obj-49",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 711.0, 213.0, 4.0, 98.0 ],
					"id" : "obj-50",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 702.0, 213.0, 4.0, 98.0 ],
					"id" : "obj-51",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 693.0, 213.0, 4.0, 98.0 ],
					"id" : "obj-52",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bgcolor 210 210 195",
					"hidden" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 533.0, 613.0, 106.0, 17.0 ],
					"id" : "obj-53",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "fpic",
					"numoutlets" : 0,
					"patching_rect" : [ 606.0, 18.0, 255.0, 72.0 ],
					"pic" : "cvtitle.gif",
					"id" : "obj-54",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "You MUST label the image with ¥\"charmode¥\" set to 1 and calculate moments before processing!",
					"linecount" : 5,
					"numoutlets" : 0,
					"patching_rect" : [ 486.0, 501.0, 113.0, 58.0 ],
					"id" : "obj-55",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Re-ordered labels.",
					"numoutlets" : 0,
					"patching_rect" : [ 746.0, 415.0, 100.0, 17.0 ],
					"id" : "obj-56",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Notice that the colour stays the same after processing.",
					"linecount" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 501.0, 419.0, 169.0, 27.0 ],
					"id" : "obj-57",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.968627, 0.972549, 0.972549, 1.0 ],
					"patching_rect" : [ 373.0, 392.0, 327.0, 68.0 ],
					"border" : 1,
					"id" : "obj-58",
					"bordercolor" : [ 0.584314, 0.215686, 0.215686, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.713726, 0.752941, 0.721569, 1.0 ],
					"patching_rect" : [ 376.0, 395.0, 328.0, 69.0 ],
					"id" : "obj-59",
					"bordercolor" : [ 0.776471, 0.776471, 0.776471, 1.0 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [ 446.5, 384.0, 732.5, 384.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-10", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
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
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [ 37.5, 304.0, 446.5, 304.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 37.5, 297.0, 394.5, 297.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-15", 0 ],
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
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}

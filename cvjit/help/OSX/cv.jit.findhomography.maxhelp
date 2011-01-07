{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 37.0, 44.0, 1045.0, 492.0 ],
		"bgcolor" : [ 0.945098, 0.905882, 0.87451, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 37.0, 44.0, 1045.0, 492.0 ],
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
					"varname" : "output-description[3]",
					"text" : "This external is like cv.jit.getperspective except it needs 1-plane n x 2 matrix input instead of 2-plabe n x 1 due to an OpenCV issue",
					"linecount" : 4,
					"fontsize" : 11.0,
					"numoutlets" : 0,
					"patching_rect" : [ 630.0, 270.0, 207.0, 57.0 ],
					"id" : "obj-11",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "rotation by 45° clockwise around z-axis about the origin",
					"linecount" : 3,
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 840.0, 180.0, 117.0, 41.0 ],
					"id" : "obj-104",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "scale 0.5",
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 840.0, 165.0, 51.0, 18.0 ],
					"id" : "obj-103",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "identity",
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 840.0, 150.0, 42.0, 18.0 ],
					"id" : "obj-102",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "try some values :",
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 825.0, 135.0, 86.0, 18.0 ],
					"id" : "obj-100",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p some-example",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 480.0, 225.0, 84.0, 18.0 ],
					"id" : "obj-98",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 68.0, 142.0, 1114.0, 581.0 ],
						"bglocked" : 0,
						"defrect" : [ 68.0, 142.0, 1114.0, 581.0 ],
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
									"maxclass" : "message",
									"text" : "-1.414214 0. 0. 1.414214 0. -1.414214 1.414214 0.",
									"fontsize" : 10.0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 528.0, 228.0, 237.0, 16.0 ],
									"id" : "obj-12",
									"fontname" : "Arial",
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "-1 1 -1 1 -1 -1 1 1",
									"fontsize" : 10.0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.0, 228.0, 88.0, 16.0 ],
									"id" : "obj-10",
									"fontname" : "Arial",
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "-0.5 0.5 -0.5 0.5 -0.5 -0.5 0.5 0.5",
									"fontsize" : 10.0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 348.0, 228.0, 154.0, 16.0 ],
									"id" : "obj-9",
									"fontname" : "Arial",
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.fill src",
									"fontsize" : 10.0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 348.0, 252.0, 46.0, 18.0 ],
									"id" : "obj-7",
									"fontname" : "Arial",
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b i",
									"fontsize" : 10.0,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "int" ],
									"patching_rect" : [ 48.0, 72.0, 32.5, 18.0 ],
									"id" : "obj-6",
									"fontname" : "Arial",
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "-1 1 -1 1 -1 -1 1 1",
									"fontsize" : 10.0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 48.0, 228.0, 88.0, 16.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.fill dst",
									"fontsize" : 10.0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 48.0, 252.0, 46.0, 18.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 0 1 2",
									"fontsize" : 10.0,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "bang", "" ],
									"patching_rect" : [ 60.0, 96.0, 59.5, 18.0 ],
									"id" : "obj-92",
									"fontname" : "Arial",
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 48.0, 36.0, 25.0, 25.0 ],
									"id" : "obj-95",
									"numinlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numoutlets" : 0,
									"patching_rect" : [ 48.0, 276.0, 25.0, 25.0 ],
									"id" : "obj-96",
									"numinlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numoutlets" : 0,
									"patching_rect" : [ 348.0, 288.0, 25.0, 25.0 ],
									"id" : "obj-97",
									"numinlets" : 1,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-92", 2 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-92", 0 ],
									"destination" : [ "obj-10", 0 ],
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
									"source" : [ "obj-92", 1 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-97", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-7", 0 ],
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
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-92", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-95", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-96", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "radiogroup",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 825.0, 150.0, 18.0, 47.0 ],
					"id" : "obj-93",
					"offset" : 15,
					"numinlets" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"itemtype" : 0,
					"size" : 3,
					"value" : 0,
					"disabled" : [ 0, 0, 0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "destination points A'             B'              C'             D'",
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 555.0, 90.0, 254.0, 18.0 ],
					"id" : "obj-84",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "plane 2 : y",
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 315.0, 135.0, 57.0, 18.0 ],
					"id" : "obj-81",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "plane 1 : x",
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 315.0, 113.0, 57.0, 18.0 ],
					"id" : "obj-80",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "", "" ],
					"patching_rect" : [ 615.0, 90.0, 118.0, 18.0 ],
					"id" : "obj-69",
					"fontname" : "Arial",
					"numinlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 0.0, 0.0, 640.0, 480.0 ],
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
									"text" : "loadbang",
									"hidden" : 1,
									"fontsize" : 10.0,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 100.0, 52.0, 18.0 ],
									"id" : "obj-36",
									"fontname" : "Arial",
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 3",
									"hidden" : 1,
									"fontsize" : 10.0,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 41.0, 18.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "deferlow",
									"hidden" : 1,
									"fontsize" : 10.0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 130.0, 48.0, 18.0 ],
									"id" : "obj-23",
									"fontname" : "Arial",
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b",
									"hidden" : 1,
									"fontsize" : 10.0,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 65.0, 186.0, 31.0, 18.0 ],
									"id" : "obj-24",
									"fontname" : "Arial",
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "plane 1",
									"hidden" : 1,
									"fontsize" : 10.0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 65.0, 216.0, 43.0, 16.0 ],
									"id" : "obj-27",
									"fontname" : "Arial",
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "plane 0",
									"hidden" : 1,
									"fontsize" : 10.0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 216.0, 43.0, 16.0 ],
									"id" : "obj-28",
									"fontname" : "Arial",
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 292.0, 25.0, 25.0 ],
									"id" : "obj-40",
									"numinlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numoutlets" : 0,
									"patching_rect" : [ 65.0, 292.0, 25.0, 25.0 ],
									"id" : "obj-41",
									"numinlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numoutlets" : 0,
									"patching_rect" : [ 125.0, 292.0, 25.0, 25.0 ],
									"id" : "obj-67",
									"numinlets" : 1,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-28", 0 ],
									"destination" : [ "obj-67", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-27", 0 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-36", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 1,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 1 ],
									"destination" : [ "obj-24", 0 ],
									"hidden" : 1,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 1 ],
									"destination" : [ "obj-28", 0 ],
									"hidden" : 1,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 0 ],
									"destination" : [ "obj-27", 0 ],
									"hidden" : 1,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-23", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 1,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b",
					"fontsize" : 10.0,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 615.0, 165.0, 22.0, 18.0 ],
					"id" : "obj-75",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"selmode" : 5,
					"fontsize" : 10.0,
					"numoutlets" : 4,
					"rows" : 2,
					"outlettype" : [ "list", "", "", "" ],
					"cols" : 4,
					"patching_rect" : [ 615.0, 112.0, 200.0, 41.0 ],
					"id" : "obj-77",
					"fontname" : "Arial",
					"colwidth" : 50,
					"rowheight" : 20,
					"vscroll" : 0,
					"numinlets" : 2,
					"hscroll" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.matrix src 1 float32 4 2",
					"fontsize" : 10.0,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 615.0, 195.0, 122.0, 18.0 ],
					"id" : "obj-78",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 375.0, 90.0, 118.0, 18.0 ],
					"id" : "obj-68",
					"fontname" : "Arial",
					"numinlets" : 0,
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
						"boxes" : [  ],
						"lines" : [  ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b",
					"fontsize" : 10.0,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 375.0, 165.0, 22.0, 18.0 ],
					"id" : "obj-25",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"selmode" : 5,
					"fontsize" : 10.0,
					"numoutlets" : 4,
					"rows" : 2,
					"outlettype" : [ "list", "", "", "" ],
					"cols" : 4,
					"patching_rect" : [ 375.0, 112.0, 200.0, 40.0 ],
					"id" : "obj-33",
					"fontname" : "Arial",
					"colwidth" : 50,
					"rowheight" : 20,
					"vscroll" : 0,
					"numinlets" : 2,
					"hscroll" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.matrix dst 1 float32 4 2",
					"fontsize" : 10.0,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 375.0, 195.0, 122.0, 18.0 ],
					"id" : "obj-35",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"selmode" : 5,
					"fontsize" : 12.0,
					"numoutlets" : 4,
					"rows" : 3,
					"outlettype" : [ "list", "", "", "" ],
					"cols" : 3,
					"patching_rect" : [ 375.0, 363.0, 198.0, 54.0 ],
					"id" : "obj-1",
					"fontname" : "Arial",
					"vscroll" : 0,
					"numinlets" : 2,
					"hscroll" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cvjit_random_bg_colour",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"patching_rect" : [ 44.0, 268.0, 117.0, 18.0 ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bgcolor",
					"hidden" : 1,
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 44.0, 292.546204, 165.5, 18.0 ],
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "copyright-comment",
					"text" : "Copyright © 2010",
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"patching_rect" : [ 50.0, 410.0, 111.0, 18.0 ],
					"id" : "obj-17",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "support-comment",
					"fontsize" : 9.0,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 378.0, 240.0, 17.0 ],
					"id" : "obj-18",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "email-comment",
					"text" : "antoine.villeret@gmail.com",
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"patching_rect" : [ 159.0, 345.0, 131.0, 18.0 ],
					"id" : "obj-19",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "me-comment",
					"text" : "By Antoine Villeret",
					"fontsize" : 12.0,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 343.0, 135.0, 20.0 ],
					"id" : "obj-22",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-comment",
					"text" : "Output",
					"fontsize" : 11.0,
					"numoutlets" : 0,
					"patching_rect" : [ 55.5, 206.5, 44.0, 19.0 ],
					"id" : "obj-31",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "input-comment",
					"text" : "Input",
					"fontsize" : 11.0,
					"numoutlets" : 0,
					"patching_rect" : [ 60.0, 165.5, 35.0, 19.0 ],
					"id" : "obj-34",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "input-description",
					"text" : "1 plane, float32, n columns x 2 rows matrix, n>=4",
					"linecount" : 2,
					"fontsize" : 11.0,
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 159.0, 179.0, 32.0 ],
					"id" : "obj-37",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-description",
					"text" : "1 plane, float32, 3 x 3 transformation matrix",
					"linecount" : 2,
					"fontsize" : 11.0,
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 200.0, 175.0, 32.0 ],
					"id" : "obj-38",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "io-cat-panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 50.0, 154.0, 55.0, 83.0 ],
					"id" : "obj-39",
					"rounded" : 0,
					"numinlets" : 1,
					"bgcolor" : [ 0.556863, 0.556863, 0.556863, 0.2 ],
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "output-panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 50.0, 195.0, 240.0, 42.0 ],
					"id" : "obj-42",
					"rounded" : 0,
					"numinlets" : 1,
					"bgcolor" : [ 0.615686, 0.607843, 0.607843, 0.2 ],
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "input-panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 50.0, 154.0, 240.0, 42.0 ],
					"id" : "obj-44",
					"rounded" : 0,
					"numinlets" : 1,
					"bgcolor" : [ 0.615686, 0.607843, 0.607843, 0.2 ],
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "copyright-panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 45.0, 338.0, 250.0, 95.0 ],
					"id" : "obj-49",
					"numinlets" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.403922 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.647059 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "comments",
					"text" : "This external calculates a matrix of perspective transforms form 4 couples of corresponding points. Useful for tracking calibration.",
					"linecount" : 3,
					"fontsize" : 11.0,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 95.0, 240.0, 44.0 ],
					"id" : "obj-62",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "comments-panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 45.0, 90.0, 250.0, 54.0 ],
					"id" : "obj-65",
					"rounded" : 0,
					"numinlets" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.517647 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "io-panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 45.0, 149.0, 250.0, 93.0 ],
					"id" : "obj-5",
					"rounded" : 0,
					"numinlets" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.403922 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.517647 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.findhomography",
					"fontsize" : 10.0,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 375.0, 285.0, 104.0, 18.0 ],
					"id" : "obj-71",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "fpic",
					"numoutlets" : 0,
					"patching_rect" : [ 754.0, 7.0, 255.0, 72.0 ],
					"pic" : "cvtitle.png",
					"id" : "obj-2",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 0.0, 45.0, 778.0, 4.0 ],
					"id" : "obj-20",
					"rounded" : 0,
					"numinlets" : 1,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.207843 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Calculates the perspective transform from n corresponding points.",
					"fontsize" : 20.0,
					"numoutlets" : 0,
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"patching_rect" : [ 30.0, 45.0, 594.0, 29.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "cv.jit.findhomography",
					"fontface" : 1,
					"fontsize" : 30.028469,
					"numoutlets" : 0,
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"patching_rect" : [ 30.0, 15.0, 565.0, 41.0 ],
					"id" : "obj-15",
					"fontname" : "Arial",
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 371.0, 281.0, 113.0, 26.0 ],
					"id" : "obj-9",
					"rounded" : 30,
					"numinlets" : 1,
					"bgcolor" : [ 0.0, 0.0, 1.0, 0.05098 ],
					"bordercolor" : [ 0.0, 0.0, 1.0, 0.733333 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "source points      A               B               C              D",
					"fontsize" : 10.0,
					"numoutlets" : 0,
					"patching_rect" : [ 315.0, 90.0, 236.0, 18.0 ],
					"id" : "obj-83",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 622.0, 262.0, 225.0, 74.0 ],
					"id" : "obj-66",
					"rounded" : 0,
					"numinlets" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.396078 ],
					"bordercolor" : [ 1.0, 0.0, 0.0, 0.647059 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 315.0, 90.0, 636.0, 131.0 ],
					"background" : 1,
					"id" : "obj-58",
					"rounded" : 0,
					"numinlets" : 1,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.2 ],
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 367.0, 276.0, 121.0, 35.0 ],
					"background" : 1,
					"id" : "obj-141",
					"rounded" : 15,
					"numinlets" : 1,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 0.0 ],
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"border" : 1,
					"patching_rect" : [ 367.0, 345.0, 215.0, 87.0 ],
					"background" : 1,
					"id" : "obj-147",
					"rounded" : 15,
					"numinlets" : 1,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.101961 ],
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-98", 1 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-77", 0 ],
					"hidden" : 1,
					"midpoints" : [ 624.5, 226.0, 602.0, 226.0, 602.0, 109.0, 624.5, 109.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-71", 1 ],
					"hidden" : 0,
					"midpoints" : [ 624.5, 248.5, 469.5, 248.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-98", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 1,
					"midpoints" : [ 384.5, 226.0, 362.0, 226.0, 362.0, 109.0, 384.5, 109.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [ 624.5, 188.5, 384.5, 188.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-93", 0 ],
					"destination" : [ "obj-98", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-77", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [ 624.5, 162.5, 624.5, 162.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 2 ],
					"destination" : [ "obj-77", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [ 384.5, 158.0, 384.5, 158.0 ]
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
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}

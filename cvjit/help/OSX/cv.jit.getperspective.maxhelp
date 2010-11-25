{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 37.0, 44.0, 1045.0, 492.0 ],
		"bgcolor" : [ 0.945098, 0.909804, 0.894118, 1.0 ],
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
					"text" : "rotation by 45° clockwise around z-axis about the origin",
					"linecount" : 3,
					"fontsize" : 10.0,
					"id" : "obj-104",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 840.0, 180.0, 117.0, 41.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "scale 0.5",
					"fontsize" : 10.0,
					"id" : "obj-103",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 840.0, 165.0, 51.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "identity",
					"fontsize" : 10.0,
					"id" : "obj-102",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 840.0, 150.0, 42.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "try some values :",
					"fontsize" : 10.0,
					"id" : "obj-100",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 825.0, 135.0, 86.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p some-example",
					"hidden" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "", "" ],
					"id" : "obj-98",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 480.0, 225.0, 84.0, 18.0 ],
					"numoutlets" : 2,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 23.0, 144.0, 1114.0, 581.0 ],
						"bglocked" : 0,
						"defrect" : [ 23.0, 144.0, 1114.0, 581.0 ],
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
									"text" : "1.414214",
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"numinlets" : 2,
									"patching_rect" : [ 624.0, 108.0, 52.0, 16.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "setcell 0 val -1.414214 0., setcell 1 val 0 -1.414214, setcell 2 val 0 1.414214, setcell 3 val 1.414214 0., bang",
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-1",
									"fontname" : "Arial",
									"numinlets" : 2,
									"patching_rect" : [ 528.0, 204.0, 487.0, 16.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "setcell 0 val -1 -1, setcell 1 val 1 -1, setcell 2 val -1 1, setcell 3 val 1 1, bang",
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-94",
									"fontname" : "Arial",
									"numinlets" : 2,
									"patching_rect" : [ 492.0, 180.0, 344.0, 16.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 0 1 2",
									"fontsize" : 10.0,
									"outlettype" : [ "bang", "bang", "bang", "" ],
									"id" : "obj-92",
									"fontname" : "Arial",
									"numinlets" : 1,
									"patching_rect" : [ 48.0, 96.0, 59.5, 18.0 ],
									"numoutlets" : 4
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "setcell 0 val -0.5 -0.5, setcell 1 val 0.5 -0.5, setcell 2 val -0.5 0.5, setcell 3 val 0.5 0.5, bang",
									"linecount" : 2,
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-70",
									"fontname" : "Arial",
									"numinlets" : 2,
									"patching_rect" : [ 96.0, 180.0, 388.0, 27.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "setcell 0 val -1 -1, setcell 1 val 1 -1, setcell 2 val -1 1, setcell 3 val 1 1, bang",
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-26",
									"fontname" : "Arial",
									"numinlets" : 2,
									"patching_rect" : [ 48.0, 300.0, 344.0, 16.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "" ],
									"id" : "obj-95",
									"numinlets" : 0,
									"patching_rect" : [ 48.0, 36.0, 25.0, 25.0 ],
									"numoutlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-96",
									"numinlets" : 1,
									"patching_rect" : [ 48.0, 348.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-97",
									"numinlets" : 1,
									"patching_rect" : [ 492.0, 324.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-92", 2 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-70", 0 ],
									"destination" : [ "obj-97", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-94", 0 ],
									"destination" : [ "obj-97", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-96", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-95", 0 ],
									"destination" : [ "obj-92", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-92", 1 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-92", 0 ],
									"destination" : [ "obj-94", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-92", 1 ],
									"destination" : [ "obj-70", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-92", 0 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-97", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-92", 2 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 10.0,
						"default_fontsize" : 10.0,
						"fontname" : "Arial",
						"default_fontface" : 0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "radiogroup",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"outlettype" : [ "" ],
					"id" : "obj-93",
					"numinlets" : 1,
					"offset" : 15,
					"patching_rect" : [ 825.0, 150.0, 18.0, 47.0 ],
					"numoutlets" : 1,
					"itemtype" : 0,
					"size" : 3,
					"value" : 2,
					"disabled" : [ 0, 0, 0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "destination points A'             B'              C'             D'",
					"fontsize" : 10.0,
					"id" : "obj-84",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 555.0, 90.0, 254.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "source points      A               B               C              D",
					"fontsize" : 10.0,
					"id" : "obj-83",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 315.0, 90.0, 236.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "plane 2 : y",
					"fontsize" : 10.0,
					"id" : "obj-81",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 315.0, 135.0, 57.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "plane 1 : x",
					"fontsize" : 10.0,
					"id" : "obj-80",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 315.0, 113.0, 57.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p",
					"hidden" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "bang", "", "" ],
					"id" : "obj-69",
					"fontname" : "Arial",
					"numinlets" : 0,
					"patching_rect" : [ 615.0, 90.0, 118.0, 18.0 ],
					"numoutlets" : 3,
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
									"outlettype" : [ "bang" ],
									"id" : "obj-36",
									"fontname" : "Arial",
									"numinlets" : 1,
									"patching_rect" : [ 50.0, 100.0, 52.0, 18.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 3",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "bang", "bang", "bang" ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"numinlets" : 1,
									"patching_rect" : [ 50.0, 160.0, 41.0, 18.0 ],
									"numoutlets" : 3
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "deferlow",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-23",
									"fontname" : "Arial",
									"numinlets" : 1,
									"patching_rect" : [ 50.0, 130.0, 48.0, 18.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "bang", "bang" ],
									"id" : "obj-24",
									"fontname" : "Arial",
									"numinlets" : 1,
									"patching_rect" : [ 65.0, 186.0, 31.0, 18.0 ],
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "plane 1",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-27",
									"fontname" : "Arial",
									"numinlets" : 2,
									"patching_rect" : [ 65.0, 216.0, 43.0, 16.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "plane 0",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-28",
									"fontname" : "Arial",
									"numinlets" : 2,
									"patching_rect" : [ 125.0, 216.0, 43.0, 16.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-40",
									"numinlets" : 1,
									"patching_rect" : [ 50.0, 292.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-41",
									"numinlets" : 1,
									"patching_rect" : [ 65.0, 292.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-67",
									"numinlets" : 1,
									"patching_rect" : [ 125.0, 292.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-23", 0 ],
									"destination" : [ "obj-3", 0 ],
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
									"source" : [ "obj-24", 1 ],
									"destination" : [ "obj-28", 0 ],
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
									"source" : [ "obj-36", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 1,
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
									"source" : [ "obj-27", 0 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-28", 0 ],
									"destination" : [ "obj-67", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 10.0,
						"default_fontsize" : 10.0,
						"fontname" : "Arial",
						"default_fontface" : 0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b",
					"fontsize" : 10.0,
					"outlettype" : [ "bang" ],
					"id" : "obj-75",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 615.0, 165.0, 22.0, 18.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"rows" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "list", "", "", "" ],
					"cols" : 4,
					"selmode" : 5,
					"hscroll" : 0,
					"rowheight" : 20,
					"id" : "obj-76",
					"fontname" : "Arial",
					"vscroll" : 0,
					"numinlets" : 2,
					"patching_rect" : [ 615.0, 135.0, 200.0, 20.0 ],
					"colwidth" : 50,
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"rows" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "list", "", "", "" ],
					"cols" : 4,
					"selmode" : 5,
					"hscroll" : 0,
					"rowheight" : 20,
					"id" : "obj-77",
					"fontname" : "Arial",
					"vscroll" : 0,
					"numinlets" : 2,
					"patching_rect" : [ 615.0, 112.0, 200.0, 20.0 ],
					"colwidth" : 50,
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.matrix 2 float32 4 1",
					"fontsize" : 10.0,
					"outlettype" : [ "jit_matrix", "" ],
					"id" : "obj-78",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 615.0, 195.0, 106.0, 18.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p",
					"hidden" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "bang", "", "" ],
					"id" : "obj-68",
					"fontname" : "Arial",
					"numinlets" : 0,
					"patching_rect" : [ 375.0, 90.0, 118.0, 18.0 ],
					"numoutlets" : 3,
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
									"outlettype" : [ "bang" ],
									"id" : "obj-36",
									"fontname" : "Arial",
									"numinlets" : 1,
									"patching_rect" : [ 50.0, 100.0, 52.0, 18.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 3",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "bang", "bang", "bang" ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"numinlets" : 1,
									"patching_rect" : [ 50.0, 160.0, 41.0, 18.0 ],
									"numoutlets" : 3
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "deferlow",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-23",
									"fontname" : "Arial",
									"numinlets" : 1,
									"patching_rect" : [ 50.0, 130.0, 48.0, 18.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "bang", "bang" ],
									"id" : "obj-24",
									"fontname" : "Arial",
									"numinlets" : 1,
									"patching_rect" : [ 65.0, 186.0, 31.0, 18.0 ],
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "plane 1",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-27",
									"fontname" : "Arial",
									"numinlets" : 2,
									"patching_rect" : [ 65.0, 216.0, 43.0, 16.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "plane 0",
									"hidden" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "" ],
									"id" : "obj-28",
									"fontname" : "Arial",
									"numinlets" : 2,
									"patching_rect" : [ 125.0, 216.0, 43.0, 16.0 ],
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-40",
									"numinlets" : 1,
									"patching_rect" : [ 50.0, 292.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-41",
									"numinlets" : 1,
									"patching_rect" : [ 65.0, 292.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-67",
									"numinlets" : 1,
									"patching_rect" : [ 125.0, 292.0, 25.0, 25.0 ],
									"numoutlets" : 0,
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
						"default_fontname" : "Arial",
						"fontsize" : 10.0,
						"default_fontsize" : 10.0,
						"fontname" : "Arial",
						"default_fontface" : 0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b",
					"fontsize" : 10.0,
					"outlettype" : [ "bang" ],
					"id" : "obj-25",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 375.0, 165.0, 22.0, 18.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"rows" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "list", "", "", "" ],
					"cols" : 4,
					"selmode" : 5,
					"hscroll" : 0,
					"rowheight" : 20,
					"id" : "obj-32",
					"fontname" : "Arial",
					"vscroll" : 0,
					"numinlets" : 2,
					"patching_rect" : [ 375.0, 135.0, 200.0, 20.0 ],
					"colwidth" : 50,
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"rows" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "list", "", "", "" ],
					"cols" : 4,
					"selmode" : 5,
					"hscroll" : 0,
					"rowheight" : 20,
					"id" : "obj-33",
					"fontname" : "Arial",
					"vscroll" : 0,
					"numinlets" : 2,
					"patching_rect" : [ 375.0, 112.0, 200.0, 20.0 ],
					"colwidth" : 50,
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.matrix 2 float32 4 1",
					"fontsize" : 10.0,
					"outlettype" : [ "jit_matrix", "" ],
					"id" : "obj-35",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 375.0, 195.0, 106.0, 18.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"rows" : 3,
					"fontsize" : 12.0,
					"outlettype" : [ "list", "", "", "" ],
					"cols" : 3,
					"selmode" : 5,
					"hscroll" : 0,
					"id" : "obj-1",
					"fontname" : "Arial",
					"vscroll" : 0,
					"numinlets" : 2,
					"patching_rect" : [ 375.0, 363.0, 198.0, 54.0 ],
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cvjit_random_bg_colour",
					"hidden" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "int", "int", "int" ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 0,
					"patching_rect" : [ 44.0, 268.0, 117.0, 18.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bgcolor",
					"hidden" : 1,
					"fontsize" : 10.0,
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 4,
					"patching_rect" : [ 44.0, 292.546204, 165.5, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "copyright-comment",
					"text" : "Copyright © 2010",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"id" : "obj-17",
					"fontname" : "Arial",
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"patching_rect" : [ 50.0, 410.0, 111.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "support-comment",
					"fontsize" : 9.0,
					"id" : "obj-18",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 50.0, 378.0, 240.0, 17.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "email-comment",
					"text" : "antoine.villeret@gmail.com",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"id" : "obj-19",
					"fontname" : "Arial",
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"patching_rect" : [ 159.0, 345.0, 131.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "me-comment",
					"text" : "By Antoine Villeret",
					"fontsize" : 12.0,
					"id" : "obj-22",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 50.0, 343.0, 135.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-comment",
					"text" : "Output",
					"fontsize" : 11.0,
					"id" : "obj-31",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 55.5, 206.5, 44.0, 19.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "input-comment",
					"text" : "Input",
					"fontsize" : 11.0,
					"id" : "obj-34",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 60.0, 165.5, 35.0, 19.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "input-description",
					"text" : "2 planes, float32, 4 columns x 1 row matrix ( dim 4 or 4 x 1 )",
					"linecount" : 2,
					"fontsize" : 11.0,
					"id" : "obj-37",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 110.0, 159.0, 175.0, 32.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "output-description",
					"text" : "1 plane, float32, 3 x 3 transformation matrix",
					"linecount" : 2,
					"fontsize" : 11.0,
					"id" : "obj-38",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 110.0, 200.0, 175.0, 32.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "io-cat-panel",
					"bgcolor" : [ 0.556863, 0.556863, 0.556863, 0.2 ],
					"border" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"id" : "obj-39",
					"numinlets" : 1,
					"patching_rect" : [ 50.0, 154.0, 55.0, 83.0 ],
					"numoutlets" : 0,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "output-panel",
					"bgcolor" : [ 0.615686, 0.607843, 0.607843, 0.2 ],
					"border" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"id" : "obj-42",
					"numinlets" : 1,
					"patching_rect" : [ 50.0, 195.0, 240.0, 42.0 ],
					"numoutlets" : 0,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "input-panel",
					"bgcolor" : [ 0.615686, 0.607843, 0.607843, 0.2 ],
					"border" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"id" : "obj-44",
					"numinlets" : 1,
					"patching_rect" : [ 50.0, 154.0, 240.0, 42.0 ],
					"numoutlets" : 0,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "copyright-panel",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.403922 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.647059 ],
					"id" : "obj-49",
					"numinlets" : 1,
					"patching_rect" : [ 45.0, 338.0, 250.0, 95.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"varname" : "comments",
					"text" : "This external calculates a matrix of perspective transforms form 4 couples of corresponding points. Useful for tracking calibration.",
					"linecount" : 3,
					"fontsize" : 11.0,
					"id" : "obj-62",
					"fontname" : "Arial",
					"numinlets" : 1,
					"patching_rect" : [ 50.0, 95.0, 240.0, 44.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "comments-panel",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.517647 ],
					"id" : "obj-65",
					"numinlets" : 1,
					"patching_rect" : [ 45.0, 90.0, 250.0, 54.0 ],
					"numoutlets" : 0,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"varname" : "io-panel",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.403922 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.517647 ],
					"id" : "obj-5",
					"numinlets" : 1,
					"patching_rect" : [ 45.0, 149.0, 250.0, 93.0 ],
					"numoutlets" : 0,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.getperspective",
					"fontsize" : 10.0,
					"outlettype" : [ "jit_matrix", "" ],
					"id" : "obj-71",
					"fontname" : "Arial",
					"numinlets" : 2,
					"patching_rect" : [ 375.0, 285.0, 98.0, 18.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "fpic",
					"id" : "obj-2",
					"numinlets" : 1,
					"patching_rect" : [ 754.0, 7.0, 255.0, 72.0 ],
					"pic" : "cvtitle.png",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.207843 ],
					"id" : "obj-20",
					"numinlets" : 1,
					"patching_rect" : [ 0.0, 45.0, 778.0, 4.0 ],
					"numoutlets" : 0,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Calculates the perspective transform from 4 corresponding points.",
					"fontsize" : 20.0,
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"numinlets" : 1,
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"patching_rect" : [ 30.0, 45.0, 594.0, 29.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "cv.jit.getperspective",
					"fontface" : 1,
					"fontsize" : 30.028469,
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-15",
					"fontname" : "Arial",
					"numinlets" : 1,
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"patching_rect" : [ 30.0, 15.0, 565.0, 41.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.0, 0.0, 1.0, 0.05098 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 1.0, 0.733333 ],
					"id" : "obj-9",
					"numinlets" : 1,
					"patching_rect" : [ 371.0, 281.0, 108.0, 26.0 ],
					"numoutlets" : 0,
					"rounded" : 30
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.2 ],
					"border" : 1,
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"background" : 1,
					"id" : "obj-58",
					"numinlets" : 1,
					"patching_rect" : [ 315.0, 90.0, 636.0, 131.0 ],
					"numoutlets" : 0,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 0.0 ],
					"border" : 1,
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"background" : 1,
					"id" : "obj-141",
					"numinlets" : 1,
					"patching_rect" : [ 367.0, 276.0, 116.0, 35.0 ],
					"numoutlets" : 0,
					"rounded" : 15
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.101961 ],
					"border" : 1,
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"background" : 1,
					"id" : "obj-147",
					"numinlets" : 1,
					"patching_rect" : [ 367.0, 345.0, 215.0, 87.0 ],
					"numoutlets" : 0,
					"rounded" : 15
				}

			}
 ],
		"lines" : [ 			{
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
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 1,
					"midpoints" : [ 384.5, 143.0, 372.0, 143.0, 372.0, 170.0, 384.5, 170.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 2 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 1 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
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
					"source" : [ "obj-76", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-77", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 1,
					"midpoints" : [ 624.5, 143.0, 612.0, 143.0, 612.0, 170.0, 624.5, 170.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-71", 1 ],
					"hidden" : 0,
					"midpoints" : [ 624.5, 248.5, 463.5, 248.5 ]
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
					"destination" : [ "obj-77", 0 ],
					"hidden" : 1,
					"midpoints" : [ 624.5, 226.0, 602.0, 226.0, 602.0, 109.0, 624.5, 109.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 1,
					"midpoints" : [ 624.5, 218.0, 606.5, 218.0, 606.5, 125.0, 624.5, 125.0 ]
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
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
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
					"source" : [ "obj-68", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 1,
					"midpoints" : [ 384.5, 218.0, 366.5, 218.0, 366.5, 125.0, 384.5, 125.0 ]
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
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-98", 1 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
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
					"source" : [ "obj-93", 0 ],
					"destination" : [ "obj-98", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
 ]
	}

}

{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 348.0, 84.0, 1029.0, 753.0 ],
		"bgcolor" : [ 0.945098, 0.905882, 0.882353, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 348.0, 84.0, 1029.0, 753.0 ],
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
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 0.0 ],
					"patching_rect" : [ 300.0, 639.0, 291.0, 49.0 ],
					"border" : 1,
					"id" : "obj-91",
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"rounded" : 15,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Use the \"rect\" attribute to set the search window's starting position.",
					"linecount" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 420.5, 649.0, 164.0, 29.0 ],
					"id" : "obj-90",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click and drag on this window...",
					"linecount" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 415.5, 580.0, 109.0, 29.0 ],
					"id" : "obj-69",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "rect 195 170 221 207",
					"numoutlets" : 1,
					"patching_rect" : [ 303.5, 660.0, 111.0, 16.0 ],
					"id" : "obj-71",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p make_rect",
					"numoutlets" : 1,
					"patching_rect" : [ 395.5, 620.0, 73.0, 18.0 ],
					"id" : "obj-74",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 40.0, 104.0, 600.0, 426.0 ],
						"bglocked" : 0,
						"defrect" : [ 40.0, 104.0, 600.0, 426.0 ],
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
									"patching_rect" : [ 50.0, 322.0, 15.0, 15.0 ],
									"id" : "obj-1",
									"numinlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "prepend rect",
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 295.0, 67.0, 17.0 ],
									"id" : "obj-2",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack 0 0 0 0",
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 273.0, 172.0, 17.0 ],
									"id" : "obj-3",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 4
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "maximum",
									"numoutlets" : 2,
									"patching_rect" : [ 212.0, 250.0, 53.0, 17.0 ],
									"id" : "obj-4",
									"outlettype" : [ "int", "int" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "maximum",
									"numoutlets" : 2,
									"patching_rect" : [ 158.0, 250.0, 53.0, 17.0 ],
									"id" : "obj-5",
									"outlettype" : [ "int", "int" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "minimum",
									"numoutlets" : 2,
									"patching_rect" : [ 104.0, 250.0, 50.0, 17.0 ],
									"id" : "obj-6",
									"outlettype" : [ "int", "int" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "minimum",
									"numoutlets" : 2,
									"patching_rect" : [ 50.0, 250.0, 50.0, 17.0 ],
									"id" : "obj-7",
									"outlettype" : [ "int", "int" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "unpack 0 0 0 0",
									"numoutlets" : 4,
									"patching_rect" : [ 50.0, 215.0, 76.0, 17.0 ],
									"id" : "obj-8",
									"outlettype" : [ "int", "int", "int", "int" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "zl reg",
									"numoutlets" : 2,
									"patching_rect" : [ 107.0, 162.0, 61.0, 17.0 ],
									"id" : "obj-9",
									"outlettype" : [ "", "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "$1 $2",
									"numoutlets" : 1,
									"patching_rect" : [ 158.0, 142.0, 37.0, 15.0 ],
									"id" : "obj-10",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 1",
									"numoutlets" : 2,
									"patching_rect" : [ 107.0, 139.0, 32.0, 17.0 ],
									"id" : "obj-11",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "$1 $2",
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 140.0, 37.0, 15.0 ],
									"id" : "obj-12",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "zl join",
									"numoutlets" : 2,
									"patching_rect" : [ 50.0, 184.0, 67.0, 17.0 ],
									"id" : "obj-13",
									"outlettype" : [ "", "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "change",
									"numoutlets" : 3,
									"patching_rect" : [ 107.0, 114.0, 40.0, 17.0 ],
									"id" : "obj-14",
									"outlettype" : [ "", "int", "int" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t l l l",
									"numoutlets" : 3,
									"patching_rect" : [ 90.0, 71.0, 44.0, 17.0 ],
									"id" : "obj-15",
									"outlettype" : [ "", "", "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "$3",
									"numoutlets" : 1,
									"patching_rect" : [ 107.0, 93.0, 20.0, 15.0 ],
									"id" : "obj-16",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route mouse",
									"numoutlets" : 2,
									"patching_rect" : [ 90.0, 50.0, 65.0, 17.0 ],
									"id" : "obj-17",
									"outlettype" : [ "", "" ],
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"numinlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numoutlets" : 1,
									"patching_rect" : [ 90.0, 30.0, 15.0, 15.0 ],
									"id" : "obj-18",
									"outlettype" : [ "" ],
									"numinlets" : 0,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-8", 3 ],
									"destination" : [ "obj-4", 1 ],
									"hidden" : 0,
									"midpoints" : [ 116.5, 241.0, 255.5, 241.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-3", 3 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 1 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 78.5, 241.0, 221.5, 241.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 2 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [ 97.5, 241.0, 201.5, 241.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-3", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 241.0, 167.5, 241.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-9", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 2 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 124.5, 99.0, 167.5, 99.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 3 ],
									"destination" : [ "obj-6", 1 ],
									"hidden" : 0,
									"midpoints" : [ 116.5, 241.0, 144.5, 241.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-13", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 1 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-3", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 1 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 78.5, 241.0, 113.5, 241.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 2 ],
									"destination" : [ "obj-7", 1 ],
									"hidden" : 0,
									"midpoints" : [ 97.5, 241.0, 90.5, 241.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-17", 0 ],
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
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
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
									"midpoints" : [ 59.5, 241.0, 59.5, 241.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [ 99.5, 120.0, 59.5, 120.0 ]
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
					"text" : "jit.window shift",
					"numoutlets" : 2,
					"patching_rect" : [ 324.5, 578.0, 90.0, 18.0 ],
					"id" : "obj-75",
					"outlettype" : [ "bang", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"numoutlets" : 2,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"patching_rect" : [ 399.5, 498.0, 69.0, 18.0 ],
					"id" : "obj-7",
					"outlettype" : [ "float", "bang" ],
					"fontname" : "Arial",
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.shift.draw",
					"numoutlets" : 1,
					"patching_rect" : [ 324.5, 533.0, 93.0, 18.0 ],
					"id" : "obj-76",
					"outlettype" : [ "jit_matrix" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cv.jit.shift",
					"numoutlets" : 4,
					"patching_rect" : [ 324.5, 462.0, 132.0, 18.0 ],
					"id" : "obj-77",
					"outlettype" : [ "", "", "", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 0.9,
					"numoutlets" : 2,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"patching_rect" : [ 652.5, 678.0, 35.0, 18.0 ],
					"id" : "obj-78",
					"outlettype" : [ "int", "bang" ],
					"fontname" : "Arial",
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"minimum" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "maxiters $1",
					"numoutlets" : 1,
					"patching_rect" : [ 652.5, 697.0, 72.0, 16.0 ],
					"id" : "obj-79",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"numoutlets" : 2,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"patching_rect" : [ 652.5, 631.0, 37.0, 18.0 ],
					"id" : "obj-80",
					"outlettype" : [ "float", "bang" ],
					"fontname" : "Arial",
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"minimum" : 0.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "distance $1",
					"numoutlets" : 1,
					"patching_rect" : [ 652.5, 649.0, 68.0, 16.0 ],
					"id" : "obj-81",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numoutlets" : 1,
					"patching_rect" : [ 653.5, 584.0, 15.0, 15.0 ],
					"id" : "obj-82",
					"outlettype" : [ "int" ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "mode $1",
					"numoutlets" : 1,
					"patching_rect" : [ 652.5, 602.0, 52.0, 16.0 ],
					"id" : "obj-83",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Maximum number of iterations allowed. Set this to 1 to see the algorithm work step-by-step.",
					"linecount" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 731.5, 675.0, 188.0, 41.0 ],
					"id" : "obj-84",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Algorithm terminates when window moves by less than this value. (In pixels.)",
					"linecount" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 731.5, 635.0, 203.0, 29.0 ],
					"id" : "obj-85",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "1: CAMShift",
					"numoutlets" : 0,
					"patching_rect" : [ 731.5, 602.0, 97.0, 18.0 ],
					"id" : "obj-86",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "0: MeanShift",
					"numoutlets" : 0,
					"patching_rect" : [ 731.5, 586.0, 99.0, 18.0 ],
					"id" : "obj-87",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "First, click on the pwindow above to select a colour to track.\n\nClick and drag on the \"shift\" window to set the search window's starting position.",
					"linecount" : 5,
					"numoutlets" : 0,
					"patching_rect" : [ 736.0, 504.0, 201.0, 64.0 ],
					"id" : "obj-41",
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "suckah",
					"numoutlets" : 1,
					"patching_rect" : [ 644.0, 246.0, 321.0, 246.0 ],
					"id" : "obj-40",
					"outlettype" : [ "" ],
					"compatibility" : 1,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t l l",
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 211.0, 29.0, 18.0 ],
					"id" : "obj-36",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.rgb2luma",
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 421.0, 62.0, 18.0 ],
					"id" : "obj-8",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend color 0.",
					"numoutlets" : 1,
					"patching_rect" : [ 438.0, 348.0, 91.0, 18.0 ],
					"id" : "obj-11",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"numoutlets" : 2,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"patching_rect" : [ 389.0, 324.0, 37.0, 18.0 ],
					"id" : "obj-12",
					"outlettype" : [ "float", "bang" ],
					"fontname" : "Arial",
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"minimum" : 0.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "fade $1",
					"numoutlets" : 1,
					"patching_rect" : [ 389.0, 348.0, 46.0, 16.0 ],
					"id" : "obj-13",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"triscale" : 0.9,
					"numoutlets" : 2,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"patching_rect" : [ 344.0, 324.0, 37.0, 18.0 ],
					"id" : "obj-14",
					"outlettype" : [ "float", "bang" ],
					"fontname" : "Arial",
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"minimum" : 0.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "tol $1",
					"numoutlets" : 1,
					"patching_rect" : [ 344.0, 348.0, 38.0, 16.0 ],
					"id" : "obj-21",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.chromakey @mode 1 @minkey 1. @maxkey 0. @tol 0.1 @fade 0.2",
					"linecount" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 325.0, 384.0, 199.0, 29.0 ],
					"id" : "obj-23",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend brgb",
					"hidden" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 415.0, 294.0, 75.0, 18.0 ],
					"id" : "obj-25",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "saturation $1",
					"hidden" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 343.0, 294.0, 77.0, 16.0 ],
					"id" : "obj-26",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"numoutlets" : 1,
					"patching_rect" : [ 343.0, 248.0, 13.0, 70.0 ],
					"id" : "obj-27",
					"outlettype" : [ "" ],
					"orientation" : 2,
					"size" : 256.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "swatch",
					"numoutlets" : 2,
					"patching_rect" : [ 358.0, 248.0, 171.0, 70.0 ],
					"id" : "obj-28",
					"outlettype" : [ "", "float" ],
					"numinlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.003922, 0.003922, 0.003922, 1.0 ],
					"patching_rect" : [ 535.0, 248.0, 68.0, 71.0 ],
					"border" : 1,
					"id" : "obj-29",
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "jit.chromakey can be used to extract a given colour from the image, which is often done prior to calculating the Mean/CAMShift.",
					"linecount" : 9,
					"numoutlets" : 0,
					"patching_rect" : [ 535.0, 326.0, 81.0, 110.0 ],
					"id" : "obj-30",
					"fontname" : "Arial",
					"fontsize" : 10.0,
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
					"patching_rect" : [ 55.5, 428.0, 44.0, 19.0 ],
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
					"patching_rect" : [ 60.0, 362.0, 35.0, 19.0 ],
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
					"text" : "Single-plane char",
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 362.0, 175.0, 19.0 ],
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
					"text" : "4-element list: New window coordinates\n\n8-element list: Vertices of rotated window\n\nfloat: Mass of window",
					"linecount" : 7,
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 390.0, 175.0, 95.0 ],
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
					"patching_rect" : [ 50.0, 357.0, 55.0, 133.0 ],
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
					"patching_rect" : [ 50.0, 385.0, 240.0, 105.0 ],
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
					"patching_rect" : [ 50.0, 357.0, 240.0, 29.0 ],
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
					"text" : "The cv.jit.shift object implements two closely-related algorithms for tracking a window in a greyscale image: MeanShift and CAMShift.\n\nIn MeanShift, a starting window is defined and the image centroid (see cv.jit.centroids) is computed inside this window. The window is then shifted so that it is centered on this centroid. This process is repeated until the window doesn't move. \n\nCAMShift (Continually Adapting MeanShift) works similarly but the size and orientation is adjusted at each iteration.\n\nIn both cases, the result is that the window will tend to center on bright spots. This can be used to track blobs and works on greyscale and binary data.",
					"linecount" : 19,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 95.0, 243.0, 247.0 ],
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
					"patching_rect" : [ 45.0, 90.0, 250.0, 257.0 ],
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
					"patching_rect" : [ 45.0, 352.0, 250.0, 143.0 ],
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
					"patching_rect" : [ 319.0, 458.0, 157.0, 26.0 ],
					"border" : 1,
					"id" : "obj-9",
					"bordercolor" : [ 0.0, 0.0, 1.0, 0.733333 ],
					"rounded" : 30,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.fpsgui",
					"numoutlets" : 2,
					"patching_rect" : [ 644.0, 501.0, 80.0, 36.0 ],
					"id" : "obj-70",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.pwindow",
					"numoutlets" : 2,
					"patching_rect" : [ 644.0, 250.0, 320.0, 240.0 ],
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
					"text" : "Mean-shift area tracker",
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
					"text" : "cv.jit.shift",
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
					"patching_rect" : [ 636.0, 242.0, 336.0, 256.0 ],
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
					"patching_rect" : [ 320.0, 242.0, 304.0, 206.0 ],
					"border" : 1,
					"id" : "obj-141",
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"rounded" : 15,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.396078 ],
					"patching_rect" : [ 727.0, 501.0, 220.0, 72.0 ],
					"border" : 1,
					"id" : "obj-66",
					"bordercolor" : [ 1.0, 0.0, 0.0, 0.647059 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.396078 ],
					"patching_rect" : [ 323.0, 570.0, 214.0, 45.0 ],
					"border" : 1,
					"id" : "obj-89",
					"bordercolor" : [ 1.0, 0.0, 0.0, 0.647059 ],
					"rounded" : 0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"numoutlets" : 0,
					"bgcolor" : [ 0.776471, 0.776471, 0.776471, 0.0 ],
					"patching_rect" : [ 642.0, 579.0, 296.0, 142.0 ],
					"border" : 1,
					"id" : "obj-92",
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"rounded" : 15,
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 0,
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
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 447.5, 371.0, 334.5, 371.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [ 496.5, 206.0, 334.5, 206.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 1 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"midpoints" : [ 344.5, 234.0, 653.5, 234.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-77", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-77", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-77", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-77", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
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
					"source" : [ "obj-77", 1 ],
					"destination" : [ "obj-76", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 1 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-77", 2 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-80", 0 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-77", 0 ],
					"hidden" : 0,
					"midpoints" : [ 405.0, 644.0, 315.5, 644.0, 315.5, 452.0, 334.0, 452.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-77", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-76", 2 ],
					"hidden" : 0,
					"midpoints" : [ 334.5, 451.0, 484.0, 451.0, 484.0, 527.0, 408.0, 527.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-71", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [ 367.5, 321.5, 447.5, 321.5 ]
				}

			}
 ]
	}

}

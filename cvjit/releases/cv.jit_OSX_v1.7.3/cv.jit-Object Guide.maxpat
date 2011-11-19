{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 298.0, 44.0, 785.0, 635.0 ],
		"bgcolor" : [ 0.882353, 0.858824, 0.823529, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 298.0, 44.0, 785.0, 635.0 ],
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
					"maxclass" : "newobj",
					"text" : "pcontrol",
					"hidden" : 1,
					"patching_rect" : [ 192.0, 540.0, 47.0, 17.0 ],
					"id" : "obj-1",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p launch_help",
					"hidden" : 1,
					"patching_rect" : [ 192.0, 518.0, 70.0, 17.0 ],
					"id" : "obj-4",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"outlettype" : [ "" ],
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
									"text" : "print",
									"patching_rect" : [ 269.0, 92.0, 32.0, 17.0 ],
									"id" : "obj-1",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 171.0, 294.0, 15.0, 15.0 ],
									"id" : "obj-2",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "prepend help",
									"patching_rect" : [ 171.0, 264.0, 66.0, 17.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"fontsize" : 9.0,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "zl nth 3",
									"patching_rect" : [ 197.0, 216.0, 44.0, 17.0 ],
									"id" : "obj-4",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 2,
									"fontsize" : 9.0,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t l l",
									"patching_rect" : [ 197.0, 105.0, 57.0, 17.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"fontsize" : 9.0,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "zl reg",
									"patching_rect" : [ 171.0, 242.0, 36.0, 17.0 ],
									"id" : "obj-6",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 2,
									"fontsize" : 9.0,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "zl reg",
									"patching_rect" : [ 197.0, 193.0, 57.0, 17.0 ],
									"id" : "obj-7",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 2,
									"fontsize" : 9.0,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 0",
									"patching_rect" : [ 197.0, 152.0, 32.0, 17.0 ],
									"id" : "obj-8",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 2,
									"fontsize" : 9.0,
									"outlettype" : [ "bang", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 1",
									"patching_rect" : [ 116.0, 217.0, 32.0, 17.0 ],
									"id" : "obj-9",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 2,
									"fontsize" : 9.0,
									"outlettype" : [ "bang", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "> 1",
									"patching_rect" : [ 116.0, 196.0, 27.0, 17.0 ],
									"id" : "obj-10",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.0,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "zl len",
									"patching_rect" : [ 116.0, 174.0, 34.0, 17.0 ],
									"id" : "obj-11",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 2,
									"fontsize" : 9.0,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1",
									"patching_rect" : [ 116.0, 134.0, 16.0, 15.0 ],
									"id" : "obj-12",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.0,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "thresh 400",
									"patching_rect" : [ 116.0, 153.0, 52.0, 17.0 ],
									"id" : "obj-13",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.0,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "zl nth 1",
									"patching_rect" : [ 197.0, 131.0, 44.0, 17.0 ],
									"id" : "obj-14",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 2,
									"fontsize" : 9.0,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 197.0, 85.0, 15.0, 15.0 ],
									"id" : "obj-15",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-12", 0 ],
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
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-10", 0 ],
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
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 125.5, 239.0, 180.5, 239.0 ]
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
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-8", 0 ],
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
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-6", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-7", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontsize" : 10.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"hidden" : 1,
					"patching_rect" : [ 71.0, 597.0, 29.0, 18.0 ],
					"id" : "obj-5",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"hidden" : 1,
					"patching_rect" : [ 161.0, 618.0, 53.0, 18.0 ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"hidden" : 1,
					"patching_rect" : [ 54.0, 577.0, 36.0, 18.0 ],
					"id" : "obj-7",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"outlettype" : [ "bang", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "sort -1 $1",
					"hidden" : 1,
					"patching_rect" : [ 71.0, 619.0, 63.0, 16.0 ],
					"id" : "obj-8",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pvar cvjit_ubu 3",
					"hidden" : 1,
					"patching_rect" : [ 54.0, 557.0, 95.0, 18.0 ],
					"id" : "obj-9",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontsize" : 10.0,
					"outlettype" : [ "", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Description",
					"patching_rect" : [ 274.0, 90.0, 63.0, 18.0 ],
					"id" : "obj-11",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Group",
					"patching_rect" : [ 208.0, 90.0, 61.0, 18.0 ],
					"id" : "obj-12",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Object name",
					"patching_rect" : [ 44.0, 90.0, 71.0, 18.0 ],
					"id" : "obj-13",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"varname" : "cvjit_ubu",
					"types" : [  ],
					"patching_rect" : [ 545.0, 90.0, 100.0, 18.0 ],
					"id" : "obj-14",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontsize" : 10.0,
					"outlettype" : [ "int", "", "" ],
					"items" : [ "Name", ",", "Group" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "refer externals",
					"hidden" : 1,
					"patching_rect" : [ 54.0, 664.0, 88.0, 16.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pvar cvjit_list 4",
					"hidden" : 1,
					"patching_rect" : [ 54.0, 682.0, 110.0, 18.0 ],
					"id" : "obj-22",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 4,
					"fontsize" : 10.0,
					"outlettype" : [ "", "", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.cellblock",
					"varname" : "cvjit_list",
					"rows" : 65,
					"rowhead" : 1,
					"patching_rect" : [ 45.0, 112.0, 605.0, 401.0 ],
					"rowheight" : 25,
					"hcellcolor" : [ 0.801556, 0.801556, 0.801556, 1.0 ],
					"id" : "obj-23",
					"fontname" : "Geneva",
					"numinlets" : 2,
					"colwidth" : 45,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"cols" : 3,
					"numoutlets" : 4,
					"selmode" : 3,
					"fontsize" : 9.0,
					"precision" : 4,
					"outlettype" : [ "list", "", "", "" ],
					"headercolor" : [ 0.992218, 0.992218, 0.992218, 1.0 ],
					"hscroll" : 0,
					"bgcolor" : [ 0.992218, 0.992218, 0.992218, 1.0 ],
					"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"coldef" : [ [ 0, 165, 1, 0.368627, 0.0, 0.0, 1, 0.0, 0.0, 0.0, -1, -1, -1 ], [ 9, 5, 1, 0.0, 0.0, 0.0, 1, 0.0, 0.0, 0.0, -1, -1, -1 ], [ 8, 5, 1, 0.368627, 0.0, 0.0, 1, 0.0, 0.0, 0.0, -1, -1, -1 ], [ 6, 5, 1, 0.368627, 0.0, 0.0, 1, 0.0, 0.0, 0.0, -1, -1, -1 ], [ 5, 5, 1, 0.368627, 0.0, 0.0, 1, 0.0, 0.0, 0.0, -1, -1, -1 ], [ 4, 5, 1, 0.513726, 0.086275, 0.0, 1, 0.0, 0.0, 0.0, -1, -1, -1 ], [ 3, 5, 1, 0.521569, 0.086275, 0.0, 1, 0.0, 0.0, 0.0, -1, -1, -1 ], [ 2, 360, 1, 0.368627, 0.0, 0.0, 1, 0.0, 0.0, 0.0, -1, -1, -1 ], [ 1, 64, 1, 0.513726, 0.086275, 0.0, 1, 0.0, 0.0, 0.0, -1, -1, -1 ] ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "coll externals -1",
					"hidden" : 1,
					"patching_rect" : [ 71.0, 640.0, 95.0, 18.0 ],
					"id" : "obj-24",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 4,
					"fontsize" : 10.0,
					"outlettype" : [ "", "", "", "" ],
					"coll_data" : 					{
						"count" : 65,
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
								"key" : "cv.jit.grab",
								"value" : [ "utilities", "Cross-platform wrapper for jit.qt.grab and jit.dx.grab" ]
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
								"key" : "cv.jit.opticalflow",
								"value" : [ "movement", "Estimate optical flow using a variety of methods" ]
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
								"key" : "cv.jit.threshold",
								"value" : [ "filtering", "Obtain a binary image using adaptive thresholding" ]
							}
, 							{
								"key" : "cv.jit.touches",
								"value" : [ "tracking", "Track greyscale blobs, useful for multi-touch screens" ]
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
					"saved_object_attributes" : 					{
						"embed" : 1
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Sort by:",
					"patching_rect" : [ 486.0, 90.0, 61.0, 18.0 ],
					"id" : "obj-25",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Double-click on a row to display the object's help file. (If it exists.)",
					"patching_rect" : [ 53.0, 532.0, 298.0, 18.0 ],
					"id" : "obj-3",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 46.0, 522.0, 319.0, 36.0 ],
					"id" : "obj-21",
					"border" : 1,
					"rounded" : 0,
					"numinlets" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"numoutlets" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.396078 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Copyright ©2003-2009",
					"patching_rect" : [ 521.157837, 588.263123, 128.0, 18.0 ],
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"id" : "obj-41",
					"fontname" : "Arial",
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p random_bg_colour",
					"hidden" : 1,
					"patching_rect" : [ 267.0, 605.166687, 102.0, 18.0 ],
					"id" : "obj-40",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 3,
					"fontsize" : 10.0,
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
									"patching_rect" : [ 50.0, 100.0, 59.0, 18.0 ],
									"id" : "obj-13",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "!- 215",
									"patching_rect" : [ 168.0, 161.004089, 36.0, 18.0 ],
									"id" : "obj-9",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "!- 225",
									"patching_rect" : [ 109.0, 161.004089, 36.0, 18.0 ],
									"id" : "obj-8",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 225",
									"patching_rect" : [ 50.0, 161.004089, 36.0, 18.0 ],
									"id" : "obj-7",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 3",
									"patching_rect" : [ 50.0, 120.621155, 137.0, 18.0 ],
									"id" : "obj-6",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 3,
									"fontsize" : 10.0,
									"outlettype" : [ "bang", "bang", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "random 10",
									"patching_rect" : [ 168.0, 140.745117, 58.0, 18.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "random 10",
									"patching_rect" : [ 109.0, 140.745117, 58.0, 18.0 ],
									"id" : "obj-4",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "random 3",
									"patching_rect" : [ 50.0, 140.964417, 53.0, 18.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 50.0, 239.004089, 25.0, 25.0 ],
									"id" : "obj-37",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 109.0, 239.004089, 25.0, 25.0 ],
									"id" : "obj-38",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 168.0, 239.004089, 25.0, 25.0 ],
									"id" : "obj-39",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-4", 0 ],
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
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-3", 0 ],
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
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-7", 0 ],
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
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-8", 0 ],
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
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-39", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Support:\nInternational Academy of Media Arts & Sciences (IAMAS) \n– Gifu, Japan",
					"linecount" : 3,
					"patching_rect" : [ 521.0, 549.0, 244.039505, 38.0 ],
					"id" : "obj-35",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "jmp@jmpelletier.com\n",
					"patching_rect" : [ 655.0, 529.0, 107.0, 18.0 ],
					"frgb" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"id" : "obj-33",
					"fontname" : "Arial",
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.901961 ],
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "By Jean-Marc Pelletier\n",
					"patching_rect" : [ 521.0, 528.0, 135.0, 20.0 ],
					"id" : "obj-32",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "fpic",
					"patching_rect" : [ 527.0, 7.0, 255.0, 72.0 ],
					"pic" : "cvtitle.png",
					"id" : "obj-2",
					"numinlets" : 1,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 19.0, 47.0, 536.0, 4.0 ],
					"id" : "obj-20",
					"border" : 1,
					"rounded" : 0,
					"numinlets" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 0.207843 ],
					"numoutlets" : 0,
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "cv.jit Object Guide",
					"patching_rect" : [ 44.0, 15.0, 565.0, 41.0 ],
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-15",
					"fontname" : "Arial",
					"numinlets" : 1,
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 30.028469
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bgcolor",
					"hidden" : 1,
					"patching_rect" : [ 267.0, 625.546204, 143.5, 18.0 ],
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 4,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 510.0, 521.0, 255.513153, 95.986832 ],
					"id" : "obj-36",
					"border" : 1,
					"rounded" : 0,
					"numinlets" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 0.647059 ],
					"numoutlets" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.345098 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 1,
					"midpoints" : [ 54.5, 514.0, 201.5, 514.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 1,
					"midpoints" : [ 170.5, 661.0, 63.5, 661.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 1 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 1 ],
					"destination" : [ "obj-10", 1 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 2 ],
					"destination" : [ "obj-10", 2 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
 ]
	}

}

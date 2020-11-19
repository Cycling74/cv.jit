{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 837.0, 132.0, 828.0, 518.0 ],
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
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.1 ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-3",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 640.0, 452.0, 134.0, 40.0 ],
					"text" : "By Jean-Marc Pelletier\rjmp@jmpelletier.com\rCopyright ©2003-2020"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 173.0, 524.0, 47.0, 19.0 ],
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
							"major" : 8,
							"minor" : 1,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 41.0, 84.0, 600.0, 400.0 ],
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
									"patching_rect" : [ 269.0, 92.0, 32.0, 19.0 ],
									"text" : "print"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 171.0, 294.0, 15.0, 15.0 ]
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
									"patching_rect" : [ 171.0, 264.0, 66.0, 19.0 ],
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
									"patching_rect" : [ 197.0, 216.0, 44.0, 19.0 ],
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
									"patching_rect" : [ 197.0, 105.0, 57.0, 19.0 ],
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
									"patching_rect" : [ 171.0, 242.0, 36.0, 19.0 ],
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
									"patching_rect" : [ 197.0, 193.0, 57.0, 19.0 ],
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
									"patching_rect" : [ 197.0, 152.0, 32.0, 19.0 ],
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
									"patching_rect" : [ 116.0, 217.0, 32.0, 19.0 ],
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
									"patching_rect" : [ 116.0, 196.0, 27.0, 19.0 ],
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
									"patching_rect" : [ 116.0, 174.0, 34.0, 19.0 ],
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
									"patching_rect" : [ 116.0, 134.0, 16.0, 19.0 ],
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
									"patching_rect" : [ 116.0, 153.0, 52.0, 19.0 ],
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
									"patching_rect" : [ 197.0, 131.0, 44.0, 19.0 ],
									"text" : "zl nth 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-15",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 197.0, 85.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 1 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"order" : 1,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"order" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 125.5, 239.0, 180.5, 239.0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 173.0, 502.0, 70.0, 19.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p launch_help"
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
					"patching_rect" : [ 651.0, 233.0, 48.0, 19.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 186.0, 69.0, 73.0, 20.0 ],
					"text" : "Description"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 25.0, 69.0, 84.0, 20.0 ],
					"text" : "Object name"
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
					"patching_rect" : [ 23.0, 507.0, 106.0, 19.0 ],
					"text" : "bgcolor 210 210 195"
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
					"rounded" : 0
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
					"rounded" : 0
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
					"patching_rect" : [ 651.0, 270.0, 80.0, 19.0 ],
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
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 651.0, 295.0, 68.0, 19.0 ],
					"text" : "pvar cvjit_list 2"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.992218, 0.992218, 0.992218, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"coldef" : [ [ 0, 189, 1, 0.368627, 0.0, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, 2, 1 ], [ -1, 5, 1, 0.368627, 0.0, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, 2, 1 ], [ -2, 5, 1, 0.368627, 0.0, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, 2, 1 ], [ 1, 400, 1, 0.513726, 0.086275, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, 2, 1 ] ],
					"cols" : 2,
					"colwidth" : 200,
					"fontface" : 0,
					"fontname" : "Geneva",
					"fontsize" : 11.0,
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
					"readonly" : 1,
					"rowhead" : 1,
					"rowheight" : 25,
					"rows" : 82,
					"selmode" : 3,
					"varname" : "cvjit_list"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 82,
						"data" : [ 							{
								"key" : "cv.jit.binedge",
								"value" : [ "Extract edges in a binary image." ]
							}
, 							{
								"key" : "cv.jit.blobs.bounds",
								"value" : [ "Find connected component bounding boxes." ]
							}
, 							{
								"key" : "cv.jit.blobs.bounds.draw",
								"value" : [ "Draw connected component bounding boxes." ]
							}
, 							{
								"key" : "cv.jit.blobs.centroids",
								"value" : [ "Find connected component centroids." ]
							}
, 							{
								"key" : "cv.jit.blobs.centroids.draw",
								"value" : [ "Draw connected component centroids." ]
							}
, 							{
								"key" : "cv.jit.blobs.color",
								"value" : [ "Display connected components with color." ]
							}
, 							{
								"key" : "cv.jit.blobs.colour",
								"value" : [ "Display connected components with colour." ]
							}
, 							{
								"key" : "cv.jit.blobs.direction",
								"value" : [ "Find connected component directions." ]
							}
, 							{
								"key" : "cv.jit.blobs.direction.draw",
								"value" : [ "Draw connected component directions." ]
							}
, 							{
								"key" : "cv.jit.blobs.elongation",
								"value" : [ "Find connected component elongations." ]
							}
, 							{
								"key" : "cv.jit.blobs.elongation.draw",
								"value" : [ "Draw connected component elongations." ]
							}
, 							{
								"key" : "cv.jit.blobs.moments",
								"value" : [ "Find connected component moments of inertia." ]
							}
, 							{
								"key" : "cv.jit.blobs.orientation",
								"value" : [ "Find connected component orientations." ]
							}
, 							{
								"key" : "cv.jit.blobs.orientation.draw",
								"value" : [ "Draw connected component orientations." ]
							}
, 							{
								"key" : "cv.jit.blobs.recon",
								"value" : [ "Shape recognition for connected components." ]
							}
, 							{
								"key" : "cv.jit.blobs.sort",
								"value" : [ "Sort connected components." ]
							}
, 							{
								"key" : "cv.jit.blur",
								"value" : [ "Add gaussian blur to an image." ]
							}
, 							{
								"key" : "cv.jit.calibration",
								"value" : [ "Calibrate camera." ]
							}
, 							{
								"key" : "cv.jit.canny",
								"value" : [ "Detect edges in an image." ]
							}
, 							{
								"key" : "cv.jit.cartopol",
								"value" : [ "Cartesian to polar conversion in matrix data." ]
							}
, 							{
								"key" : "cv.jit.centroids",
								"value" : [ "Calculate the center of mass of an image." ]
							}
, 							{
								"key" : "cv.jit.centroids.draw",
								"value" : [ "Draw image centroids." ]
							}
, 							{
								"key" : "cv.jit.changetype",
								"value" : [ "Change the type of a matrix." ]
							}
, 							{
								"key" : "cv.jit.circularity",
								"value" : [ "Find circularity of binary image." ]
							}
, 							{
								"key" : "cv.jit.close",
								"value" : [ "Dilate then erode a binary image." ]
							}
, 							{
								"key" : "cv.jit.dilate",
								"value" : [ "Dilate a binary image to remove noise." ]
							}
, 							{
								"key" : "cv.jit.direction",
								"value" : [ "Find the direction of a binary image." ]
							}
, 							{
								"key" : "cv.jit.elongation",
								"value" : [ "Find elongation of binary image." ]
							}
, 							{
								"key" : "cv.jit.erode",
								"value" : [ "Erode a binary image to remove noise." ]
							}
, 							{
								"key" : "cv.jit.extrema",
								"value" : [ "Find extreme values in a matrix." ]
							}
, 							{
								"key" : "cv.jit.face.landmarks",
								"value" : [ "Detect facial landmarks such as eyes and mouth." ]
							}
, 							{
								"key" : "cv.jit.face.landmarks.draw",
								"value" : [ "Draw facial landmarks." ]
							}
, 							{
								"key" : "cv.jit.face.parts",
								"value" : [ "Separate facial landmarks into easy to access groups." ]
							}
, 							{
								"key" : "cv.jit.face.rigidpoints",
								"value" : [ "Extract rigid points from facial landmarks." ]
							}
, 							{
								"key" : "cv.jit.faces",
								"value" : [ "Detect faces." ]
							}
, 							{
								"key" : "cv.jit.faces.draw",
								"value" : [ "Draw detected face regions." ]
							}
, 							{
								"key" : "cv.jit.features",
								"value" : [ "Detect corners in a image for tracking." ]
							}
, 							{
								"key" : "cv.jit.features.draw",
								"value" : [ "Draw detected corners." ]
							}
, 							{
								"key" : "cv.jit.features2track",
								"value" : [ "Extract corners for tracking." ]
							}
, 							{
								"key" : "cv.jit.findchessboardcorners",
								"value" : [ "Find chessboard corners in an image to calibrate a camera." ]
							}
, 							{
								"key" : "cv.jit.findhomography",
								"value" : [ "Find a perspective transformation between two planes." ]
							}
, 							{
								"key" : "cv.jit.floodfill",
								"value" : [ "Extract a connected component from a binary image." ]
							}
, 							{
								"key" : "cv.jit.flow.draw",
								"value" : [ "Display optical flow using hue for direction." ]
							}
, 							{
								"key" : "cv.jit.framesub",
								"value" : [ "Subtract subsequent frames for motion detection." ]
							}
, 							{
								"key" : "cv.jit.getperspective",
								"value" : [ "Calculate perspective transform." ]
							}
, 							{
								"key" : "cv.jit.hough",
								"value" : [ "Calculate Hough space." ]
							}
, 							{
								"key" : "cv.jit.hough2lines",
								"value" : [ "Find straight lines in Hough space." ]
							}
, 							{
								"key" : "cv.jit.iter",
								"value" : [ "Output a matrix one row or column at at time." ]
							}
, 							{
								"key" : "cv.jit.kalman",
								"value" : [ "Use a Kalman filter to remove noise in tracking or sensor data." ]
							}
, 							{
								"key" : "cv.jit.keypoints",
								"value" : [ "Find multi-scale features and their descriptors for object matching." ]
							}
, 							{
								"key" : "cv.jit.keypoints.draw",
								"value" : [ "Draw keypoints." ]
							}
, 							{
								"key" : "cv.jit.keypoints.match",
								"value" : [ "Match two sets of keypoints." ]
							}
, 							{
								"key" : "cv.jit.label",
								"value" : [ "Extract connected components from a binary image." ]
							}
, 							{
								"key" : "cv.jit.learn",
								"value" : [ "Learn and detect patterns." ]
							}
, 							{
								"key" : "cv.jit.lines",
								"value" : [ "Find straight lines in an image." ]
							}
, 							{
								"key" : "cv.jit.lines.draw",
								"value" : [ "Draw detected straight lines." ]
							}
, 							{
								"key" : "cv.jit.lowpass",
								"value" : [ "Filter tracking or sensor data." ]
							}
, 							{
								"key" : "cv.jit.mass",
								"value" : [ "Calculate the mass of an image." ]
							}
, 							{
								"key" : "cv.jit.mean",
								"value" : [ "Average of all input images." ]
							}
, 							{
								"key" : "cv.jit.moments",
								"value" : [ "Calculate the moments of inertia and invariants in a binary image for shape detection and analysis." ]
							}
, 							{
								"key" : "cv.jit.noise",
								"value" : [ "Generate random floating point values. " ]
							}
, 							{
								"key" : "cv.jit.notempty",
								"value" : [ "Only pass a matrix if it has useful data." ]
							}
, 							{
								"key" : "cv.jit.open",
								"value" : [ "Erode then dilate a binary image." ]
							}
, 							{
								"key" : "cv.jit.opticalflow",
								"value" : [ "Calculate dense optical flow for motion detection and analysis." ]
							}
, 							{
								"key" : "cv.jit.orientation",
								"value" : [ "Find orientation of binary image." ]
							}
, 							{
								"key" : "cv.jit.perimeter",
								"value" : [ "Find perimeter of binary image." ]
							}
, 							{
								"key" : "cv.jit.perspective",
								"value" : [ "Perspective transform." ]
							}
, 							{
								"key" : "cv.jit.poltocar",
								"value" : [ "Polar to cartesian conversion in matrix data." ]
							}
, 							{
								"key" : "cv.jit.ravg",
								"value" : [ "Apply time-wise blurring." ]
							}
, 							{
								"key" : "cv.jit.resize",
								"value" : [ "High-quality interpolated image resizing." ]
							}
, 							{
								"key" : "cv.jit.shift",
								"value" : [ "Track bright areas using MeanShift and CAMShift algorithms." ]
							}
, 							{
								"key" : "cv.jit.shift.draw",
								"value" : [ "Draw tracking info from cv.jit.shift." ]
							}
, 							{
								"key" : "cv.jit.stddev",
								"value" : [ "Calculate the standard deviation of incoming matrices." ]
							}
, 							{
								"key" : "cv.jit.sum",
								"value" : [ "Add all matrix values together." ]
							}
, 							{
								"key" : "cv.jit.threshold",
								"value" : [ "Obtain binary images using adaptive thresholding." ]
							}
, 							{
								"key" : "cv.jit.touches",
								"value" : [ "Track several areas at a time using MeanShift." ]
							}
, 							{
								"key" : "cv.jit.touches.draw",
								"value" : [ "Draw tracking info from cv.jit.touches." ]
							}
, 							{
								"key" : "cv.jit.track",
								"value" : [ "Track points in an image." ]
							}
, 							{
								"key" : "cv.jit.track.draw",
								"value" : [ "Draw tracked corners." ]
							}
, 							{
								"key" : "cv.jit.undergrad",
								"value" : [ "Very basic pattern learning and recognition." ]
							}
, 							{
								"key" : "cv.jit.unproject",
								"value" : [ "Find the translation and rotation of a detected object in an image." ]
							}
, 							{
								"key" : "cv.jit.variance",
								"value" : [ "Calculate the variance of incoming matrices." ]
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
					"patching_rect" : [ 651.0, 200.0, 86.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1,
						"precision" : 6
					}
,
					"text" : "coll externals -1"
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
					"rounded" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"hidden" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"hidden" : 1,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"hidden" : 1,
					"midpoints" : [ 32.5, 498.0, 182.5, 498.0 ],
					"order" : 1,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"hidden" : 1,
					"source" : [ "obj-4", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ],
		"autosave" : 0,
		"bgcolor" : [ 0.823529411764706, 0.823529411764706, 0.764705882352941, 1.0 ]
	}

}

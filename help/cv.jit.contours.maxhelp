{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 1,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 95.0, 79.0, 1012.0, 721.0 ],
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
		"subpatcher_template" : "no-menus",
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 24.0,
					"id" : "obj-41",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 485.5, 148.5, 155.0, 33.0 ],
					"style" : "",
					"text" : "cv.jit.contours",
					"textcolor" : [ 0.505882, 0.278431, 0.141176, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 645.5, 161.5, 134.0, 20.0 ],
					"style" : "",
					"text" : "by rama gottfried, 2016",
					"textcolor" : [ 0.505882, 0.278431, 0.141176, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 533.0, 396.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 3,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1012.0, 695.0 ],
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
						"toolbars_unpinned_last_save" : 15,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "<none>",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-8",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 637.0, 563.0, 362.0, 114.0 ],
									"style" : "",
									"text" : "x axis start points (on hull) for each convex hull defect\ny axis start points (on hull) for each convex hull defect\nx axis maximum distance points for each convex hull defect\ny axis maximum distance points for each convex hull defect\nx axis end points (on hull) for each convex hull defect\ny axis end points (on hull) for each convex hull defect\ndepth value for each convex hull defect\ncontour index number (not tracking id) "
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 597.0, 483.0, 408.0, 74.0 ],
									"style" : "",
									"text" : "index number corresponding to the lists above\nminimum rotated bounding box, x axis point list for this contour\nminimum rotated bounding box, y axis point list for this contour\nconvex hull x axis point list for this contour\nconvex hull y axis point list for this contour"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"linecount" : 30,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 504.0, 47.0, 513.0, 409.0 ],
									"style" : "",
									"text" : "aspect ratio of image\ntracked id for each contour index\nlist of bounding box center x axis point \nlist of bounding box center y axis points\nlist of bounding box widths\nlist of bounding box heights\nlist of contour x axis centers of mass\nlist of contour y axis centers of mass\nlist of eccentricity elongation measurements\nlength of short side of bounding rotated rectangle as a ratio, where 1 is the full screen size\nlength of long side of rotated rectangle as a ratio, where 1 is the full screen size\nangle of short side of rotated rect as a ratio, where 1 is the full screen size\nlist of area values as ratios, were 1 is the full screen size\nlist of convex hull area values as ratios, were 1 is the full screen size\nlist of contour perimeter lengths\nlist of convexity checks, 1 if convex, 0 if not\nenclosing contour indexes (referring to these contour lists), -1 if contour has no parent contour\nxy dimensions of the scaled image\nnumber of defects in the convex hull\nsum of defect distances from convex hull as a measure of \"spiky-ness\"\nnumber of points in convex hull\nnumber of points in contour\nfocus measure using sobel edge detection, sharper edges result in a higher value\naverage red channel value in contour (if 3 or 4 plane matrix is present)\naverage green channel value in contour (if 3 or 4 plane matrix is present)\naverage blue channel value in contour (if 3 or 4 plane matrix is present)\naverage alpha channel value in contour (if 3 or 4 plane matrix is present)\naverage luma channel value in contour (if 1 plane matrix is present)\naverage optical flow radius for contour (no value when @optical_flow is set to 0)\naverage optical flow theta for contour (no value when @optical_flow is set to 0)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 563.0, 21.0, 241.0, 20.0 ],
									"style" : "",
									"text" : "(list length is the number of contours found)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "dict.view",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 13.0, 59.0, 385.0, 617.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 13.0, 15.0, 100.0, 22.0 ],
									"style" : "",
									"text" : "r contour-dict"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 585.0, 563.0, 50.0, 114.0 ],
									"style" : "",
									"text" : "/start/x\n/start/y\n/x\n/y\n/end/x\n/end/y\n/depth\n/index ",
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 510.0, 461.0, 105.0, 20.0 ],
									"style" : "",
									"text" : "(for each contour)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"linecount" : 7,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 510.0, 483.0, 85.0, 100.0 ],
									"style" : "",
									"text" : "/index\n/minrect/x\n/minrect/y\n/hull/points/x\n/hull/points/y\n\n/defect/points:",
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 430.0, 461.0, 80.0, 20.0 ],
									"style" : "",
									"text" : "/contour/pts :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"id" : "obj-33",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 410.0, 21.0, 151.0, 20.0 ],
									"style" : "",
									"text" : "Dictionary (OSC) output:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"linecount" : 30,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 400.0, 47.0, 102.0, 409.0 ],
									"style" : "",
									"text" : "/aspect\n/ids\n/center/x\n/center/y\n/size/x\n/size/y\n/centroid/x\n/centroid/y\n/eccentricity\n/rotrect/minor\n/rotrect/major\n/angle\n/area\n/hull/area\n/parimeter\n/isconvex\n/parent\n/dim_xy\n/defect/count\n/defect/dist_sum\n/hull/count\n/contour/count\n/focus\n/mean/r\n/mean/g\n/mean/b\n/mean/a\n/mean/luma\n/flow/r\n/flow/theta",
									"textjustification" : 2
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 308.0, 229.0, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"dictionary info\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 3,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 95.0, 105.0, 1012.0, 695.0 ],
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
						"toolbars_unpinned_last_save" : 15,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "<none>",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"id" : "obj-22",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 259.0, 507.0, 111.0, 20.0 ],
									"style" : "",
									"text" : "Visualization key:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 237.0, 527.0, 69.0, 114.0 ],
									"style" : "",
									"text" : "number\nwhite dot\ngrey box\nblue dot\nwhite line\npink line\npurple dot\ngreen lines",
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 310.0, 527.0, 252.0, 114.0 ],
									"style" : "",
									"text" : "tracking id\ncentroid\nminimum bounding box (rotated rectangle)\nrotated rectangle center point\nrotated rectangle angle of rotation\nconvex hull \nconvex hull defect point\nconnection points from convex hull to defect "
								}

							}
, 							{
								"box" : 								{
									"attr" : "max_size",
									"id" : "obj-16",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 287.0, 308.0, 150.0, 22.0 ],
									"style" : "",
									"text_width" : 98.0
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"id" : "obj-21",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 534.0, 143.0, 44.0, 20.0 ],
									"style" : "",
									"text" : "input:",
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 577.0, 182.0, 193.0, 20.0 ],
									"style" : "",
									"text" : "dictionary containing analysis data"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"id" : "obj-12",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 527.0, 182.0, 51.0, 20.0 ],
									"style" : "",
									"text" : "output:",
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 577.0, 143.0, 248.0, 33.0 ],
									"style" : "",
									"text" : "matrix to analyze\naccepts 1, 3 or 4 plane char matrixes"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"linecount" : 13,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 577.0, 250.5, 307.0, 181.0 ],
									"style" : "",
									"text" : "dilation size coefficient\nerosion size coefficient\ngaussian blur sigma\ninvert grayscale image before analysis\nmaximum contour size relative to the full image (0-1)\nminimum contour size relative to the full image (0-1)\non/off\nwhen enabled, only outermost contours are output \nscalar value for internal analysis size\n0-255, threshold for binary image stage before analysis\nmaximum radius to search for contour tracking (0-1)\n0 = opening (erode-dilate), \n1 = closing (dilate-erode) "
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"linecount" : 12,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 467.0, 250.5, 110.0, 167.0 ],
									"style" : "",
									"text" : "@dilation\n@erosion\n@gauss_sigma\n@invert\n@max_size\n@min_size\n@optical_flow\n@parents_only\n@resize_scale\n@thresh\n@track_radius\n@transform_mode",
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 291.0, 436.0, 100.0, 22.0 ],
									"style" : "",
									"text" : "s contour-dict"
								}

							}
, 							{
								"box" : 								{
									"attr" : "optical_flow",
									"id" : "obj-2",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 287.0, 189.0, 150.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 467.0, 66.5, 427.0, 60.0 ],
									"style" : "",
									"text" : "Finds and tracks contours in input matrix -- with internal pre-processing.\nProvides convex hull coordinates, minimum bounding rectangle, and statistics report on contour morphology and hierarchy. See dictionary info and process diagram tabs for more details."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"id" : "obj-5",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 511.0, 229.5, 71.0, 20.0 ],
									"style" : "",
									"text" : "Attributes:"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 24.0,
									"id" : "obj-41",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 467.0, 33.5, 155.0, 33.0 ],
									"style" : "",
									"text" : "cv.jit.contours",
									"textcolor" : [ 0.505882, 0.278431, 0.141176, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 3,
											"revision" : 1,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 50.0, 79.0, 670.0, 746.0 ],
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
										"subpatcher_template" : "no-menus",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-38",
													"maxclass" : "dict.view",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 49.0, 52.0, 571.0, 922.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-41",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 49.0, 11.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-38", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-41", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 186.5, 436.0, 99.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p view dictionary"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 627.0, 46.5, 134.0, 20.0 ],
									"style" : "",
									"text" : "by rama gottfried, 2016",
									"textcolor" : [ 0.505882, 0.278431, 0.141176, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "transform_mode",
									"id" : "obj-37",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 287.0, 276.0, 150.0, 22.0 ],
									"style" : "",
									"text_width" : 113.0
								}

							}
, 							{
								"box" : 								{
									"attr" : "dilation",
									"id" : "obj-36",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 287.0, 224.0, 150.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 186.5, 115.0, 39.0, 22.0 ],
									"style" : "",
									"text" : "close"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 115.0, 37.0, 22.0 ],
									"style" : "",
									"text" : "open"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 111.0, 154.0, 108.0, 22.0 ],
									"style" : "",
									"text" : "jit.grab @unique 1"
								}

							}
, 							{
								"box" : 								{
									"attr" : "resize_scale",
									"id" : "obj-11",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 287.0, 104.5, 150.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"attr" : "erosion",
									"id" : "obj-9",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 287.0, 250.0, 150.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-31",
									"maxclass" : "jit.fpsgui",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 161.0, 201.0, 80.0, 35.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-28",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 111.0, 561.0, 103.0, 62.0 ],
									"style" : "",
									"text" : "jit.window cam @size 400. 225. @depthbuffer 0 @floating 0"
								}

							}
, 							{
								"box" : 								{
									"attr" : "floating",
									"id" : "obj-13",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 111.0, 531.0, 105.0, 22.0 ],
									"style" : "",
									"text_width" : 66.0
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 3,
											"revision" : 1,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 34.0, 79.0, 1372.0, 746.0 ],
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
										"subpatcher_template" : "no-menus",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 7,
															"minor" : 3,
															"revision" : 1,
															"architecture" : "x64",
															"modernui" : 1
														}
,
														"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
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
														"subpatcher_template" : "no-menus",
														"boxes" : [ 															{
																"box" : 																{
																	"id" : "obj-7",
																	"linecount" : 3,
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 50.0, 137.5, 190.0, 49.0 ],
																	"style" : "",
																	"text" : "glcolor 0. 1. 1. 1, moveto $1 $2 0, circle 0.01, glcolor 1. 1. 1. 1., linesegment $1 $2 0 $3 $4 0"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-59",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patcher" : 																	{
																		"fileversion" : 1,
																		"appversion" : 																		{
																			"major" : 7,
																			"minor" : 3,
																			"revision" : 1,
																			"architecture" : "x64",
																			"modernui" : 1
																		}
,
																		"rect" : [ 655.0, 215.0, 674.0, 625.0 ],
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
																		"subpatcher_template" : "no-menus",
																		"boxes" : [ 																			{
																				"box" : 																				{
																					"id" : "obj-6",
																					"maxclass" : "comment",
																					"numinlets" : 1,
																					"numoutlets" : 0,
																					"patching_rect" : [ 338.0, 226.0, 106.0, 20.0 ],
																					"style" : "",
																					"text" : "pi / 180 ≈ 0.0175"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-4",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 2,
																					"outlettype" : [ "float", "int" ],
																					"patching_rect" : [ 346.0, 351.0, 100.0, 22.0 ],
																					"style" : "",
																					"text" : "maximum 0."
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-3",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patcher" : 																					{
																						"fileversion" : 1,
																						"appversion" : 																						{
																							"major" : 7,
																							"minor" : 3,
																							"revision" : 1,
																							"architecture" : "x64",
																							"modernui" : 1
																						}
,
																						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
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
																						"subpatcher_template" : "no-menus",
																						"boxes" : [ 																							{
																								"box" : 																								{
																									"id" : "obj-17",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 2,
																									"outlettype" : [ "bang", "int" ],
																									"patching_rect" : [ 50.0, 100.0, 100.0, 22.0 ],
																									"style" : "",
																									"text" : "t b i"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-50",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 175.0, 140.0, 22.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-43",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 133.0, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-18",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-19",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 136.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-20",
																									"maxclass" : "outlet",
																									"numinlets" : 1,
																									"numoutlets" : 0,
																									"patching_rect" : [ 50.0, 257.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
 ],
																						"lines" : [ 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-17", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-17", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-17", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-18", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-19", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-43", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-20", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-50", 0 ]
																								}

																							}
 ]
																					}
,
																					"patching_rect" : [ 445.0, 317.0, 37.0, 22.0 ],
																					"saved_object_attributes" : 																					{
																						"description" : "",
																						"digest" : "",
																						"globalpatchername" : "",
																						"style" : "",
																						"tags" : ""
																					}
,
																					"style" : "",
																					"text" : "p nth"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-2",
																					"linecount" : 2,
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 299.0, 163.0, 120.5, 35.0 ],
																					"style" : "",
																					"text" : "vexpr $f1 * $f2 @scalarmode 1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-1",
																					"linecount" : 2,
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 206.5, 226.0, 122.0, 35.0 ],
																					"style" : "",
																					"text" : "vexpr $f1 * 0.0175 @scalarmode 1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-31",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 41.5, 379.0, 29.5, 22.0 ],
																					"style" : "",
																					"text" : "$2"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-27",
																					"maxclass" : "newobj",
																					"numinlets" : 3,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 132.0, 407.0, 175.0, 22.0 ],
																					"style" : "",
																					"text" : "expr $f1 + ($f3 * cos($f2) )"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-24",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 74.5, 351.0, 29.5, 22.0 ],
																					"style" : "",
																					"text" : "$2"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-23",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patcher" : 																					{
																						"fileversion" : 1,
																						"appversion" : 																						{
																							"major" : 7,
																							"minor" : 3,
																							"revision" : 1,
																							"architecture" : "x64",
																							"modernui" : 1
																						}
,
																						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
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
																						"subpatcher_template" : "no-menus",
																						"boxes" : [ 																							{
																								"box" : 																								{
																									"id" : "obj-17",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 2,
																									"outlettype" : [ "bang", "int" ],
																									"patching_rect" : [ 50.0, 100.0, 100.0, 22.0 ],
																									"style" : "",
																									"text" : "t b i"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-50",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 175.0, 140.0, 22.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-43",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 133.0, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-18",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-19",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 136.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-20",
																									"maxclass" : "outlet",
																									"numinlets" : 1,
																									"numoutlets" : 0,
																									"patching_rect" : [ 50.0, 257.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
 ],
																						"lines" : [ 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-17", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-17", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-17", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-18", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-19", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-43", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-20", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-50", 0 ]
																								}

																							}
 ]
																					}
,
																					"patching_rect" : [ 325.0, 317.0, 37.0, 22.0 ],
																					"saved_object_attributes" : 																					{
																						"description" : "",
																						"digest" : "",
																						"globalpatchername" : "",
																						"style" : "",
																						"tags" : ""
																					}
,
																					"style" : "",
																					"text" : "p nth"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-22",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patcher" : 																					{
																						"fileversion" : 1,
																						"appversion" : 																						{
																							"major" : 7,
																							"minor" : 3,
																							"revision" : 1,
																							"architecture" : "x64",
																							"modernui" : 1
																						}
,
																						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
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
																						"subpatcher_template" : "no-menus",
																						"boxes" : [ 																							{
																								"box" : 																								{
																									"id" : "obj-17",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 2,
																									"outlettype" : [ "bang", "int" ],
																									"patching_rect" : [ 50.0, 100.0, 100.0, 22.0 ],
																									"style" : "",
																									"text" : "t b i"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-50",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 175.0, 140.0, 22.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-43",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 133.0, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-18",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-19",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 136.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-20",
																									"maxclass" : "outlet",
																									"numinlets" : 1,
																									"numoutlets" : 0,
																									"patching_rect" : [ 50.0, 257.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
 ],
																						"lines" : [ 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-17", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-17", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-17", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-18", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-19", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-43", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-20", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-50", 0 ]
																								}

																							}
 ]
																					}
,
																					"patching_rect" : [ 206.5, 325.0, 37.0, 22.0 ],
																					"saved_object_attributes" : 																					{
																						"description" : "",
																						"digest" : "",
																						"globalpatchername" : "",
																						"style" : "",
																						"tags" : ""
																					}
,
																					"style" : "",
																					"text" : "p nth"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-21",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patcher" : 																					{
																						"fileversion" : 1,
																						"appversion" : 																						{
																							"major" : 7,
																							"minor" : 3,
																							"revision" : 1,
																							"architecture" : "x64",
																							"modernui" : 1
																						}
,
																						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
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
																						"subpatcher_template" : "no-menus",
																						"boxes" : [ 																							{
																								"box" : 																								{
																									"id" : "obj-17",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 2,
																									"outlettype" : [ "bang", "int" ],
																									"patching_rect" : [ 50.0, 100.0, 100.0, 22.0 ],
																									"style" : "",
																									"text" : "t b i"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-50",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 175.0, 140.0, 22.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-43",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 133.0, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-18",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-19",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 136.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-20",
																									"maxclass" : "outlet",
																									"numinlets" : 1,
																									"numoutlets" : 0,
																									"patching_rect" : [ 50.0, 257.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
 ],
																						"lines" : [ 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-17", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-17", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-17", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-18", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-19", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-43", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-20", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-50", 0 ]
																								}

																							}
 ]
																					}
,
																					"patching_rect" : [ 99.0, 310.0, 37.0, 22.0 ],
																					"saved_object_attributes" : 																					{
																						"description" : "",
																						"digest" : "",
																						"globalpatchername" : "",
																						"style" : "",
																						"tags" : ""
																					}
,
																					"style" : "",
																					"text" : "p nth"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-10",
																					"maxclass" : "newobj",
																					"numinlets" : 3,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 331.0, 407.0, 172.0, 22.0 ],
																					"style" : "",
																					"text" : "expr $f1 + ($f3 * sin($f2))"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-51",
																					"maxclass" : "newobj",
																					"numinlets" : 4,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 492.0, 139.0, 22.0 ],
																					"style" : "",
																					"text" : "join 4"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-49",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 99.0, 273.0, 29.5, 22.0 ],
																					"style" : "",
																					"text" : "$1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-45",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 3,
																					"outlettype" : [ "", "", "" ],
																					"patching_rect" : [ 50.0, 239.0, 68.0, 22.0 ],
																					"style" : "",
																					"text" : "t l l l"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-44",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 1,
																					"outlettype" : [ "list" ],
																					"patching_rect" : [ 50.0, 208.0, 68.0, 22.0 ],
																					"style" : "",
																					"text" : "listfunnel 1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-39",
																					"linecount" : 2,
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 163.0, 120.5, 35.0 ],
																					"style" : "",
																					"text" : "vexpr $f1 * $f2 @scalarmode 1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-37",
																					"maxclass" : "newobj",
																					"numinlets" : 6,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 133.0, 96.0, 22.0 ],
																					"style" : "",
																					"text" : "scale 0. 1. -1. 1."
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-32",
																					"maxclass" : "newobj",
																					"numinlets" : 6,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 171.5, 133.0, 96.0, 22.0 ],
																					"style" : "",
																					"text" : "scale 0. 1. -1. 1."
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-15",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 6,
																					"outlettype" : [ "", "", "", "", "", "" ],
																					"patching_rect" : [ 51.200001, 94.0, 419.0, 22.0 ],
																					"style" : "",
																					"text" : "dict.unpack /center/x: /center/y: /angle: /rotrect/minor: /rotrect/major: /aspect:"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-56",
																					"maxclass" : "inlet",
																					"numinlets" : 0,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-58",
																					"maxclass" : "outlet",
																					"numinlets" : 1,
																					"numoutlets" : 0,
																					"patching_rect" : [ 50.0, 571.0, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
 ],
																		"lines" : [ 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-22", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-1", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-51", 3 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-10", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-1", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 2 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-2", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 5 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-2", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 3 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-3", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 4 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-32", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 1 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-37", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-39", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 5 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-23", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-2", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-10", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-21", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-51", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-21", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-10", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-22", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-27", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-22", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-4", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-23", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-27", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-24", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-51", 2 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-27", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-4", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-3", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-51", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-31", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-21", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-32", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-39", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-37", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-44", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-39", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-10", 2 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-4", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-27", 2 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-4", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-45", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-44", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-24", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-45", 1 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-31", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-45", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-49", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-45", 2 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-21", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-49", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-22", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-49", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-23", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-49", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-3", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-49", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-58", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-51", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-15", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-56", 0 ]
																				}

																			}
 ]
																	}
,
																	"patching_rect" : [ 50.0, 100.0, 108.0, 22.0 ],
																	"saved_object_attributes" : 																	{
																		"description" : "",
																		"digest" : "",
																		"globalpatchername" : "",
																		"style" : "",
																		"tags" : ""
																	}
,
																	"style" : "",
																	"text" : "p iter&scale points"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-2",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-3",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 50.0, 259.5, 30.0, 30.0 ],
																	"style" : ""
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-59", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-2", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-7", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-59", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-3", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-7", 0 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 306.083313, 343.5, 50.0, 22.0 ],
													"saved_object_attributes" : 													{
														"description" : "",
														"digest" : "",
														"globalpatchername" : "",
														"style" : "",
														"tags" : ""
													}
,
													"style" : "",
													"text" : "p angle"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 7,
															"minor" : 3,
															"revision" : 1,
															"architecture" : "x64",
															"modernui" : 1
														}
,
														"rect" : [ 177.0, 116.0, 640.0, 480.0 ],
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
														"subpatcher_template" : "no-menus",
														"boxes" : [ 															{
																"box" : 																{
																	"id" : "obj-3",
																	"linecount" : 3,
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 110.5, 196.0, 132.0, 49.0 ],
																	"style" : "",
																	"text" : "glcolor 1. 1. 1. 1., moveto $1 $2 0, circle 0.02"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-59",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patcher" : 																	{
																		"fileversion" : 1,
																		"appversion" : 																		{
																			"major" : 7,
																			"minor" : 3,
																			"revision" : 1,
																			"architecture" : "x64",
																			"modernui" : 1
																		}
,
																		"rect" : [ 738.0, 157.0, 668.0, 570.0 ],
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
																		"subpatcher_template" : "no-menus",
																		"boxes" : [ 																			{
																				"box" : 																				{
																					"id" : "obj-5",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 41.5, 303.5, 29.5, 22.0 ],
																					"style" : "",
																					"text" : "$2"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-1",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 2,
																					"outlettype" : [ "", "" ],
																					"patching_rect" : [ 251.5, 345.5, 140.0, 22.0 ],
																					"style" : "",
																					"text" : "zl.nth @zlmaxsize 4096"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-2",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 372.5, 310.0, 29.5, 22.0 ],
																					"style" : "",
																					"text" : "$1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-3",
																					"linecount" : 2,
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 2,
																					"outlettype" : [ "", "" ],
																					"patching_rect" : [ 251.5, 303.5, 105.0, 35.0 ],
																					"style" : "",
																					"text" : "zl.reg @zlmaxsize 4096"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-51",
																					"maxclass" : "newobj",
																					"numinlets" : 3,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 417.0, 139.0, 22.0 ],
																					"style" : "",
																					"text" : "join 3"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-50",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 2,
																					"outlettype" : [ "", "" ],
																					"patching_rect" : [ 74.5, 339.0, 140.0, 22.0 ],
																					"style" : "",
																					"text" : "zl.nth @zlmaxsize 4096"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-49",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 195.5, 303.5, 29.5, 22.0 ],
																					"style" : "",
																					"text" : "$1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-45",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 3,
																					"outlettype" : [ "", "bang", "" ],
																					"patching_rect" : [ 50.0, 239.0, 68.0, 22.0 ],
																					"style" : "",
																					"text" : "t l b l"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-44",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 1,
																					"outlettype" : [ "list" ],
																					"patching_rect" : [ 50.0, 208.0, 68.0, 22.0 ],
																					"style" : "",
																					"text" : "listfunnel 1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-43",
																					"linecount" : 2,
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 2,
																					"outlettype" : [ "", "" ],
																					"patching_rect" : [ 74.5, 297.0, 105.0, 35.0 ],
																					"style" : "",
																					"text" : "zl.reg @zlmaxsize 4096"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-39",
																					"linecount" : 2,
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 163.0, 120.5, 35.0 ],
																					"style" : "",
																					"text" : "vexpr $f1 * $f2 @scalarmode 1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-37",
																					"maxclass" : "newobj",
																					"numinlets" : 6,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 133.0, 96.0, 22.0 ],
																					"style" : "",
																					"text" : "scale 0. 1. -1. 1."
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-32",
																					"maxclass" : "newobj",
																					"numinlets" : 6,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 218.5, 163.0, 96.0, 22.0 ],
																					"style" : "",
																					"text" : "scale 0. 1. -1. 1."
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-15",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 4,
																					"outlettype" : [ "", "", "", "" ],
																					"patching_rect" : [ 50.0, 95.0, 307.0, 22.0 ],
																					"style" : "",
																					"text" : "dict.unpack /centroid/x: /aspect: /centroid/y: /ids:"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-56",
																					"maxclass" : "inlet",
																					"numinlets" : 0,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-58",
																					"maxclass" : "outlet",
																					"numinlets" : 1,
																					"numoutlets" : 0,
																					"patching_rect" : [ 50.0, 464.0, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
 ],
																		"lines" : [ 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-51", 2 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-1", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-3", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 3 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-32", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 2 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-37", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-39", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-15", 1 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-1", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-2", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-1", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-3", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-43", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-32", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-39", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-37", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-44", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-39", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-50", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-43", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-45", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-44", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-2", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-45", 2 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-3", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-45", 1 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-43", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-45", 1 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-49", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-45", 2 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-5", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-45", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-50", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-49", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-51", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-5", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-51", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-50", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-58", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-51", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-15", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-56", 0 ]
																				}

																			}
 ]
																	}
,
																	"patching_rect" : [ 260.0, 112.0, 108.0, 22.0 ],
																	"saved_object_attributes" : 																	{
																		"description" : "",
																		"digest" : "",
																		"globalpatchername" : "",
																		"style" : "",
																		"tags" : ""
																	}
,
																	"style" : "",
																	"text" : "p iter&scale points"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-46",
																	"linecount" : 2,
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 260.0, 204.0, 136.0, 35.0 ],
																	"style" : "",
																	"text" : "color 1 1. 1. 1., position $1 $2 0, text $3, bang"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-2",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 260.0, 52.0, 30.0, 30.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-4",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 260.0, 312.0, 30.0, 30.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-7",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 110.5, 292.0, 30.0, 30.0 ],
																	"style" : ""
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-59", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-2", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-7", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-3", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-4", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-46", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-3", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-59", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-46", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-59", 0 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 536.833313, 341.0, 114.0, 22.0 ],
													"saved_object_attributes" : 													{
														"description" : "",
														"digest" : "",
														"globalpatchername" : "",
														"style" : "",
														"tags" : ""
													}
,
													"style" : "",
													"text" : "p number-centroids"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-25",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 7,
															"minor" : 3,
															"revision" : 1,
															"architecture" : "x64",
															"modernui" : 1
														}
,
														"rect" : [ 59.0, 104.0, 1019.0, 758.0 ],
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
														"subpatcher_template" : "no-menus",
														"boxes" : [ 															{
																"box" : 																{
																	"id" : "obj-37",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patcher" : 																	{
																		"fileversion" : 1,
																		"appversion" : 																		{
																			"major" : 7,
																			"minor" : 3,
																			"revision" : 1,
																			"architecture" : "x64",
																			"modernui" : 1
																		}
,
																		"rect" : [ 84.0, 129.0, 640.0, 480.0 ],
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
																		"subpatcher_template" : "no-menus",
																		"boxes" : [ 																			{
																				"box" : 																				{
																					"id" : "obj-28",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 296.5, 83.0, 22.0 ],
																					"style" : "",
																					"text" : "lineto $1 $2"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-29",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 2,
																					"outlettype" : [ "", "" ],
																					"patching_rect" : [ 54.0, 233.0, 40.0, 22.0 ],
																					"style" : "",
																					"text" : "zl reg"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-3",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 3,
																					"outlettype" : [ "bang", "", "bang" ],
																					"patching_rect" : [ 71.0, 100.0, 237.0, 22.0 ],
																					"style" : "",
																					"text" : "t b l b"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-30",
																					"linecount" : 2,
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 328.0, 223.5, 119.0, 35.0 ],
																					"style" : "",
																					"text" : "glcolor 0.5 0.5 0.5 0.5"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-1",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 227.0, 223.5, 83.0, 22.0 ],
																					"style" : "",
																					"text" : "lineto $2 $3"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-77",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 110.0, 229.5, 83.0, 22.0 ],
																					"style" : "",
																					"text" : "moveto $1 $2"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-73",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 2,
																					"outlettype" : [ "", "" ],
																					"patching_rect" : [ 110.0, 186.5, 136.0, 22.0 ],
																					"style" : "",
																					"text" : "route 1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-59",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patcher" : 																					{
																						"fileversion" : 1,
																						"appversion" : 																						{
																							"major" : 7,
																							"minor" : 3,
																							"revision" : 1,
																							"architecture" : "x64",
																							"modernui" : 1
																						}
,
																						"rect" : [ 631.0, 241.0, 640.0, 480.0 ],
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
																						"subpatcher_template" : "no-menus",
																						"boxes" : [ 																							{
																								"box" : 																								{
																									"id" : "obj-51",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 388.0, 139.0, 22.0 ],
																									"style" : "",
																									"text" : "zl.join @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-50",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 74.5, 339.0, 140.0, 22.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-49",
																									"maxclass" : "message",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 195.5, 303.5, 29.5, 22.0 ],
																									"style" : "",
																									"text" : "$1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-45",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 3,
																									"outlettype" : [ "", "bang", "" ],
																									"patching_rect" : [ 50.0, 239.0, 68.0, 22.0 ],
																									"style" : "",
																									"text" : "t l b l"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-44",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 1,
																									"outlettype" : [ "list" ],
																									"patching_rect" : [ 50.0, 208.0, 68.0, 22.0 ],
																									"style" : "",
																									"text" : "listfunnel 1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-43",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 74.5, 297.0, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-39",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 163.0, 120.5, 35.0 ],
																									"style" : "",
																									"text" : "vexpr $f1 * $f2 @scalarmode 1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-37",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 133.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-32",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 271.0, 133.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-15",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 3,
																									"outlettype" : [ "", "", "" ],
																									"patching_rect" : [ 50.0, 94.0, 240.0, 22.0 ],
																									"style" : "",
																									"text" : "dict.unpack /x: /aspect: /y:"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-56",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-58",
																									"maxclass" : "outlet",
																									"numinlets" : 1,
																									"numoutlets" : 0,
																									"patching_rect" : [ 50.0, 434.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
 ],
																						"lines" : [ 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-32", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 2 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-37", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-39", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-32", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-39", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-37", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-44", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-39", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-43", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-45", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-44", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-45", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-49", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-45", 2 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-51", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-45", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-49", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-51", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-50", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-58", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-51", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-15", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-56", 0 ]
																								}

																							}
 ]
																					}
,
																					"patching_rect" : [ 110.0, 151.5, 108.0, 22.0 ],
																					"saved_object_attributes" : 																					{
																						"description" : "",
																						"digest" : "",
																						"globalpatchername" : "",
																						"style" : "",
																						"tags" : ""
																					}
,
																					"style" : "",
																					"text" : "p iter&scale points"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-35",
																					"maxclass" : "inlet",
																					"numinlets" : 0,
																					"numoutlets" : 1,
																					"outlettype" : [ "dictionary" ],
																					"patching_rect" : [ 71.0, 40.0, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-36",
																					"maxclass" : "outlet",
																					"numinlets" : 1,
																					"numoutlets" : 0,
																					"patching_rect" : [ 172.75, 378.5, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
 ],
																		"lines" : [ 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-36", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-1", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-36", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-28", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-28", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-29", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-29", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-3", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-30", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-3", 2 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-59", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-3", 1 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-36", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-30", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-3", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-35", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-73", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-59", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-1", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-73", 1 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-29", 1 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-73", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-77", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-73", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-36", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-77", 0 ]
																				}

																			}
 ]
																	}
,
																	"patching_rect" : [ 333.0, 458.5, 71.0, 22.0 ],
																	"saved_object_attributes" : 																	{
																		"description" : "",
																		"digest" : "",
																		"globalpatchername" : "",
																		"style" : "",
																		"tags" : ""
																	}
,
																	"style" : "",
																	"text" : "p draw-rect"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-27",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patcher" : 																	{
																		"fileversion" : 1,
																		"appversion" : 																		{
																			"major" : 7,
																			"minor" : 3,
																			"revision" : 1,
																			"architecture" : "x64",
																			"modernui" : 1
																		}
,
																		"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
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
																		"subpatcher_template" : "no-menus",
																		"boxes" : [ 																			{
																				"box" : 																				{
																					"id" : "obj-3",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 2,
																					"outlettype" : [ "", "bang" ],
																					"patching_rect" : [ 50.0, 100.0, 237.0, 22.0 ],
																					"style" : "",
																					"text" : "t l b"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-13",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 268.0, 210.5, 119.0, 22.0 ],
																					"style" : "",
																					"text" : "glcolor 1 0.5 0.5 0.5"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-1",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 167.0, 210.5, 83.0, 22.0 ],
																					"style" : "",
																					"text" : "lineto $2 $3"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-77",
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 204.5, 83.0, 22.0 ],
																					"style" : "",
																					"text" : "moveto $1 $2"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-73",
																					"maxclass" : "newobj",
																					"numinlets" : 2,
																					"numoutlets" : 2,
																					"outlettype" : [ "", "" ],
																					"patching_rect" : [ 50.0, 173.5, 136.0, 22.0 ],
																					"style" : "",
																					"text" : "route 1"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-59",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patcher" : 																					{
																						"fileversion" : 1,
																						"appversion" : 																						{
																							"major" : 7,
																							"minor" : 3,
																							"revision" : 1,
																							"architecture" : "x64",
																							"modernui" : 1
																						}
,
																						"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
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
																						"subpatcher_template" : "no-menus",
																						"boxes" : [ 																							{
																								"box" : 																								{
																									"id" : "obj-51",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 50.0, 388.0, 139.0, 22.0 ],
																									"style" : "",
																									"text" : "zl.join @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-50",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 74.5, 339.0, 140.0, 22.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-49",
																									"maxclass" : "message",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 195.5, 303.5, 29.5, 22.0 ],
																									"style" : "",
																									"text" : "$1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-45",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 3,
																									"outlettype" : [ "", "bang", "" ],
																									"patching_rect" : [ 50.0, 239.0, 68.0, 22.0 ],
																									"style" : "",
																									"text" : "t l b l"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-44",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 1,
																									"outlettype" : [ "list" ],
																									"patching_rect" : [ 50.0, 208.0, 68.0, 22.0 ],
																									"style" : "",
																									"text" : "listfunnel 1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-43",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 74.5, 297.0, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-39",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 163.0, 120.5, 35.0 ],
																									"style" : "",
																									"text" : "vexpr $f1 * $f2 @scalarmode 1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-37",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 133.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-32",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 271.0, 133.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-15",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 3,
																									"outlettype" : [ "", "", "" ],
																									"patching_rect" : [ 50.0, 94.0, 240.0, 22.0 ],
																									"style" : "",
																									"text" : "dict.unpack /x: /aspect: /y:"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-56",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-58",
																									"maxclass" : "outlet",
																									"numinlets" : 1,
																									"numoutlets" : 0,
																									"patching_rect" : [ 50.0, 434.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
 ],
																						"lines" : [ 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-32", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 2 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-37", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-39", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-32", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-39", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-37", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-44", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-39", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-43", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-45", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-44", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-43", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-45", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-49", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-45", 2 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-51", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-45", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-49", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-51", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-50", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-58", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-51", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-15", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-56", 0 ]
																								}

																							}
 ]
																					}
,
																					"patching_rect" : [ 50.0, 126.5, 108.0, 22.0 ],
																					"saved_object_attributes" : 																					{
																						"description" : "",
																						"digest" : "",
																						"globalpatchername" : "",
																						"style" : "",
																						"tags" : ""
																					}
,
																					"style" : "",
																					"text" : "p iter&scale points"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-25",
																					"maxclass" : "inlet",
																					"numinlets" : 0,
																					"numoutlets" : 1,
																					"outlettype" : [ "dictionary" ],
																					"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-26",
																					"maxclass" : "outlet",
																					"numinlets" : 1,
																					"numoutlets" : 0,
																					"patching_rect" : [ 155.666687, 292.5, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
 ],
																		"lines" : [ 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-26", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-1", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-26", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-13", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-3", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-25", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-13", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-3", 1 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-59", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-3", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-73", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-59", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-1", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-73", 1 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-77", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-73", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-26", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-77", 0 ]
																				}

																			}
 ]
																	}
,
																	"patching_rect" : [ 210.0, 458.5, 72.0, 22.0 ],
																	"saved_object_attributes" : 																	{
																		"description" : "",
																		"digest" : "",
																		"globalpatchername" : "",
																		"style" : "",
																		"tags" : ""
																	}
,
																	"style" : "",
																	"text" : "p draw hull"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-12",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patcher" : 																	{
																		"fileversion" : 1,
																		"appversion" : 																		{
																			"major" : 7,
																			"minor" : 3,
																			"revision" : 1,
																			"architecture" : "x64",
																			"modernui" : 1
																		}
,
																		"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
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
																		"subpatcher_template" : "no-menus",
																		"boxes" : [ 																			{
																				"box" : 																				{
																					"id" : "obj-8",
																					"linecount" : 2,
																					"maxclass" : "message",
																					"numinlets" : 2,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patching_rect" : [ 50.0, 155.0, 414.0, 35.0 ],
																					"style" : "",
																					"text" : "moveto $1 $2 0., glcolor 0.5 1 0. 0.5, lineto $3 $4 0., glcolor 0.5 0 1. 15, circle 0.02, glcolor 0.5 1 0. 0.25, lineto $5 $6 0."
																				}

																			}
, 																			{
																				"box" : 																				{
																					"id" : "obj-1",
																					"maxclass" : "newobj",
																					"numinlets" : 1,
																					"numoutlets" : 1,
																					"outlettype" : [ "" ],
																					"patcher" : 																					{
																						"fileversion" : 1,
																						"appversion" : 																						{
																							"major" : 7,
																							"minor" : 3,
																							"revision" : 1,
																							"architecture" : "x64",
																							"modernui" : 1
																						}
,
																						"rect" : [ 117.0, 79.0, 1256.0, 705.0 ],
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
																						"toolbars_unpinned_last_save" : 4,
																						"tallnewobj" : 0,
																						"boxanimatetime" : 200,
																						"enablehscroll" : 1,
																						"enablevscroll" : 1,
																						"devicewidth" : 0.0,
																						"description" : "",
																						"digest" : "",
																						"tags" : "",
																						"style" : "",
																						"subpatcher_template" : "no-menus",
																						"boxes" : [ 																							{
																								"box" : 																								{
																									"id" : "obj-36",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 6,
																									"outlettype" : [ "bang", "bang", "bang", "bang", "bang", "bang" ],
																									"patching_rect" : [ 513.5, 226.0, 100.0, 22.0 ],
																									"style" : "",
																									"text" : "t b b b b b b"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-34",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 972.0, 350.5, 109.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-35",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 972.0, 291.5, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-33",
																									"maxclass" : "message",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 344.0, 29.5, 22.0 ],
																									"style" : "",
																									"text" : "$2"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-28",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 411.0, 739.0, 22.0 ],
																									"style" : "",
																									"text" : "join 6"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-26",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 770.0, 350.5, 109.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-27",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 770.0, 291.5, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-24",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 626.0, 344.0, 109.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-25",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 626.0, 285.0, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-22",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 482.0, 344.0, 109.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-23",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 482.0, 285.0, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-21",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 338.0, 344.0, 109.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-19",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 338.0, 285.0, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-18",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 194.0, 278.5, 105.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.reg @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-17",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 626.0, 168.0, 120.5, 35.0 ],
																									"style" : "",
																									"text" : "vexpr $f1 * $f2 @scalarmode 1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-16",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 338.0, 167.0, 120.5, 35.0 ],
																									"style" : "",
																									"text" : "vexpr $f1 * $f2 @scalarmode 1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-11",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 770.0, 129.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-9",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 626.0, 129.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-6",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 482.0, 129.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-5",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 194.0, 129.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"format" : 6,
																									"id" : "obj-12",
																									"maxclass" : "flonum",
																									"numinlets" : 1,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "bang" ],
																									"parameter_enable" : 0,
																									"patching_rect" : [ 1038.583374, 429.0, 50.0, 22.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-8",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "int" ],
																									"patching_rect" : [ 974.5, 480.5, 100.0, 22.0 ],
																									"style" : "",
																									"text" : "> 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-7",
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 35.0, 526.5, 34.0, 22.0 ],
																									"style" : "",
																									"text" : "gate"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-50",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 2,
																									"outlettype" : [ "", "" ],
																									"patching_rect" : [ 194.0, 341.5, 109.0, 35.0 ],
																									"style" : "",
																									"text" : "zl.nth @zlmaxsize 4096"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-49",
																									"maxclass" : "message",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 99.0, 291.5, 29.5, 22.0 ],
																									"style" : "",
																									"text" : "$1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-45",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 4,
																									"outlettype" : [ "", "bang", "bang", "" ],
																									"patching_rect" : [ 50.0, 239.0, 68.0, 22.0 ],
																									"style" : "",
																									"text" : "t l b b l"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-44",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 1,
																									"outlettype" : [ "list" ],
																									"patching_rect" : [ 50.0, 208.0, 68.0, 22.0 ],
																									"style" : "",
																									"text" : "listfunnel 1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-39",
																									"linecount" : 2,
																									"maxclass" : "newobj",
																									"numinlets" : 2,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 163.0, 120.5, 35.0 ],
																									"style" : "",
																									"text" : "vexpr $f1 * $f2 @scalarmode 1"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-37",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 50.0, 129.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-32",
																									"maxclass" : "newobj",
																									"numinlets" : 6,
																									"numoutlets" : 1,
																									"outlettype" : [ "" ],
																									"patching_rect" : [ 338.0, 129.0, 96.0, 22.0 ],
																									"style" : "",
																									"text" : "scale 0. 1. -1. 1."
																								}

																							}
, 																							{
																								"box" : 																								{
																									"id" : "obj-15",
																									"maxclass" : "newobj",
																									"numinlets" : 1,
																									"numoutlets" : 8,
																									"outlettype" : [ "", "", "", "", "", "", "", "" ],
																									"patching_rect" : [ 50.0, 82.0, 1027.0, 22.0 ],
																									"style" : "",
																									"text" : "dict.unpack /start/x: /start/y: /x: /y: /end/x: /end/y: /aspect: /depth:"
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-56",
																									"maxclass" : "inlet",
																									"numinlets" : 0,
																									"numoutlets" : 1,
																									"outlettype" : [ "dictionary" ],
																									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
, 																							{
																								"box" : 																								{
																									"comment" : "",
																									"id" : "obj-58",
																									"maxclass" : "outlet",
																									"numinlets" : 1,
																									"numoutlets" : 0,
																									"patching_rect" : [ 35.0, 591.0, 30.0, 30.0 ],
																									"style" : ""
																								}

																							}
 ],
																						"lines" : [ 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-27", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-11", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-8", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-12", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-11", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 5 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-16", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"midpoints" : [ 923.5, 157.5, 449.0, 157.5 ],
																									"source" : [ "obj-15", 6 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-17", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"midpoints" : [ 923.5, 161.5, 737.0, 161.5 ],
																									"source" : [ "obj-15", 6 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-32", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 2 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-35", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 7 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-37", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-39", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"midpoints" : [ 923.5, 157.0, 161.0, 157.0 ],
																									"source" : [ "obj-15", 6 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-5", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-6", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 3 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-9", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-15", 4 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-19", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-16", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-25", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-17", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-18", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-21", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-19", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-28", 2 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-21", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-28", 3 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-22", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-22", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-23", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-28", 4 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-24", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-24", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-25", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-28", 5 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-26", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-26", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-27", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-7", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-28", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-16", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-32", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-28", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-33", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-8", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-34", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-34", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-35", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-18", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-36", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-19", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-36", 1 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-23", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-36", 2 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-25", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-36", 3 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-27", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-36", 4 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-35", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-36", 5 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-39", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-37", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-44", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-39", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-45", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-44", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-33", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-45", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-36", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-45", 2 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-49", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-45", 3 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-21", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-49", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-22", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-49", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-24", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-49", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-26", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-49", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-34", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-49", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-50", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-49", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-18", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-5", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-28", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-50", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-15", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-56", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-23", 1 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-6", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-58", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-7", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-7", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-8", 0 ]
																								}

																							}
, 																							{
																								"patchline" : 																								{
																									"destination" : [ "obj-17", 0 ],
																									"disabled" : 0,
																									"hidden" : 0,
																									"source" : [ "obj-9", 0 ]
																								}

																							}
 ]
																					}
,
																					"patching_rect" : [ 50.0, 100.0, 108.0, 22.0 ],
																					"saved_object_attributes" : 																					{
																						"description" : "",
																						"digest" : "",
																						"globalpatchername" : "",
																						"style" : "",
																						"tags" : ""
																					}
,
																					"style" : "",
																					"text" : "p iter&scale points"
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-6",
																					"maxclass" : "inlet",
																					"numinlets" : 0,
																					"numoutlets" : 1,
																					"outlettype" : [ "dictionary" ],
																					"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
, 																			{
																				"box" : 																				{
																					"comment" : "",
																					"id" : "obj-10",
																					"maxclass" : "outlet",
																					"numinlets" : 1,
																					"numoutlets" : 0,
																					"patching_rect" : [ 50.0, 250.0, 30.0, 30.0 ],
																					"style" : ""
																				}

																			}
 ],
																		"lines" : [ 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-8", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-1", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-1", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-6", 0 ]
																				}

																			}
, 																			{
																				"patchline" : 																				{
																					"destination" : [ "obj-10", 0 ],
																					"disabled" : 0,
																					"hidden" : 0,
																					"source" : [ "obj-8", 0 ]
																				}

																			}
 ]
																	}
,
																	"patching_rect" : [ 88.0, 458.5, 89.0, 22.0 ],
																	"saved_object_attributes" : 																	{
																		"description" : "",
																		"digest" : "",
																		"globalpatchername" : "",
																		"style" : "",
																		"tags" : ""
																	}
,
																	"style" : "",
																	"text" : "p draw defects"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-5",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "dictionary" ],
																	"patching_rect" : [ 333.0, 388.0, 51.0, 22.0 ],
																	"style" : "",
																	"text" : "dict.join"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-4",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "dictionary" ],
																	"patching_rect" : [ 210.0, 388.0, 51.0, 22.0 ],
																	"style" : "",
																	"text" : "dict.join"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-19",
																	"linecount" : 2,
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 2,
																	"outlettype" : [ "dictionary", "dictionary" ],
																	"patching_rect" : [ 365.0, 323.5, 88.0, 35.0 ],
																	"style" : "",
																	"text" : "dict.slice @keys /aspect"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-17",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 2,
																	"outlettype" : [ "dictionary", "dictionary" ],
																	"patching_rect" : [ 50.0, 150.5, 165.0, 22.0 ],
																	"style" : "",
																	"text" : "dict.slice @keys /contour/pts"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-16",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 50.0, 271.5, 57.0, 22.0 ],
																	"style" : "",
																	"text" : "zl.slice 1"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-14",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 50.0, 242.0, 53.0, 22.0 ],
																	"style" : "",
																	"text" : "dict.iter"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-11",
																	"linecount" : 2,
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 50.0, 191.5, 84.0, 35.0 ],
																	"style" : "",
																	"text" : "dict.unpack /contour/pts:"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-22",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-23",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 590.5, 592.5, 30.0, 30.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-2",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "dictionary" ],
																	"patching_rect" : [ 88.0, 388.0, 51.0, 22.0 ],
																	"style" : "",
																	"text" : "dict.join"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-9",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 3,
																	"outlettype" : [ "", "", "" ],
																	"patching_rect" : [ 88.0, 316.0, 263.0, 22.0 ],
																	"style" : "",
																	"text" : "dict.unpack /defect/points: /hull/points: /minrect:"
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-14", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-11", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-23", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-12", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-16", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-14", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-9", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-16", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-11", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-17", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-19", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-17", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-2", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-19", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-4", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-19", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-5", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-19", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-12", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-2", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-17", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-22", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-23", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-27", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-23", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-37", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-27", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-4", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-37", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-5", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-2", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-9", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-4", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-9", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-5", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-9", 2 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 280.166687, 382.5, 57.0, 22.0 ],
													"saved_object_attributes" : 													{
														"description" : "",
														"digest" : "",
														"globalpatchername" : "",
														"style" : "",
														"tags" : ""
													}
,
													"style" : "",
													"text" : "p iter-pts"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-64",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 809.833374, 434.5, 50.0, 22.0 ],
													"style" : "",
													"text" : "$1 1 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-15",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 785.833374, 354.5, 117.0, 22.0 ],
													"style" : "",
													"text" : "dict.unpack /aspect:"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-26",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "jit_matrix" ],
													"patching_rect" : [ 629.0, 33.5, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"patching_rect" : [ 629.0, 93.0, 169.0, 22.0 ],
													"style" : "",
													"text" : "routepass dictionary jit_matrix"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-71",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 785.833374, 396.0, 30.0, 22.0 ],
													"style" : "",
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-65",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "bang", "", "", "", "bang" ],
													"patching_rect" : [ 265.583313, 224.5, 100.0, 22.0 ],
													"style" : "",
													"text" : "t b l l l b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 809.833374, 467.0, 100.0, 22.0 ],
													"style" : "",
													"text" : "prepend scale"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-30",
													"linecount" : 5,
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "jit_matrix", "" ],
													"patching_rect" : [ 785.833374, 537.0, 122.0, 76.0 ],
													"style" : "",
													"text" : "jit.gl.videoplane cam @scale 1.1 1. 1. @automatic 0 @blend_enable 1 @name livecam"
												}

											}
, 											{
												"box" : 												{
													"attr" : "enable",
													"id" : "obj-63",
													"maxclass" : "attrui",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 844.833374, 503.0, 192.0, 22.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-57",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 577.833313, 497.5, 103.0, 22.0 ],
													"style" : "",
													"text" : "loadmess size 20"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-55",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 697.5, 492.0, 24.0, 24.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-35",
													"linecount" : 5,
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 536.833313, 531.5, 116.0, 76.0 ],
													"style" : "",
													"text" : "jit.gl.text2d cam @automatic 0 @blend_enable 1 @screenmode 1 @transform_reset 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-24",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 381.833313, 363.0, 88.0, 35.0 ],
													"style" : "",
													"text" : "reset, gllinewidth 1.5"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-29",
													"linecount" : 5,
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 258.833313, 537.0, 121.0, 76.0 ],
													"style" : "",
													"text" : "jit.gl.sketch cam @scale 1. 1. 1. @transform_reset 1 @automatic 0 @blend_enable 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-31",
													"linecount" : 4,
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 71.833313, 214.5, 140.0, 62.0 ],
													"style" : "",
													"text" : "jit.gl.render cam @erase_color 0. 0. 0. 1. @transform_reset 1 @depth_enable 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-52",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "", "erase" ],
													"patching_rect" : [ 241.583313, 147.5, 67.0, 22.0 ],
													"style" : "",
													"text" : "t b l erase"
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-52", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-71", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-15", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-25", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-31", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-52", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-31", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-52", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-65", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-52", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-55", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-57", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-63", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-64", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-65", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-65", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-65", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-65", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-65", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-65", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-71", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-64", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-71", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-8", 1 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 111.0, 490.0, 47.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p draw"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 111.0, 47.0, 24.0, 24.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 111.0, 80.0, 65.0, 22.0 ],
									"style" : "",
									"text" : "qmetro 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 186.5, 363.0, 127.0, 35.0 ],
									"style" : "",
									"text" : "cv.jit.contours @resize_scale 0.25"
								}

							}
, 							{
								"box" : 								{
									"attr" : "thresh",
									"id" : "obj-29",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 287.0, 130.5, 150.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"attr" : "invert",
									"id" : "obj-3",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 287.0, 156.5, 150.0, 22.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 300.0, 199.0, 49.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p basic"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 3,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1012.0, 695.0 ],
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
						"toolbars_unpinned_last_save" : 15,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "<none>",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 775.0, 68.0, 99.0, 20.0 ],
									"style" : "",
									"text" : "process diagram"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 24.0,
									"id" : "obj-41",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 771.0, 36.388885, 155.0, 33.0 ],
									"style" : "",
									"text" : "cv.jit.contours",
									"textcolor" : [ 0.505882, 0.278431, 0.141176, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"autofit" : 1,
									"data" : [ 154375, "png", "IBkSG0fBZn....PCIgDQRA..M7O..jvfHX.....GjWLo....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wI6c2iajisll.9My9t.pXVAIzr.lBP8BHF.c8KGMXLSKYWdp85xTsW4p1pr00nKyAHt.St.TAza.UHWAQk8JPsAYbKpiHYPF+QJEOO.DYEQb94iGRfJMxW7k..................................................................................................................................bTbYRVkjmq+yKm1xoSuUpS.................3crSU311DntMWqNQ66X8VoNeuP3JA................n1MI4gjrNUAb6T34VtlidqTmukMEu+A................vr2TDtsxNp2imn8crdqTmukIbk.................zhoH7UWl+LXcqp+7bzak57sLg+C................3U9vTW.y.kAtxYBmRd+C................3U93TW...................7RB+G.................vLSyv+cQRdtw0sEi8lj7PRdp92WmjU0eeWVT+6qJl2CaYd84ljbe8Z1rder96uZKy+1h4U54VtVULlKK98l64h583wQrGs4thw7T8ZuMKxedV20yxgZH0YR08eywU9r8xTc+rJUO+2bldW8uMDk6Q48zE0eWy8Xy6n2V+6C0Puu2k4dHd+C................3LSagq5x7xfr010i40gq557mgvpqqUY3AZ61ArdCYcKCe0PWuRccVUF7tcM7esEhu65Xr8c+sOAGaLgfqsyiKxqCoYaWOjg8dPa6whTE5yg7bbngf7TF9uc88O................fyHkAk5xL7.20ryzcy.mylfCtsfeU1021m08XE9uK54rpu41W3xZ69tuNkWYGIbcFWGuaWqyxwN12c177ZL0yso5461BlZaOK216aB+G................vrRy.GcWdYmm69T0M+tJUg6qsNb284kAVac85rYd21w7FRGsay7dnd+aFpsKR6gp59QdOOlfdUFDsxNb2S0eWagZaL64cEisuPxUVCCsS20kcM7eku6rptVtJUuKbWZOXfaqdKGayf+sJUuWrIXeWjteO8gC3889N28Yu.................NSzVWGacpBsUatukwuIrUOl165bKRU3qJm215Faa5lb8osNk2157cGhv+0LzcOltOu1k8bQdc.1ZKjbkge7Pzs310v+075lNFeWcsu9dOn78xgDZvEo82SudD2Kigv+A................bv0V3s1VP1ZqypsN8G5tE40c9s8sK0sQYPuFS2jaWC+Wyf+ssPLtK6YYnFKOeKOOWOv53PVmiI3eaL12CZaOF56MkAN8oQrOigv+A................bvUFDo6GvbJ63bCMPV2ULmG1g5sMWOx08PE9usE3w8cOKOuZ1Y+JC7Xec0twXeB+2PedNl2CJ2i9BvWoKZY9c0IIE9O................fYkxfHMjPjcYKyqqPU0TY2raU+CevVTrtOtkwenB+2PBJ49rmKxq6xhWkWeNdnBQ4Xqyc4cmjWW+887pbO1VmErTYHIuaf6yXH7e.................GbGpfvMDkgz6PF7o8IzZ65dLlts2ttmkAk6oTEZxMedcpNWOTNEmii48fxwMzNs3FkcExtBbpv+A................LqbJC+29Lujpfvcap5zcqRUv2JWuSY3+FSn61m666ZY96R.DGhSw43Xl69FTtKJl+5iv9H7e.................Gby8v+sHUA9quf9MUg+aL1m4tHUc7ux03gQtNCw6sv+Mz0P3+.................lT+kot.FgqSx8o8Nr2ejjeqwmu5jTQSi+HI+8jbSw2+asLV.................3cf4Zm+6lVF6p5uusv.9dty+cUKyey0Eibs1Fc9Oc9O................fYf4X3+Vjj0Eiqrq2sO0yaov+sHIO0x7aFHxCo2ag+6xLryKg+C................XVYNF9uaKFysG354sT3+tqXdWmjGy3OeNF04agv+U1AIeXf6yX5nhB+G................vA2bL7ekgaawAtddqD9uqJlypN990YbgU6PUmSQ3+tdj6yCEyuqfRV9N2UCb8K6rfB+G................vAwbL7eicsGa.rdKD9uEI4oh4zLfe2W7aqJWfczbO7e2Oh83hVleWgjrLjf2Mv8n74fv+A................bP7VH7eaqq1UFbqsUOkgp6xgT3ibO124dWw3KCi1hT0w+FRWs6XUmSQ3+dNCu6+spXd8EbvaKF65r8NN4McTeayt99G................vYj4X3+drXL8EpscI.ViITXis1ODy8phw1UPzJu2WmsGTxCYcNUg+acpNi5xhzdG4quyl15RfOltC.XYXAGy4vt99G................vYj4X3+ZKPe2kWFdqqyKCQUYWvqOsEbq6SUfxtpd+aKnXmhvtsHutyv0WmtqLHYOLx5ZWqywN1cctsE7ulOyZd1bQpd1Ud98b82uMsEXvmR06dWmp2MtMuLbpa98wbNrqu+A................bFYNF9ujW28+565tLt.XsHuNrfkWs0sAOEgcq79X0VV215Xc8EVvCUcN1wtqyss6sg9dwXB9WR06Ei48t0I4x75v7Mj8YWd+C................3LxbM7eKxq6pcsE9pMA6pL.VaqyocY5O.VSQ3+tpkwMjN.W4895Tc9sKl6g+Ko5YWac2uxqmR0Y5XLz..9P9yy3wF9uM2Ci88O................fyHy0v+swMoJnUMCJ0pTENplAbqL.VCIzWWjpNsWyPF9T8maa9GyvtsHuNPaiI.Xky8gQVeCsN20wtqysuwcSRtOuLrdOV+c6S2Ors0dcpdu3tTEbuxw1rFK+8tL12+.................dG6CScA.iPYf+79K................v6RebpK...................dIg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C................................................................................................................................3LvGl5BfV8cI46a74uLQ0A..................0VljmabA.................mQ93TW...................7RB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+2o2xj7cG3076pWW.................3c.g+aZ7GI4WRxOrmqyOjjesd891dtV..................m09wj7b802RxOmjuuwuurwu+bwb+9TEbvu032+7wrXA.................NW7q4kA764j70j7SI4+aw2+o5u+qsLme8DVy..................uq8c4kcuuc45q0qC..................GH+P1uv+s7jWw..................mA90raA+6WlfZE.................3rvmRx2x3B922Rx2MA0J.................vYieJiK7e+3jTk..................mY9ZFVv+95zTd..................me9bFV3+9gIp9..................NK80zev+9xTUX..................mq9b5O7eKmpBC.................3b1Wit9G.................vrxmit9G.................vryWyKC92WmxhA.................fW28+97TVL..................j7cI4aoJ3eeahqE.................3D6iScAPq9VR905+6eYBqC..................Z36SUm+6SSbc..................PC+7TW.................................................................................................................................................................................................................................................vkIYURdt9OubZKG..................1D7uMWql1xA.................5xGl5BfSlma4677G................fYnON0E.mL+8hO+aSRU..................v+vkIYUp5.fqp+L.........................................................................r+tLIO235pF+1hjbaRdrwuOD2jjGRxSMl2S0e2M6XctYM2TKqSxpjbeRtdKy84hqgLlwdsZj2GGxyF.................3cnlgX615u6x7x.pMjv+00bJudLIWLvZ6pTEzusslOkpvJts6uoJ7eGiyF.................3crxv+cQ5Nvcc4lNFeWWqSUf35yUiX8dbf2eGqv+8PO6+w3rA.................dmqL7eqJ9tmp+ttBX2k40gW6l7xNw2ksrt8EXuE40AP717mghaQpBG3c002ssrFsc+0U3+tZDW21x8aWcquiwYC.................bFnYnyZFBsGSUX21lmxKC2VecstGxqCzWaJ6Vd8EtuE4kgoqzP6dgCQagR75dF+w3rA.................NCTFNtMA+qu.0sQYWvaagErL7bO0w3JCB2PpktbHC+2iEq0c8L1i0YC.................ua8got.lQJCD2ejj+4j76CXtOkjKp+u+6I4uNf4bWdYWs6uVO2lVkWFVt844U482ttV2mpNR3F+Vpp8+niwerNaN09bR9zDWC..7Reo9B..............3crxNi28CbdWVLua5e3+CWULuaaYL2OfwLTGhN+20srNW1y3OlmMmZeIs2cHc4xkKWtbMcW+T..............f2o93TW.yXCsSycUwm+a635WtNIUcUul1zQ7VLv83P5h75.Q9ujWWiMcLOa..f+0TEBP..............3cmOL0EvLR4+vw+ejj+X.yaU9yvo86I4+4NtmcM2lq+F+QR92RUX598cXuRF+y9GyK6xe+sj7+YKy4Xe1bJ8yI46m3Z..fJeWR9e03y96zB..............ui8bw0P8XKycWuZyhsrG2mptx2w59KopaC1btqyv59fG6yF..NOsL96I...............mM10vlcnB2111yx.3Udc6Q596pVlaYmHbn6ov+A.vgvx3um...............b1XpC+2SCXutHUg76oNVi6Nv2eKRUW9an6w11yi4YC..mOVFg+C..............NabHB+2piPc0kaR6g.rqtx2tb+8Pwbdbj03Tc1..v6aKiv+A..............mM10v+8Xi4r9HTW8YQw9+bpBrWaF682sEiecp57fiwTd1..v6WKiv+A..............mM10v+cew7Fa.41WWlWGRu1Ll6uKqWmli+lcn1l5yF..deZYD9O..............3rwtF9uaJl2cG9RaqFRsOz6u15lf2ui00b3rA.f2eVFg+C..............Narqg+aQdcWx6xCd00+92bueriwMz6u6JF2S06wtVaS4YC..uOsLB+G..............b1XWC+WRxsEyccRt9.TSWksG7tx8tqtq2Pt+tNu99XeCq2w5rA.fyWKiv+A..............mM1mv+kj7PKqwpjbSRtnXrWkp.vcWp5rdk+d4Zde83aFDvKq+9x8rq0Za2eWjW2k9toi0ZrNFmM..b9ZYD9O..............3rw9F9uEo8v3Mjq1BY2hCz5Lz6uU6XsOjysC8YC..m2VFg+C..............Narug+aiaxq6fda651VVmKSUmuaHyecp5Vd8Ya2eGhf+ssysC0YC..m2VFg+C.............f249vTW.yHk+CGeeOatNIWkjKp+yM9sj7G0+4umj+V8mG65760qweOI+6Cnd1182g5e37C4b6Pc1..v4okI4+eiO6uSK.................vDaYz4+..............3ctON0E...................ujv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e...yI+ZR94j7oCz58CI4Wp+S..................1AeWR9ZRdNI+mI4Gq+tlVV+6atJ88oJ.geq92+kiRkB.................bF46yKC22yopi.945eeYdc3+9TpBJ3WK9s+ySREC.................bF3GyqC.3yopa98+q369ROi8Sm1xF.................38suj1C02Pu9wSdEC.................7N2mxtG7uubxqV..............3.5eZpK....5v2RxGRxxcXt+uqmO..................GAeMiqq+8SSQQB..............GReXpK.Z0mRxma74eZRpB..Xd3GRx+w.G6+Up96Roq+A..............bvsLur60...m69RFVW+6ySS4A..............bNXYD9O..nokY6A+6qSTsA..............blXYD9O..nzWht9G..............vDZYD9O..nzxnq+A..............LgVFg+C..ZyWht9G..............vDYYD9O..nMKit9G..............vDYYD9O..nKeI55e..............7N2Gm5B...fQ5WZ7e+ekjechpC..............fyLKiN+G..zmulp+dR+7DWG..............vQgN+G..vaQ+R8eJ7e...............mLKiN+G..zmOkjuLw0...............vYlkQ3+..fs4SScA...............GKebpK....1QecpK...............3XQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lY9KScA....StmK97Gljp..............f+Ac9O.................fYFg+C.................XlQ3+..fW6xot................Nu8Wl5B...lItIIWUesHIeXZKG...............XtYYRdtwE..GeOG++e47k2+A.............lY93TW...................7RB+G.................vLiv+A.................LyH7e..................yLB+G..mqtMIO23pzysbsZ.q6E0q8pj7TwbuKIWuuE9HbSRtuQcrttNtstNaNtl2mW1w5cYw3tpwusndceLcelVVWqJVuGq+9q5dpIo5brbdiQ48aey+lj7P9y6qMmg2m86Y40o59XU8Z1rV17LpqmCMqs84b7PZy4Ty24ep96t4DVG..............vQ0xzeXD..X+UF9ugb0W3+tHUAtZHqyS43FLqqxKCgUWW2VO9sEDxlZa9W1w90zlvAttkw00Y8hNpgKZY7aKnbM8PwbaKbZWMvZ8odpy1baF1ylMWkAL7PdN1TeO65SWO6KudLuLvo..............vaRKiv+A.brcHC+2PCJV40wninU1U6110cY+B+2Eo668ltZj00l.i0Uv0J61c2sk5di1BNX4dLlZcnccvE4kcEwgbstk04PeNtwtD9uw9t15LtPZB..............yNKiv+A.bpsKgeJoJLSky8oTELpMc5rE0etsvecHC.Xagw5w5ueS3utHutywUFjt9TF9ux49T820Vn31zg3dHu77oYcUV+2Ov60m1RcuQ4dTt9KxqCy3s4OCs1hTE.u6p2yay10Uv+VkpN6W44v0000CcrdGxywMF66+ku2uNu78rMio78igFVR..............XVZYD9O.fSscI7esETr6S+cYs6aYuNDcCstpktbQ5tSz0mxvq0LTWWsk41LDccosNa2EcL1x62q2xZm7564x4TFpv9B22hr8NpWa645r8yp9bnOGSKica1D.wgzQ+dHC+LE..............l0VFg+C.3TaWB+2cEyY0.mWY2PanyqOkgJrqtFWSs00BGS3+ZF7ugDBtgp7doqvhUd9usta2EEiustEXYP0126qxtv21BJ2gzPOGSF26.k2SaKHikAScncoQ..............X1YYD9O.fSswF9uEsLm95rZMUFBswL2CcsTFftwF9u0iXuFpqK1itBxXami8EVuxPqcWKioLXl6qco6DdnLzywjw8NPyt92PCtZ46Y6SmOD..............lLKiv+A.bpM1v+cSFdvpZSYGlqutx1wrVZq6+0mxwtsts2tnLLiO1yXKCq2M8L1GKFaagVbLcKusoL7c8cebLLlywg9NP46K8cd2zU4vctB..............SlkQ3+..N0Fa3+JCI1PCA0FkA1ancPsiQsrOg+6X0I6FZMMzywxtDXWiqb81DTs95nfc4PFjvc0POGG53J6dhi4b4P89N..............LYVFg+C.3Targ+qriyc4H2uxNn1Sib9GxZYeB+2tDJtMtJUgI6gTcOrtk0eH0T47Zqi9UFZs9BHY444y06wscr1CccF6ykg5PbNNzw07dZruydndeG..............lLKiv+A.bpM1v+M1werViCWl4k...H.jDQAQkCw5rOg+arVjpfp0W.0Fa3+tqXrs0g8drwuuN8GZwEEiu759LrP.dnd91UMdHOGG5356bYrW..............vaNKi+gQC.bpI7eG+v+cc5NrZqSUWkay0X1mKJFaYWkq72uef0aY2Br7psPF1zwJraGiywccbB+G..............mUVF+CiF.3TS3+Ntg+6lVl6p5uustv2X2mxftcYieqLDeWMh59h54+TK0zyopqC1kiQX2NVmim5v+UFPS..............3MgkQ3+..N0FaPsJCC1k8O7W4xh4+3HmeSkcAtKF47O1g+aQK03MG38oLTbM6teO1362mPmcSZODfcElv88cjRGyywcYbqFTUC..............uirLB+G.vo1XCa1CYbgvpTYX0dXjyuoxtd20iXtKx3t22kv+U148tc.yYW1mlAiaSH+Ju+Fxd2mE4kgIrumckOW1289XdNNzw07de8.1e............f+a16NF21HqMcA76X7u.L2AFZEX.s.tUfl7NQ.2rqizepyzMzSllLmp+HGqNouwpAFu.TCza.0P2MfZuCzDPxwEOpHYUTjrNj74AnfMIq5TeUwRGRBTu3CfMz6F6B...NP8GEOdYc+skoLfd+9HUKu0tQWeTdr9u1Q6m1i6YY5wV499Wei6i+NI+yhmaYmuKeOcnWiTZecdbUZes1jL7tLI..............bPqI57e..6aCsSycVGaSeCR24crsSFX811EEi0yCX7tsiZYU1jNx2P2ltN+zGkumbSVrCM9V5thk5S8000Huk..tKOO120qriUdSOpC..............3nQSD9O.f8sGyvCxW6fk8RRtuGayjj7Pw1c6FTukJq+9DJqtBG19H7eqqawUddcHeen6asMOjoAgb9iuZ.iypLon1dnm0yPClYoc44w9tdSxhmSGRnWA.............fCdMQ3+..12JCoUeBj2Y40Ag51r7vcMIutS68VBCVaWlWGfqqWw5edG09tJ7ekgcbU0UYmkaneenks8O2ys+hr92OttXrWUPK6JfkOm90A.Kqic44wgb9t73+4L85O..............3nWSD9O.f8sx.MMOHeWLa4pzcmVqqPV8Xw5e1rGW1c9dI8KDX8UWc5s6xhAy5rL8Xcdv+JCT1tH7eccN5lr34yKyhAvrLXhCQWgZrOcBwjedN71Y0T6.3cddc3M6SG3aYAw6175qqNe1ycWdcmjbWddbnuu100Z22wwSxzqwubVs9XGuN..............bvnIB+G.v91jr7Ng255zZKKbWqZouc+sgdLzUX9VUMzUmoaU1jv+kAVW2LaYS+9PkaaeBnWxzyeC88wq5YMsIWiz0w8t573PeesqtX419bF..............TcZhv+A.LFNOqN.fKK7ey216Wx1Utba1cc+rIo6vuUt7vrZNc7ZqxlF9uIY8medN+LXXkchwgb95xhs8tdtcmmt6NiKqVur6gYkieeuFY9x4Eiwt573l995UY8glcH+cD..............T0Zhv+A.LVNKSCOW6.V83rG2mN02EqX6uN6tP+UZ9wQ6NE2iYZP3J67ZkgBbU1zPhM2Uypg1AFa94lIsVuxPqMjtjXYGoancXwKmMFkgraYm+Fpyyziu6yhgM7gYO2sy1Gq5Zks84w256qK6b17ioalUySV1................GBZhv+A.v9wjr32639wsbdyNKGWGO..............bh5cicA...LpJ6Db+wnTEaO2V73+yQoJ..............f2Hg+C..NscLE9uaxhGO+9rE...............1JZRxKsV..fcgyyhemimG2x4M4575ikyF0JB..............3nSSD9O..Ftyxq6jeKyEYZ.4Z+cNtdGUW6RSRxsYwiiC0iE..............fJWSD9O..Ftaxzu6viy9+Wloc2u4lL645Jrb2uWqz2tIYZ.+JCv3KY5wG...............acMQ3+..X3dLuNHb8Y4tLMLcGRtJcerH3e...............6LMQ3+..X3tIc2I7V1xiYZ2y6Pzj75imC0iE..............fCDMQ3+..XycYlFDv6SxC4memhGl8b2LacNzce9Y296rQtV...............NAzDg+C..VmyxzN.H..............bz4eL1E....an+ZrK...............XW4cicA..................vhD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJy+XrK....Fn2mjO15weejpC..............XmQ3+...Nz7wj7e05w+aiUg...............6JuarK...................Vjv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A..TS9TRd+VdL+PRZ1xiI..............rSI7e...0l+NIeKI+xaXLdeR9bR9yVK...............7lzjjWZs...mR9Z942C5Gyd7Ga85MY4eWoOkjeq30+X...............XKnIB+G..m19yr32G5kj7Tl1M+9eW77MYZmB7GcrMeduV0...............G0Zhv+A.vosOjtCy2PV99dtlA..............Nx0Dg+C..9b17f+8iLM.g...............r0zDg+C..RR9yrYg+6yiQwB..............bbqIB+G..jj7wL7f+8miRkB..............bzqIB+G..L22xvB+WyXTj...............G+Zhv+A..y89j7izuf+8aiTMB..............bBnIB+G..z1WR+B+2GFmxC..............3TPSD9O..ns9z8+91XUb...............mFZhv+A..k9Rz0+...............FQMQ3+..fRqp6+8swqr...............NUzDg+C..5xWht9G..............vHoIB+G..zkt59eeaLKH..............XW3cicA...v.7i75v980QnN...............NA0Dc9O..XY9P942S56iZk...............6H57e...GZdJI++l8++13UF...............mZZhN+G..rJ+RR9wXWD...............mVZhv+A..qymG6B...............3zRSD9O.................NY8twt...................XQB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..fSGmmj6SxKy92yG2xA..............fCKMY5Mk+7E..XaXdv+lub+3VNm7D9R..............3.SSD9O..19doiE1utJI2kjmiy+..............vAml3lxG.fsuxN+2Cia4bRR3KA.............fCXMwMEN..aemmeF.v6m8X1uD9O..............3.VSbSgC..GiD9O..............5k2M1E...................KR3+..................pLB+G..b53khktbQw5bUwqedRtII2mjmmsN2O64NuG0vCEi+0C5HXZ8zd6enmaycI4wVa2iydtxiuk47h86EsdsIY5wQ6is4tNq9bd46IyOeB..............TgZx5uw7A.fgpOg+qb8lGNuyxzPo0UX0ZubWlFFtkoLLb8I7dsc2RputbdVLveKa4gYGeqSW62ksOlq73sOKB+G..............ToZhv+A.v12lF9uyyO6xe8YYUA5aRGqeeBd2x11kEzvxND35VdNquyEVdd4rr7yKyI7e..............vQjlH7e..r8sIg+6lrXms69LMPaWjjKm85cE.tU0Q9FR26qsx.8c6RVuyKVummssSJVmxNY355Bgk0b41+3rmaUiSeeO...............nB0D2T3..r8sIg+q8xUKY8mjoAdaS6JeqKzcyUFZvKWx50Nrhqqi9MjfHV1c9ZW+WzyiAg+C..............Nf0D2T3..r88VB+2xB92bSxq6.fqJHckq6Y8X7K6xdc45h0acgxqrtW13lz84kGxxC4XeFC..............fCHMwMEN..aeaZ3+tqmi+MCX6tsXcWUPASdc2B7lkrds65e2ug08xBLX44kmy5Cs35FC..............nSuarK...fp2u1y062Kd7pBFW4Xd4ZF6x.48u5XcNuXeto0848b690j7W8bcA..............NBzDcDF..191zN+WeMYfa6iEq6xBKX439vRVuqKVuICn1aucKqiAVdrst.K1mw...............5jN+G..v1xeOv0ur68srvzU97c00+RVr6.9WaP8L2p5XgsU1w.A..............Nx0DcDF..1910c9ugtsmk90Q+tq057bVdG86gN1+a5xa8XaYz4+..............fCXMwMEN..ae0V3+Rdcf8J65dSJd8aGv9V3+..............3f06F6B...3j1+p3wWtlG+q6vZYt+ZOrO...............N.0DcDF..19pwN+WYm86ghW+tVu1iCXeee+K4dSm+C..............Nw0D2T3..r8Uig+KYw.98RRNa1yWFLvqWy37Pq084AU08iv+A.............vdy6F6B...3j2uV73KK92ksdk9iV++I4mgHD..............N3H7e...iseMI+cqGeQw+lj76I4uVy37GEO9p2XcA..............vBZRxKsV..fsgWR+9NF8c81la6MEa2jj7bqG2mf7UtMujjyGPMrNukyKy8X1c0G..............vNVSD9O..19p4v+cdw10NLfOmoA6qOttXbdNIWNf5XU1Fg+69hw31sSoA..............rOzDg+C.fsuZN7eIutq3soAj6tNFi6yztG3YEq6EYZ3.uY19u70aaaD9uxvIN+36hYKcUi...............UhlH7e..r8U6g+qqfw8Rl1U.GhIYZf55ZrV2xUqXb2Fg+aRl1MBWUMb8FN1..............bD4cicA...vL+ZGO2ekj+Xfiyemj+4rk+dfa6jAt9C0emj+8L75B..............nBzDc9O..19p8N+WRx8Y62E7tLS6Dfki8CydtaxzN925B921ny+M2Yy1usqoGm83KdiiM..............vNRSD9O.................NY8twt...................XQB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pL+iwt..fQ22G6B....NJ7sYK............rEH7e.b55CyV9eMtkA...bj3oYKeeTqB...........fiDuarK..Xz7oj7eM1EA...bz3+S7aL............1Zz4+.fjj++I4aicQ.PO8gLMbAy8eLR0A..S8gr3mMC............GsZRxKsV.XW3K4myy78QsR.XXZhuqD.PMoI9rY...........fst2M1E...................KR3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+.33zWSRyVb79PR9bR9ks3XBPW9R1ty079X9K.f2huFe1L............7+nIIuzZAfgpISm+3oL8l08icrNeI+bdlu2wq+9j7oYu1KI4aa2RDfN8wj7iYKKa9qlr9uqzmRxukkOGG..8y7Oa9or4e177eagOaF...........fCdMQ3+.d69bVbtj+b1y8gYu9WR2g+6Wxzf9UtsuemWw.L0mxhyA8TVb9qlz82UpISm+5GsdseDyeA.7V8orYe177eawOJ1Ve1L............GrZhv+Arc78r37IyW9s7yttwKI4gLsKd7ikr9c0cO.XW5ao64i9yjbSwy80LMHAcs9M60pF.33U6e+P6kuGe1L............mPZhv+Arc79r7.802kuruKZ.xz4udJus4u959tnA.Nh42V.............Q3+.1t9kr42bt+4HTu.LWS174udJSCo...aO9sE............bxqIB+Gv102ylcC59wQnVAnsukMa9ql8eoB.bR32hOaF...........fSXMQ3+.1t9PF9Mm6WGiBEfBuOI+HCa9qeaTpT.fSCeHC+yl+1HTm............vNQSD9Ofsuuj9ey49iLMvM.TC9bF17WeXTpR.fSGeI9sE............bhpIB+Gv12P5dVedjpQ.VlmR+l+5KiS4A.bR48wmMC...........vIplH7e.6F8o6Y8zXUb.rBeJ5rP..0jOk98aK7Yy............bToIB+GvtySY02fteZrJL.VimhNKD.PM4o32V............vIllH7e.6NeJ55e.Gl9knq+A.TS9T7aK............3DSSD9OfcqmhNyAvgomht9G.PM4o32V............vIjlH7e.6VeN5LG.Gl9Tz0+..pIeJc+Yy............vQolH7e.6VuOSugb0YN.ND8Tz0+..pIOEe1L............mHZhv+Ar680nqYAbXpr6k9gQsZ..3KYwOa1us............fiVMQ3+.189P947LecbKE.Fj1cuzuMtkB..Y5mMO+2V7swsT............fcqlH7e.6G+Vz0r.NL8sLc9qlwsL..Xlukoe17GG45.............1oZhv+Are7KI46icQ.vF3iI4owtH..3+QSR9ywtH............fcslH7e.6OMicA.vFRmEB.ntzL1E.............rq0Dg+C................fSVuarK...................Vjv+A.................TY9GicA..Gbdo3w+a6n8yYI4xjbdRlz5e+6j7Gs92ee1+BbbaeM2ytzwvw...............bRqISu4vmu.PM4krami5rjbaG6mUsb+NnN.pK654d1GNFNF..............fSZMwMFNbL37LMTZyCm14ia4r0rKCux4I44N1G8YA331wveyeLbL...............mzZhaLbnVMj.7MO3eGacmtcU3U5J3e2mjqxztAX606pcXc.TmNF9a9igiA..............3jVSbigC0jqRxc4mASquNV6Nc6pioxvRd6HUG.0oig+l+X3X...............No0D2X3PMYSCqQYX1dX6WZihcQ3UtrXL6SWRTHZfSKGC+M+wvw...............6IuarK..Nh8+MI+9r++umj+4HVK0tKJd7uNJUA................rBMQWgApI5TSKZWb93ghw7rQpN.pWGC+M+wvw...............6I57e.PM37hG+WiRU................TID9O.................fJiv+ArubVRtNI2mjGSxKyVtOI2jjKGvXcQqs+kYi6x1WOOacdd1iud1quJWWL9kdoik66w5sItLSO+z9X4kj7P94wSYWyqzUI41Yqe654gYO+EaXs8VMzyway5bab83YcTi8U62Kua.0b680iCX+A8wUY50iOjEm271Lr4nmaaNu+P1Wax79qy7yMsONdb1yc0abrA..............Nfzj2dfgfZwYYZvQ5JLWkKOl9GvqtB+2jAruJCLXakg+qOKa6v+ccVLjIqaoLDMSlMFO2ys+9YaSerMB0XWiy5VJu1XSpis80iyCI0PBnXY3UeI86b+UEayM8Xaf93hzu4JdL86Z08w79s+a9a5495ldV+scd52bwOj9Evvs07m...............ijl3FCmiC8MPIkK8oKJ0d8uNSCzQYPr1z.uMlg+aSNNdtiwoq.l0mvqzmfwrsBuxPqu2Z3+1EWOVdsxpBU5bcETo9zAztqXaVWGeD5igLWwC8b71Gy6+R1r4K667bIuNvs8Yt3082kaq4OA..............FIMwMFNG9NOuNjCOlogoXd2QZxrG2U3MVWPPJCbU6w39Ya+7.db1rG2U2a5tdbrrog0Xna2xBxxsRI.2A...B.IQTPT8YZ3vZ2UoNa1ycaV9wv7i26xhm2mu8cExwa6QctKBuxlLlCYa1UWOVNtcEBzRcccXeNu2NPUO1i0GVmI40A0657y.rMISCy2MY50bqKbq6y48mO2V47j8Yd+972okGKOmE+bk4qy8Eq25BHov+A..............G3ZhaLbNr0UfRtMqtaKcadcnHVUGTpLTFsCtxppqt1OqqqqsuB+WYXXdNuta2MDsCwyxzUW+5rUtEGdg+aWe8X4XuJsCTT62u6p6M1V46S8Irfv5T1Y6V27mq5uY12y6Oj5tq8y5BZX6PCttN5WYW4bU0iv+A..............G3ZhaLbNrcSFdWVJ40cPoUscCM.HsUFTi00E01Gg+qrK7stvlrMUFLl0cd7PK7e65qGKO+sp.a1984qyhgkZUueWd8w5BrJzGkyEtpf5sN0979k6mUMue4eustPXWF7wUM1B+G..............bfqItwv4v0j75vMrtNI2bmMfssb8VW.9V29YHcap9ZHaWYGyZeFtqKK122sl0+PJ7e6iqGGR2Sqc296hrX3qtoma255RfPeUFHtM0g579Kad11c8u9FhwxvOtr.CJ7e...........7eyd2+J25XY4KnWUF4CPwmfoCceApHT4O3FgJ+1Qscaox85ozajoRuxUoyTiqRmquNQzmwWmH54APmn6W.cp9IPiAHZAt4F+YSRP.R98EAiJOT.ar..4VPrvOt...3DWU3FCmSWoAgZnfjkJsST0UPpRCPwcEtcR6Va8E7poN7eogu60B1FGBoA2Yns+oT3+NFudL83WWgEJM7QQrYGFqqi6oi+SEtO.cozt9YWlq48KsdS2N4l2+5jkYr+tkaFYsI7e..mdNV+9aWm............rkeZtK.fyNocPuuT35mt7c08jFZ8Jc46qy+M0R2G+8i71+GI+647Xwg1w30i+HY4550rs6xXeI4+Mh5ZMWGOKc79VGiOTpzWK8XTGZsUENNy079kNW4Xl2eWmOdW2G...............NwTE91dmSWuDa952RCRVZWW5sNVt8sqHj1E1dumkcp67e66wrw5lnNXOOuda9dlZbL6imRc9ui0qGuOY4xE7m1ccr1cEr2634aj1c1JMXVPeReORy7g2G4Ci5XFik579oamby62deoq5nKGi8A.figqiO+chuDmWe4frKz4+............XCUga3KNccHtgEGyXbr1N6y1ZpG+wXUTGhm9B524b3+NVuNIMTQog3aUxOu8MPc6v88blw9sA94v9XUDwqQ2yE7TLbH.Oml2uuiEk9Xp1G..lZoA6+k4sblcB+G............anJbCewoqyoPfruaq4N7e2FcG5u2i5ah2lGB+29WasCoW5MH8cs9YocDr1+rOhM6reocnx61o8.XXocuxzG45JkMNml2+PE7Og+C.NkM1eu1khi0wBGyA...........NQTEtgu3z04THP12s0TO98IMPYMAR6tXyvksK0fv+k2S8rbs+YOk7yR6Jf215mkFHqg5.av93pn90bsCxZ6GO1w5cNMu+gJ3eog78PtO..L0R+xA404sblcB+G............anJbCewoqzPibcgq+0w3tQS22aLxzsSZmZ6PrsF65suGyRsJ1ti+MTGi6bM7eGqWOFQcn8Zur2z5m097wsaupwqs94sCG3yibaCGZ2E4CA3MYV1Sk48S6jl4l2er+dgckape.3Tv0wmA.7kX++6SN0I7e...........vr4ml6B.3ry2R926RHPZ666QsTx14GSz1YLR2GyEtlRj1c+9kHheaOGySUGyWO96crtWGed93GYVtz08lN9uysdvT42hH9yw1uGJWPhOUl2Oct0by62de4ROnC.vkquEQ7WhH9Cq+eS+c8............bjH7e.GZo2XnkFjszth1W1w0aHo00bdCsltOtug+K8XwkZv+h33+5wbg3aLA3q8yeUqGq5XYfigeDQ7WSdtbuG5TYd+zv7kad+1O2pn98g...............7eqJh3iVOfSIWEa952Ohw28jtNy5tpikMc4dZOqw9B3Q5xNVic8xUO6S..Ksdycb+PN9iwtLliYcNVudrw8sV12W+buz545KrRu1Z4ta8il+8airlgovPuWatl2+4QtM5pFyMu+cIKyiErMFioX9S..lVGqe+sqS............3DQU3F9hSaOGa9Z3WFw5rJ1L7SCEnuzaLxgBVUasCi0XBN3aIK+XC0RI27lo0z6wvAMara2g5bUomuNmB+WDGmWO1HMfQs+2u2y5EQcHiZusZ+uOzAPBFqUwlul90NVtyk48WE0uWcWlyeLbS8CPs6h54hatN62i54puO17ZWSCk8XmStY7Sm++00OeIeQarOycuKq6cQ8uWs42Q1br4onrtd69LN6597g539MIq+cI+7qi5qO9k3yeu8KqetC4u2tQeGOtJpeca6ZoqWOuOam8YY2k0M8Kng1m6VE06asuNN...........fKJUgaLbNscUrc3IdJ5NLaqV+yKI7a4BAx6Q+2Po41NiIbbkFVvtpw9jq6WMz9SiziSogo49dV2zan5o9FM8PNliccNFudrs1G+a2I.G50MseMvqwlutaJtIlgahx5lkeDcGD0So48eO5ed+z842ixBaQelh4OA3TxMw1ewZj6Qy0ulNmbeZBjT5uOpqGuDi656l5PV03lQV6uMPceHFmRp6iww8lWObUr8eaVtGOOxswX00wiGy7yx83wQVOkbb+X75xbmCtNx+dX...........fKJUgahJN8kKTYus94aBcwUq+24t4AGJza4B.Ry+cZ2rnusSZWjHmza53lswMqezdepuZbHcEDumxrMtN9radj1gsxMNOlr92Fadiyldy51mo3F8bWFyRVmo90is09l.t8w0wDdn1a6l08sB11PIZ5VeMyY19lR+5n7vReLm2+oXZm2OWGQ8kH+782rda+35sWeGibixCbIqqq0sqGOFkE9uztE2Xd7ZLbnr1m4tG65VRs2UW38PNNkrOeLNteeTesIiMfgCs+UpzwNW2K9X+ZsiwqKSOGj6K6AWSC...........bQpJbSTw4gRuAe+HFe2tKc8tcG1ViI.HQTeSZNzMZZttq2tbCQtKGyxM1kbyn9XrcWqnOSwM54tLlktNS4qGaK2M.86ibcyE1pw1oIgRrJll4LOVy6eeragMnj48y89w8caLEyeBvofb+9gWW+7MAh5pX6NHWZWdaHMg994X6.a2L9kdsV6yb2iYcy82ZzD1sle9MwmgLuqt58gZbFac21Tebuola+5hlqEnI.949605aerDoia6uj.dI17KQg99BHH8Kskg1NGpkcWW2zikoue7s0O2gLnk............mDpB2X3b935X6aRvtd7TzeGSpsb2vhWG4uIKSe7VTdftFpSSbnB+Wy1ZrGyZdbcxXrZDiw6wmgTI8Fx8X24p1kwbWVmo50ioResxXCvWtPrNlNFHTpwNeYybEk75viw79M0yTNueD0yQVRWFpqeePt8AWiGvkhbgRquqM5pn6uHKFR6vt0kbgGept12wrtoAirueOxpn6tG2gZbhXYdbu4QWgruqtw2PcauwXW9c9c8EIvg5KIfo90koKW6qs60X2ttJ...........fyFUgaLbN+zzkIZeSC1zo.tOJOjU8cCKdWTeiV19l+700O29Djpqht2GxcyOtug7353yNrP6vs755m6oX6NqQp6h5NSQZGT49XyaD1zv+02My4TDdkcYL2m53P+5wTs6FHeDk85t1mqFaGCD1U2F0ykjqStzz8d1UGx2mccz+bTS079M553Ty7wOFa18p5xTL+I.KcoAf54QrNoy6enm2LsllpfaOl0M85F20vpcnFmHVlG2GJ3bQzc2ObeUZv+ZK20XM1sSI0TI1kv+09ZeNDApD...........3jVU3FCGFh.T...vx1pX6qaerg+9wLq6gRZ2Vtu.IN0grJMbX6pC03Dwx739XBMZDa+5lwtd8IsV5K.eotJy520WLAK8v+8dr+eIo............E5ml6B.....3rTZHm98HhuOx082Ov0RaeI4eOmAZJ83wt1o5NTiyTZeNtO1WObLN29aErreO1t1u9.VKGSk79W...........fyZUgNZFLDc9O...V1dJ17Z1uqv0eJul+cs6mcn2F2kY4tOp6Zhk3PMNQlw4PZpOtmqaStu10tWYizyMuLxsSI0TI10yAc0wBA...........t3TEB0DLDg+C..fksWhMul8R63Y6607eSTG.tmWWKumYLm6v+Ew1Gm9XcsdeTVPyNTiykxw8i03ccr84j8c6LGg+aWBRJ...........vYopPnlfgH7e...rrsuWy9tr9qh5fm0WfyVZgPaUDwq8TaOEiK7dGpw4R439wb7FyXrzC+G............qUEtAqfg3FQD..fksic3+tM5N7YuG0cgtlGKwPnceG0dyi6G41ceGmKsi6GiwS3+............NiTEtAqfg3FQD..fksiY3+tKyx+x5me0dL1G6PncUTGNu2xr9eDQ73QXbtDOtO0imv+A...........bFoJbCVACwMhH...KaocCtqJb8G607uJy15tCzXOmgP6tHe38tYhGmK8i6G5w6pj0+kCv1Q3+............lQUgavJXHtQDA..XY6kXyqY+1BV2Uw3ul+6SVt6Gw3uqAfpj.LdH9aVVEQ7Zx377DONKwi6kXoE9uzti39dbO2xNEutzeyM...........PGpB2fU....bZ6wXy+11mJXcuIFe3iRC01pQL965XO1tt20ErMJcrdehGmkvw8kb3+JIDqQT+59wDRxRp6iwqKE9O...........fNTEtAq....3zVZ.9dOFW.whX6.ScHCoTIAf54jk6wQL9QTV8OFGpwZLiyR339RN7ekz4EuJy52UW5qj59X75Rg+C...........nCUgavJ....N88VTdHkxERrRBoTWgqpQZvo5aruOY4FS.Fuqv5eHqRFmWm3wYIbbeIG9uOhw28+dIY85q6WVRceLdcov+A...........zgpvMXE....m9tM1NDQ22yxecTGjoRBozqEL9kF.pbctsWitCZUZnrFZabSOiUWiYt.TdnFmHVFG2W5g+68n9XdWVEa2k8dO5OfjkT2S8qKKsd............tnTEtAq....37PtN91ywlcOsqh5.J0D7uzfk02eabtfk8XrYPqtM1rKrkFvv9jFhqOh5NZ3iqG2aVW6ul4mOz1n4XySqGq1g255N114BP1gZbhLKWWlxi6K0v+8Tr49Pyw6FWE0GWR63ker94Oj08T95xcod............tXTEtAq....37vpHeX955w6Qcf0JI7QkL9OFiO.T6S8m1s0xMticL6K.YGpwowR339RM7e2G0gp6Pd7dWq6o50k6Z8............bwnJbCVA...v4iUw1A+J2iWi5.JEY9YCM9s6vbcE9olPXkF.pt5BdsG+wDzpmiO65dCExpqi7cHttp8ayLFGxwowR339RM7eMG6F6w72h5vBNU08T75x8od............tHTEtAq....37yUQcH.aGXo2h5vIk1czRCE3Xb25w58Vq6KQcfmV0Z4RC.0XCn0cQDO0p9ee83+X7YnEaurs2Fo+7F2tdLSCQWWGW5xgZb1kPecnOtuTB+WZGnLsdSe8PyqUeJFNjko1m5dJdcov+A...........zgpvMXE....WtVEa92E+x7VN............vw2OM2E......IR6vZeaVpB............XFI7e.....KMB+G............vhTUDwGsd.....WJtN17uI984sb............f4gN+G....vT5pX6N4WWtIh3kjm6WOrkC.............6tpPm+C...fyCOF0+ssus9+91nt690X05m6oXy+V3OhsCBH.............yppP3+....37vaw1g5aLOdNpCFH............bQ5ml6B.....3r1uGQ7iBV9uGQ7KQD+KEtd............vYk+vbW.jUUDw+Vq+syS....bp61HhqW+X05+2Hh3aQcH+915G+9rTc.............LBUQDez5A.................bA4ml6B..lMODeFx3uNqUB................aP3+..................VXD9O.................fEledtK....JzeLh3O05e+0YpN..............fIiv+A..bp4OEQ7u05e+GlqBA.fHh5e27eq0+tZlpC...........fyJB+G.....rO9iQD+eN2EA...........v4leZtK...................1jv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vByOO2E........K.+SqeLFecxpB.....Jy+T3yz.....NaI7e.......Dw+ZDw+WibY+C6415i8b8UCGlsuZ3vr8UCKmZ3b30iKgZ3b30BKgZ3b30BKgZ3b30BpgCy1WMbX19pgCy1WMrbpgygWOtDpgygWK7uFGuOSC....fireZtK...................1jv+A.................rvH7e..................KL+7bW........r.8+aDQ0DM1+gIZbKgZnlZX929QnFZnFpM20vbu8iPMzPML+a+HTCMTC0l6ZXt29QnFZnFpM20vbu8iPMzXtqgGV+HUUDw+1wrP.....N7z4+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEledtK........V.96QDes0+9eLOkA.....GD+6QD+Om6h.....X+H7e.......Dw+w5G.....bN3eDa9EcD....vIneZtK...................1jv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rv7yycA.......vBwGI+6+vrTE.....bX3y5.....Nwoy+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e...........bZ39HhORdb2rVQ......LY944t...........nW2FQbUDw2hH9xLWK.yqqx7be+nWE6OyqA.....LBB+G.........vx0yQcHYZ7WiH9sYpV.le4B+2oV34LuF......mzphH9n0C.lBODeNOyWm0JAfxTEtVI.fkjpvuaF37wGg4z..XY41X6qQ48Ysh.laoyI757VNEy7ZvwkOqC....3D2OM2E...........YkqCeAb455LO22N5Uw9w7Z......EP3+..........VlxEpme+nWE.KE4B+22O5Uw9w7Z......EP3+..........Vl9RDwuDQ7i0O900+afKS45ZdmZc9OyqA.....vIupHhOZ8.fovCwmyy70YsR.nLUgqUB.XIoJ76lANe7QXNM...X45kX6+tkUyZEArz4y5.....Nwoy+A..........vx20I+6uG0cOO......NSI7e.....PW9aQD+yGvw6OFQ7+5.Ol...vxwUQD2G0clp2hO6vLuDQ7XrcnU5x8wlcnl2S942EQ7bqswaQDOEQbyNTyqZUyu2ZaVxXl1Qctp0O6l0iyqsF2mG43dWlw99ibMjyp3yyAs6BYuu9e+755brmugKQsmur48ler9+t48Poczuqx7beuvs09L2basm6r8bOMyubWlZMhxlWKxrrlaC.....fEgpXyO7R.lBODeNOyWm0JAfxTEtVI.fik+TDw+Hh3+HpCB3eJyxTE8+6l+iQD+qQD+uC+8G.Keo2Xo..LNWE0AvH82kl6wSQ9.gzV5X8x5m+lXyfqj6wiET22GaF3ucYLuIyxGQ893yCLt8E3kl5KccxEpkorFZqjyysCBztFDG3bzMw1AlK2izPOGQD2lY4568vG54laWGiYty6xrticdsHL2Fbn3y5.....fIPU3CcAX58P747LecVqD.JSU3Zk..Nl9WiM+cu+GQc266eZ8OuJx+6l+miH96Qc3Aaut+wItdAXe3FhC.nb2EiKDHse7ZzeHSRCFySQ9tE0tF5iUwlcZq8YLyEFmRF+9BORt.BcUlkaJqgF4BryXeHfLP86IKIfYOkYLx89va6X6MEyM2LtiYrxEdwHF+7ZQXtM3PI80t.....vAPU3CcAX58P747LecVqD.JSU3Zk..N1Z5ZeoO9ZT2ALZ+b+snNje4V9piZUC...Ss9BAxqQ+c2pWxLdMRCrRZPOde852WW.rqvjzWvQdomw88HenXRCNxKIieSs1UHbdtfiCcEllorFhn+.K8VL74B3R2PAVq48nsmy75LiSttcWt45lp4luJxOORyX1ddlbgWLxr9cMuVDlaC.....fErpvGXHvz6g3y4Y95rVI.Tlpv0JA.br8GiM6fe6xiGN1EM...LotI5NrEsCiRec6p65Xr6KfLocfut5ZSO1wXmK.N2GaGruw1gsxEFmbiaWg+4sNpyUYV1tBkyTUCQz84tmhsCcTtZtuwFtDzWv+dNxGxut5nb4BhVt0cplaN8K.pl4XxUC41uJYdsHL2F......KXUgancfo2Cwmyy70YsR.nLUgqUB.XN7OGkG3ulG+6yP8B...SmUQ9NsTWc5oHxGhibg9nqfq7QjOLIkL14BzWWgbIxrr4B4RWg5I231U23JmbGGJIPiGhZnqksqiY4BHyPcdK3bWoArqKiI3bS4byQjetlRTx7Zcs8L2F......KBUgancfo2Cgv+AbZpJbsR..yk+2wtE9upYnVA..foStPz85.qSWg5KUWgxHWv6Zb6HF6qx7y6KzI4B6QtZH21sqPgj6Xv6crrkDTwonF5JDQ8cdH2X22xCm65ZduRC9WWiU5bXS4byQAKWW12.XatM.....3hzOM2E......bx3+UDw+Ugqy+OguvQ...3bxpHenG9kAVuuzwym1M+tJyx78Hhesmw9GCrsiHe.S5ZLWE46TVeK4eeSGq+PGK5aLaz0wgTSUMbWTebnsuD8edHWmYLWMCWJxMW4uFQ7a6vXk68Wsm6apmaNh7uetjPvM140hvba......+2D9O.....Xr9OhH9aEr7+WQcfAA..fyG2DaGbhuEcGfjgjNV4BYQegxnKoABLM7e+dxxbUTuu8XT2ortMY4+dr89Xtfr7aQ2gBIcesYbyI2wgbGimpZnqPK0mb0RWgaDN2ccjO.a6Rv+hX32eM0yMGQ87lodLFe..G67ZQXtM.....f+aB+G.....Th+VDw+YAK6+XBqE...33KWXVxEHjwJMjd4BGxPi+tDJlaiH9n0i2hHdIpCFRtw6uNxsaeAsojtdU5wgR5Pf6aMbaragHR2wB9TWyUtqumXnfyM0yMGQcH4x87OF0yg1U25qwXmWKBysA.....7eS3+.....fR7OhHdXDK2+YTVWBD...NMrqc.otBER608pX6fY7kHeXSZanfYj6mOV+Hh3eIxGNjRCpXtkO2wtRBZxTTCkzct5a810NNFbNH2bd6S2hanfyMkyM23GQD+kH+7QWE0AnNsKq1nz.zYtM.....f0D9O.....nT+8X3t+2Cgt9G...mixETjcI7DQb3BlwPgrIWnXFx2hH9kHh+GQ2ANojtXUW0wXC+WWi8TTCkr8aj6bfNiEWx10v3kyXd+0TN2b5O6OG0cAvbdJp6vd661wba......q8yycA......mjdHh3+6N9Y+mQc.AA...ZjKLHoASIW3MFJjE21w50Nvd494s21+H9L.Hea8ig51f45RgCEhjzfm78N1NiMzPSUMjKfLCc7P.YfMsKgNtjwZe5hfsMl4lS8inNbz+dT2s+RmG5wX6PSWx9f41......ZQ3+.....fcweOpC.3+GY9YObLKD...X1sJ5O.E2D4CcQZ3PxsLCExh6y7b+1.0SDQ7WF3mOjRCpXI6ais6TMU0PZnaFxpHh6x77GpvIAmKJ88VM10v+cnlatKeKh3uFQ7bxye05wscMVRW2yba......s7SycA......mp3HtEC..f.PRDEDUrdHyy8eE55e...bNKWGgJWmQpsG6XbRCPQIgCIh5f+kac90j+ctPfja8JQo05Pcev9F6eD4CvyTUC41V8EZl663mKfLbIK26s104cFy60mx4l6SWAELcNgwNuVtkMFnlL2F.....bVS3+.....fc0eOh3+L449ayPc....GO4B8PtNiTimh7A43ul44RCvQeAr3tHevU9kX6v9kabx0w.KQocovw1IqtJ1NrIccbXppgbautBQzcQ9ikeOFt6KBmyx8dq6h7uObHou+KWv4lx4l2EsqmRlWKBysA.....vIfpHhOZ8.fovCwmyy70YsR.nLUgqUB.XI4gXye27ebVqF...XpcUr4eCPyimhMC2wUQDO2wxlKPJ2jY4dO1NXFqh5P+kabesvZ9kn6Nw0Mq2N4BXXrdakVq84kLa+bAVI2wgtBp3TUC2mY4xUGcsbMGagKY4du7GQDuE4Cb10Q94axM+Ut2eMUyMGQ860uOF+7EoyEWx7ZQXtM......NATEtg1AldODB+Gvoopv0JA.rj7GiO+8x+84sT...fijtBeWSvHRCtQZPTxouvV79HF2Wis6rTislaF+Wh5f4LlfdTZfPRG2tByRtiCcEHmopF5JDQMAWJ83T53NTvdfKE4BkVt4c56+OOtMy5106ulh4lij0600K68Q2gHLMbikLuVzQs2GysA.....vQWU3FZGX58PH7e.mlpBWqD.vRyeOp+8x+oYtN...fiiUQ+gHoqG8EZhm1gwqcvP5K3eM1kZ9sLiSttXUWcHvFiMLK4BSSttS3TVCQzeXLSCYycYd9aGnVfKAqh7AHquGox8dwtd+0TL2beAlari0XmWKBysA.....rkeZtK......3j2eOh3+uHh+8YtN.XeMzMdKbJ4tn9Fst4FNuo6xzWWVAlKi8F1mkieDQ7WhH90Qt7eIh3OOvxe0NVG+x5Z4GiX4KolaF+uj44yUq8s8S6BVQGiaWi82Nx0PD0Gm9sd94Mq++iNpkb0Lbo4GQ8be88dsTouWM26c+dOauC8by419css+W5XrJYNBysAGd9rN.....XBTE9PW.ldODeNOyWm0JAfxTEtVI.fknp4t..3.vMDGmCtN5uiuzWmcAlKB+2osqh54VdIpCZ7GQcvieY8yO1P8kNe0qQcfkeJ1bdsWW+b6SXlaWys6JWuzptuM5taB9Xl5su.xjq6Q0U8m63vwtFZ6ln93cy412i5vk2dcS+8N45Vhvktah5221ddmlubFdN5d9xbcNvw3PM2b6w540qe64LalOnutu5XmWKBysASAeVG.....LApBenK.SuGBg+C3zTU3Zk...fogaHNN0cU74Mvbyilap7la76amspC5lv+w0w1+d3mm0Jhw5pX6ycONqUD.6Oysw4DeVG....vItedtK........3hy0wmcviecNKjyLOEa10U9kX6iu80UV.XtjqCT8sidUvtHWXX98idU.vgk41......nWUguwk.ldOD57e.mlpBWqD...LM7sg+wQ6NSmN70gSZ2IQGyhSI57eber8uG9ldWCVBxcdy6gAN0YtMN23y5.....Nwoy+A.......otMp6NeWG0gJqoiL880O9x5G6RWYRmmaZbax+VmIA3TRtf988idUPi6iH9QT+65ycd350KS5u6Ih5tNK.KQlaC.....fClpv23R.SuGBc9OfSSUgqUB...lFW5ea3uJpuYWa2Y9F5wKQ4clIcPioQZGJANkXdAR+cOuOukyEsUw1+99Wi52a9Rz+0Ib+LTu.LFlaiKYW5eVG.....LIpBenK.SuGBg+C3zTU3Zk...fowk7MDWZn+dNh3tnt6Wz1pnNreOlr7OVv1RHelFuDWtu9kSelW3xVt.Y30Aym6hw+k.fvw.bpvbabI6R9y5.....fISU3CcAX58PH7e.mlpBWqD...LMtDug3VE0A8qYe9oHhqJXceLYcGCg6XZH7ebJy7BW1tI192AWRnx4vp8uaeLO1kt.L.GalaiKYWheVG.....L4pBenK.SuGBg+C3zTU3Zk...fowk1MD2pHhWi5802ic+lascWznqNiQocXiz5r8Oqc2H7tXyPukZ05k4o0KWS2J780+66WuLCIsFZer5p0i+qs94kL1oZ5rhs2udq0X1Nbl2Gi+X5PAp513yiSMqS6iSkDJzROe02w2ai5.p1bt6sn+Ppl67wqwte93PXou+cnN2mZ050u868Zds3iIi6tD9u6h5icukT2MctTNcjatLmCmWWG0mWdNx+d3mW+yS6Pv.rjYtMtTco8Yc.....vQQU3CcAX58PH7e.mlpBWqD...LMtztg3Z53euG6+M3Z6fajKDg6S3+RW+lw+odVuztRXeOdOFWHSxUCCsMJ4XaZWXruGMgl5PD9uahMCOUeOdLFW.yJ87Ut0YLGOROuMlyG2Nh5eJrD2+lhy8MtO17FpuuwMRdtgB+20wlgerqGuFt48A..Xn+da.....XGTE9PW.ldODeNOyWm0JAfxTEtVI...XZbIcCw0DZrCQv+ZzDhnbA24kVORCqzKYdjJM3TcEBpFocZslf.0L94BkzPglJsFxElstBj0XNFmKLSM0a6.Z8Vq04tn68ozioOFa6tHeM22woWigCAVomuxsNouVoqG8EtvtdLGABaos+MUm66qVy854Oxr78E9uqyTa88d62icuyEB..v4f996v.....fcTU3CcAX58P747LecVqD.JSU3Zk...fowkxMD2Uwm6i2OvxdWTGLm1ASqIvd2GaFpl1gIpuv1L1P9z05j1s6dZ8yktu775w+tHefkR6LYu0wxkqFZ2w1dJ9LrUqVu8RC2zqCr+kFDq6yTKWE42OajFlrgjtMeuiw9lX6fINz4sc47UWGeaer35L6mukrMdN1L7a2Fae9nc.JOVVR6eS449zfd1L14d8bWAfrqswUwlum80HemFM881icdF...NGco7Yc.....vQUU3CcAX58PH7e.mlpBWqD...LMtTtg3Z5xV8EHlbAJJ2i1AFZUGOep8M7eM00qQ+gLbLc6qzfoc2HqggV9Uw1G+5qyB1NfU6ZPkJI7eognZntS3pX6PfM1ywi87UtiucUS45RhGxyGSgkx92Tdt+ljkaLc8xbcIvtdOP6WiOTWH71XbG6...3b2kxm0A.....GUUgOzEfo2Cgv+AbZpJbsR...vz3R3FhqcW+qqvA0NLNuu9eeaTGrmaR94occqlv47bO0v9F9ul5puf+Th1glZr08PgeKhs6tZONxwdnwsKkD9uz.WMlfvsJ1NzXccNXWNeUxw2zfcMz4tHJ67wTXor+Mkm6a2QCKIfkou1M27BoAKbnPElNtCc7C..fyUWBeVG.....bzUE9PW.ldODB+Gvoopv0JA...SiKgaHtGi58s253m2NXPc0o1Z2s75Z7esmZ3PD9ucMfb4zNvRist+HFtyB1tSHNz95tbLI0XC+WZc029bpw1oD2kyWoqSogEbnflUx4iovRX+aJO2uOicZXGyU6see5XCxW53dnBLL...mRtD9rN.....3nqJ7gt.L8dHD9OfSSUgqUB...XW8ZzcWAqcPYdI5NnLMgvIW.B6KXfMNDg+6PFhmzPMMlZXrAap438GQc2RqKocLsmhx2GGa3+R6PbcEfubZ24Hapyb1kyWkd7sjNcXiwd9XJrD1+lxy8oicIAzcLAWbWp6zZNsSkB........Kd+zbW........vQwpHhqW+e+sL+rlv77iHh+k0+u4zzw699As5FuuEcWacYUTGtwGi5fE0NjT4BB4PF61u8x0W.390j+8cQc3JeLFtCCVpz5H80B846wl6Sio11kyWkt76x3NmcAt4Z+aJO2mN1eofwdniGog1aric5bTWmco........fELg+C......fKCsC9RZnXtM9L7N+ZzeXbZFm9BfyTEtoRG6qh5PM9dT2c8tOpCRzRKDPeKh3ul7bqh558snNvhGptVV53TR.vRW9wTSS4qEnLS4498cr6SZPCeK1t6R10C........3j1OO2E......rXkdCS+GlkpX+ctre.v9pc.ZRClS6f6768LFsWtbc9ulswgL3O6p6hO6lgs8kXytQ2MwgKXc6ieKpqqGi7Aq5ln9byeMDnNtrLmcoQ........XVI7e.......bYnu.zzzI79VjOTeMFJ7esGm4TZv+9dT2QC+sNV9kP3+hn931eIpONdWrYGYLV+uuJh3Oe7KsrDBwKWy449955n8ou41........fEIg+C.......Z5Xe8EnmUQcfzZjFvuqhkQ3+VE0cOuFMAp6TJnZeKp6ve+RTeL+93yP.d85+8utGic6vNdcT14qqa8eO2g7jxLkm6SCV2UYdtCk+xDMt........vhyOM2E........bRnc.zx410+ueOh32m9xoS2EaVm+RbZE7u19QTGxuzvKda9EeziYakz0CuN17Xqv+cZYJO2mFzuRF69lWI21ZozoNA.......fImv+A......vkg1AnIM7Leq0yeUrsltOWWcxqltQWD0gsaNkV+eYfkenfGsD7sHheq0+95tVvQHMXlkDjvzkU3+NsLkm6SeeVIAzan5P3+........3hkv+A......vkg1AnIM7XsCEzys94WEQ7z5G+Hh3u1Z4ZB62MQDuD0gn62hx55eSQv6xEdw9196SWz6X5P08B+drYPstNF2wfqh5Pf1dblyN7HkaJO2+sXyvAeaL9P5c2.+7ejr8tKJ684.........bPUEQ7QqG.LEdH9bdluNqUB.koJbsR..GKeDmG+d2yk8C.NDdMpmK7kjmeUqeVtGuGeFHvtVtmhwEluWRVuwDhm1KeZsm5ojkuufEktr886IJoFZjtu1kwbbq8w8ba+wtshnNTVcc9sq5K87deGW2kiUktNkr+tOqygxRY+aJO2eWlwdnWam68f4N9jV2uFB.H........vLoJbCoAL8dHD9OfSSUgqUB.3X4bIzbmK6G.bHzNbNoAmYUrc3gdO1NTeqh5tCXyx7bTV2y6wn+P7jKPOkDbpbgaJsCjcUx9vbG9u2h5iy4BgUtZMW3qJMrX2Gaeb59X6vZc655KMnm8Q3+11RZ+aJO2maNj6xL12jrrseMdWGeRm6not6JDfMc1y663mC........vNoJbCoAL8dHD9OfSSUgqUB.3X4bIzbmK6G.bnzDlmtBXyUQcvb5qafsOtJxG5t9BWz9FbpOh586WhMCyTS3glyv+ccxx7950KsVGZauKgEKWWWqYa7x5ZYLmeRI7eaaos+MUm66qKh10XeWr46C663SW0cy6u6Za.........vASU3+CIAldODB+Gvoopv0JA.brbtDZtyk8C.NTtM9bNw4piX0tCDNlvsUZvox0ECyEVnqWurse9t5hXSU3+56XQ5iGis6fZkrsx41HePuRezDTxwP3+11Rb+aJN2Gw1cGz9F2ltF5XC+WScmKXr88XpByL........vEnpvMjFvz6gP3+.NMUEtVI.NGj1weRuYhuKpuggatoda5.N20yXtZ8O+kj064AVuwVu2mL1M2XxOFedSKOFoc2maZ8yVsd6ztaoj5ln+icsq0lal6lie2GcGngb5KzbM0Z6sSywiah8yg73cD8ueLG0SN2E0cxlzWymdNKMfHo2H6Ol7yecGpi8Y8ANczd9hGmoZ3ln92S2N7QuF4CYztDlrH19ZJdKxesAc86l22ZXrgwp4207br40AzzMyFyuCeeB1Vy0Qkt8eM973UWgNLGg+aaK08uC8491tNpmeocc006AaG9uwd8G2F0W+T59cy6adZ81ojq+E.XpsueFEGqwD......nGUgOXVfo2Cgv+AbZpJbsR.btHW.1tN17lNN2iWisuAdGSWK4kn7ab4qh5aZ39F212jwiMzacsumqClL10eUA05tz0dZWK2m4mk934XYd7tjqeXppm1tIFWmqo4bV5w9b0b55VRmtIsK8ruAmEXYq8bbuDkMewpPfZ...nTB+G......bFnJ7AyBL8dHD9OfSSUgqUBfyEoAa55X3.70NnUMAKKsSkMTvAGafztof5ozvRktueUOaqwr9qhgCMY5iwDFxz0ozsSIcMti0w6wd8CSY8znjW69QT24bFJ7eQrc2uYrczqbAGbW6zO.mNtO1b9tltLWt.MeS7YmJ880+u..retN97Z3KML9.mdJ4ynXryOrKetGKIlGD.....fSNUwo8GLKvogGhOmm4qyZk.PYpBWqD.mKRCmT6te1SQc27qIjA45LZOs9m27uee83zrd22w5MlfPccl06s00RSWNZ05+ctvvMT.vRCuWZXsda8y0U34RW+10vKq29Mg15pn6igOWPc1bLOW3PtMpOtlKrbioKCdLOdOlqeXpqmHxG7uWisO2kKTNCsujN1uMh5IhsCVnP8vknS8aZ1cUIc5zzeuK..6mzqw+k4sb.lXk72bL14GVh+cLkDfOyCBSqk3bD.....bxqJ7gt.L8dHD9OfSSUgqUBfyEcEjfbcZnHxGJgl.s8Z7YnrZaUTGvsz0qutY1pX6Pr8z.qStZquaxozano1g+pq8+tV+10ZeAsaUG04sib6Llvs0UmAbIc7dnqe3XTOcsM5xUQ2cbwtjN98cdtQ51XLqCbt4R+FhqIzwOGaOmv6Q8uypIn85LnbtojvuNlGto0AFqRtNefSek798wN+vRYNj6h5+VhlOShwx7fvzx6u.....XBTE9PW.ldODeNOyWm0JAfxTEtVI.NWj6F6Ynfukq608djO3eMxEzp9BI2iIK6XuwsK4ao7b66uFiOHE4V+wzg8hX6vP1WWgK21Yn.gcJb7tOGi5IMrfC0AFiHe2Hru8kz8ig5heWkr7isaABmabCwAWtNjA+qjqg.fz+Vht5.7.mGJ4u4XryOrT96X105v7fvzZoLGA.....mUpBenK.SuGBg+C3zTU3Zk.3bQ5McvPgSJh5PjsKgdKMHTcE1pUYF+9BVXaogmpu0Mc4FJ.iCs9kDTqb0YWcotc4bTDK+i2c4XTO6y1H83Ze6K4pm9BWZ56sdbj0DbtwMDG..GaWGeF7kWh96h3.m9J4u4XryOrT96X105v7fvzZoLGA.....mUpBenK.SuGBg+C3zTU3Zk.3bQ5McvPcTtHx28yFyMDzMIqSWchk6RVtwzQ1ZKsq50UvD20P0005eWgqeZmmqqfdsKmihX6i2c8M19bc7tKGi5Ye1F4d8eeR+lyuuWm7ZxxVRXTgyItg3...fozT72brT96XVJ0Avl7dS....3D2OM2E......q86iXY91HetgVla5X4RCR3WFwX22x201Yn0qT6acN1uQ0Gy4nH193cWi+bc7tKGi5Ye1Fi405skd9pqvadUrYc8kHhuW31B...........NvD9O....fKA+XjKWZ2NqzvVkt7is6osug+qzfZM1v4sqV5Gu6xwnd12sQI9sXyyE2jY6Gw1gBbrg7D...........3hSUDwGsd.vT3g3y4Y95rVI.Tlpv0JAv4hOhcaN8ob810w9XucNEpySwi2Gi54Xet+wjk+9LKyqs94uGQrZGpK3bwgXd..fKc2EQ7bDwawm+N02V+b2Mxw35Xyemb6tp8pn95ZaecrC4p0qyKI00KQ80L2UWxdLZ1eapm2WOtOMxwcet9iC490MI0Q54pqWOluD06is2NG5uPYfSMqhsm6qYtf6iM+6rK487S8mmwcQ8bUujr9ut94uo6UMhndeKcaOziWNf0eCyEB8ym0A.....SfpvG5Bvz6g3y4Y95rVI.Tlpv0JAv4hc8lNXJWukVXz1mswgXL1msyo3w6iQ8brO2eUxx+1.+7m1gZBNm3FhC.X2ccrYnK55wqw35Z2sWmluDK5Zazkqh5qwcLAR4sX3ftz1MwmA+XnwsuufM1kq+Xp1uxcL+pX6fAk6wyguHQ3xzswvyE7d7YHxJ487SwmmQS.pGy7WeD0u+uq2aO2g+ybgv33y5.....fIPU3CcAX58P747LecVqD.JSU3Zk.3bwtdSGLkq2g3Fg3XrcNEpySwi2Gi5YNN2mdyo09ah9zaTuRtYmgyQtg3..1M2EkE9i2ig6PRogu3pn6vpjyXCmW5iwzcBS6LT8830B1OGy0eLk6WoGyutvs0P6qv4lGixeeXIumeJ97LJY9q1u2NWf1lyv+YtPX71k2iA.....CnJ7gt.L8dH9bdluNqUB.koJbsR.btXWuoClx0KsCRLzMiZpqiwcy9ru2vE665mVm4twq12syo3w6iQ8jdyhMlNdRa6x4jzatv1c2uWa87ocEP3RjaHN.fxkdcvMc3pUIKS5WJEkDJt6yr9us94xMNo0TyxeW740fuZ8+90LKaegCYUr8002DNjle9MQcnfdK9rqQMl8ygt9iob+JsVZp+1+ci2ude610+7bggYn8W3bQtfu8RT+9il4+tN1rK6k68L8YrKao+cLMu294Xy4Oh0+2412dJF1t92SU55YtPnL9rN.....XBTE9PW.ldODeNOyWm0JAfxTEtVI.NWbrtgfJY8dNYYFy2F3skFxpm2iZoO665eLpySwi2Gi5I8FV91BF+UwteNo8MhVSH+RGO2XZfaHN.fcQ6PQLTG8K8Zt66ZPaubsuN5Wi96X04Bm2SQ9tVUimhsuNft1ORut+91GVMv1Mxrc6arlx8qb0xP+sQqh7AqYn8Y3T2Uw1utuuvwcUj+8JC82bL1ksz+Nl1AVtK45PfC8EXzT9Y10vbgP47Yc.....vDnJ7gt.L8dH9bdluNqUB.koJbsR.bt3XbCAU55k9MadWgIqKoA6pqaJn88FtHc8KI.YQL9a318oNOEOdeLpmGSVlw7Mmeib23ciU5185X6aZ4R6Bgv4H2Pb..kI8Zn6KTdQrcnM5q6SmK3EuFCGlhzq8sqNcdpzqmuq0K8umZeC2wXu9iod+JWsz2emUit5Dhv4rzvjMlO+fqikSm+arR2OOjcxzcc8LWHTNeVG.....LApBenK.SuGhOmm4qyZk.PYpBWqD.mKNF2PPktd49laenuIzabcl0sqaBz88FtHc8KI.Y41G6JzW6ScdJd79XTOoA368dp6T49lperR22dL17lVtzfNBmqbCwA.Tl1c8uwF.izfazUfAS+8xuGC+EVQttk8X+RtXr+sRoAHYeMlq+3XrekqVF6emP54T+8EbNqj2SkJ88JCMGxXW1o5ui41nr2auq0wXWOyEB6FeVG.....LApBenK.SuGhOmm4qyZk.PYpBWqD.mKl5aHncc8R6hCi4FXcUT2AJZud8EHu88FtHc8+HFe2+K8FUcppyS0i2Gi54sjk8wQrMxEtvROmz9b+qwleizOz2f8vkB2Pb..iW50nN1qoL8KDiw1IxGyW5Ioc25RCdwX5R5k1IrFxXt9iiw9UtZYr+clomSesv5CNkj1wSK4Kjoz2qLzeywXW1o5uiIMrcC8d6o9yrybgvtwm0A.....SfpvG5Bvz6g3y4Y95rVI.Tlpv0JAv4ho9FBZWWuqhMCEUyMxUWcmsUw127mC0M212a3hbg.68n6NlQW04GQ+eCouO04o5w6iQ8j9Mm+P2vvWmol1kyIo2jbsqWfZtg3..Fuz.vL1NZcjrdc8EtwtD9hzqMuzujKRul4b0Vtqq99nr8+1Fy0ebL1uFasjSttwEbtJM.YiMXXMJ48JicYmx2+ME06ttdlKD1MdcI.....SfpvG5Bvz6g3y4Y95rVI.Tlpv0JAv4ho9FBZeVub2Lmus94aBK2Uq+2ocwsOh9Cg29rOz052NXXOEadim0WcNzMI09TmmxGum55IhsuYA+X8ykdt693yyuocWvc40N4BQ3X57f...jpcmk9sBW2zq0dnk4iXbgqKsSmecg0UZ2LrqZKc6z72kcez+WvJ4Llqw+Xsecr9a.gSYo+s4k99wRduxXW1888e2D0ye8bTOeSWeADcnp2cc8LWH......KFUgOLPfo2Cwmyy70YsR.nLUgqUBfyES8MDz9tdc0kz56wPceu8cenq0OWmjanGi4aG8i4M6zR638TVOQTeiKmKLe8M1o2jZ6xqcdLyXT5MmL...QT10yNzib1kq8ceud4wNFCc87OEi+5rmpiEG6sygnFgSA66q0KY8G6xtK0zpXyuvg1m4q2m5nj0ybg......rXTE9v.AldODeNOyWm0JAfxTEtVI.NWL02PPGh065HeGc3XbycV55ecjuKzk93sX7AT6XeyNszNdOU0SiUQ9v3k9303yuM622W6jFTzm2gw...fHJKrHC8XLi+tTS6hRFi6yr7seb+AZ6cr1uN1+Mfvono3yzYeW1RqoaitC826Q8mERyiond200ybg......rXTE9v.AldODeNOyWm0JAfxTEtVI.NWL02PPGp0Kh5vx8Xr4M8zaq+22GkG5qo7FE6tnNHZs6BEut94t8HVmmSGuOz0SpqVO9sOm8VTGLuzNzX68iW2gs0SIiwXCBJ..a6wn9Fj+s3yf5CWRxEZjc4waib72kZZWT5XbUT+2Ez0WFKOd.1dB7BrbLkelN65xVxXdWlk+k0O+piT8tqqm4BA.....XwnJ7gABL8dH9bdluNqUB.koJbsR..tQhtLsJ19lyqDWsmqO.mxtI1Nb7uD0AxXeCwMWlRuw46J7Rv4ro9ZK2k+tmz.3UZvbuNY8K8Kbi6xTCeD8+ktwX1OOV6WB7BLrz2ONkeAEcnCE2pX6N9W5W5PGi5cWWOyEB.....Wj9o4t.......XTRugg+Vgq+SI+6ecOpE.NUbUTGHkltYR6aP3ahO6TSC0UlfTocFGgHkKQsudzkR2uL8Zj2kfgz12Kb8+sHh+bl5Xnv0Lj4d+B3Sou+YoL+2Xj1c+9knddqSElKD.....tHY5QTiW...H.jDQAQE7e......mF1mv+8Xx5+k0O.3b10Qc27n87e+Hpm+KcNz6isCIMzmeOpe8TCgpmKQsmKcUrLBAa57680w8x41j+8tbMy+Hh3utm0Qpkv9EPsz2+Tx6G224B1WoyEbJE7uHLWH......KHUQDez5A.SgGhOmm4qyZk.PYpBWqD.++yd2+71H2q6I3+ZCmOluBtFZdArdgN4mZ.zIaA1ShVrYiijCGmImc4MSNZ7DJmL8Iscv3b0.WcxUC3a1Frpm9BLwp84UPuAE4ph+TQxpHYwhj5yGfBtoX8mmpHq+P55KefOGmO70lyyhul+TOl1qaYZODtwrAXHMI0czulG+65hw4rTGNvUMNvpbVpeOy11QufiUWkEOF5ttKptIetmyZY55Zmgp7Zt+bdYW9rO5Z82kwaesdsMeVSeNUdsnsOedW+L12l9suxt73H8Y7lqsierKp2Mc5brP......NXTEeYf.CuoQ3+.NNUEWqD.fajniemkt+KT+Eo9lIrugSYRZ+FKTvV.dM3lr3w9VV3rljWF.PAjFftYRd40o10PXzEa5m64sES2ccXZZ67AaSGgcRw75gULtcc8berdIvKP2T9iLwa6vzbQd49Iic3+V208Vdbm0UukaW554D5yxvwBA.....3fPU7kABL7lFg+C33TUbsR..tQhN9MOTJON6eeYV7lhaxr+Vag2ac2XaSRc.+JuQr21afY.NVT1QPV2Mic4MhsiUBP20VWl9xcz7dS+bOmkWdsv2lk2gmZ6GMimVw3ewJdt4J2trpthXWWOG50q9TK65oEN1bYZ+yaur8utLOu+a49wqxtN7e8oqWW1cW6R8dWd41jtnOKCGKD.....fCBUwWFHvvaZD9OfiSUw0JA.3FI53W4uF9cc3sY82nwK6FzSXV.dsnLvEcoiiz7Fg9ogqz.3jTacFp6R80kV1UotH0gf4lTeMwqpqSsMetm1tl3GKpoyl831t17U0ktmu9d6r0klWe94o8e.O1UqmC45Ueqkc4zBGiZae8GS80hdwrgqxhAh6g7xqUcU10g+qsigbSV7XTWVTy8IrhkqayOVYysGsc7v9d7CGKD.....fQWU7kABL7lFg+C33TUbsR..tQhN9cSZuy7srg42.gcwjVl9tNs.bJn4M36CcbZJuQkW2MD7wl4cS1xaj66R859pBkRSkmi4hhm65Yyylc1l2l5a75MwUyl9lul1m44pp2yR81jlA+b91i0Ez94ZNuWVm4cnqgxkUWdMnraWtIKKno15pRccXU6Kusetmk8ihwpFdJq9b.scs1ay5XZY7Gi0qMsV1USKbLZRdYmzac6GddF2v+kdVy2Lanqy6IY8eWGs88SrIG+vwBA.....XTUEeYf.Cuo44iyb+nVI.zOUw0JA.3FI5zw7tdxcYwa.uGl82tY13zWyC2wso6A5.fSAmkWdCK2Ekgg5TIzzWjt2sYuIcKDXMml427zWm0eid+X5VWXLyFutbio+PGlmsUuk2D6K6lyecZNMKK7eCcMLWWdMX91qx2uC6JWk98Cbw5Nd6t3y8bdVL3yqZnKW674o6GW8ozsqkeSVO20qWaSsrKlV3X15Nm97qSX99gic3+lj0e7imxyAWtrd6xwIW04B1Ug+a9xxwBA.....XTTEeYf.Cuo44iyb+nVI.zOUw0JA..qyYQW7gwy2l5qaGFCWlE+Li8I.0Mmt2t6Ks8tk0MTtKK1Y3ZN7PV+4OZN9WjW1sulGf8kENl00sUZ6FFe97rs59or5aj60Uuq5lduOAKrOg+aWVCYEyu4ayJmmk6m.6Zs0sQatu7Mo9XT843Ma66UuHO+itw742io+c.04V153io+c7zsY8bWudIvKvl4rTuuXye7BdL0Gmn7ZeJCS2pNWeW2uZS1+adGVt40V0VGHdS5P1y2dz1wlZa521ie3Xg......r2UEeYf.Cuo44iyb+nVI.zOUw0JA..vgt+HI+vXWD7pzlbyIOW4M97wrxf+8TZuKqbQdYG1acq6MG2lgN6s4k2X0s0MVdJKOvOmkEec3gz9qgkc4ttF7t2VT6yuY6mj5sYkAV7gULeKm2iUMT9d9lcpmxwa91rxkA.........zCUw+SWAFdSiv+AbbpJtVI...Nz8lTe85+VR95wsT3UlxfP0GkcJj93hYK6c8vlnL.cqq6wMIuL.fqZYW1MSV23m7xNS2sKY7Z9Zv55Bgkcutk0ksZqdW13NIuLXbqp6QtIg+aWVCmULdq605yWRs..........8PU7+zUfg2zH7e.GmphqUB..fCcead9Z1+ij7WG2xoyDHliekcYt80zVF5vc0vlnLncqJ7ZyMIuLvfKK3ck0XW5Rhky+OmW1k.un34WUH1lq4qYusi065BpXYWS7lULtaZ3+1U0P4q0coSW116UA..fSWt9e.....F.UwW5BvvaZD9OfiSUw0JA..vwfOlEu18igt.naHtieu1C+2jho+gsXcnqcRutDRu1l+kAf6sMdtkEjuRkc+u1BrXY8VF5vRkaC6Zn95S3+1E0PepyUMcNVG...m1b8+....vQtubrK.......fSRuo3w+el5.A9C68JAFd+TR9hAXnuJ6xe+ROl1es3wcITeeHIuuiy+xZob92r1eWGmmkK60UyuO007p7oh4aWC2XWsqpgxt7W4qeqZd20su.........iLg+C......XH7lV9a+GRx+0TGBv+59rXfWIJ67ccMXdI0AR6SMd755Ncymlt5SEiey4eYP15Z3zJW9qKndeZMOeaiWacSvswtpFJe8oOuVC........bjP3+.......FBeLI+aK449mRx+ijbeRp1OkCuRrq5nYGqcFsxPz02.g0b7KmW6BMCqWyf5UFjsGSxm63vqUkAcT3+........fSPB+G......vP4Mq44+yI4eM0g.Tm.jgv55DbMMDgcitYW2c8dMv1L........3UfuZrK.......fSVuII+W6v38mmM7umjoY8gFDVlOT73MMfT5hZIeZDm+aZmWr70e.........NpI7e......LltO0g9ZY96IoZKl+edKl1uXjVti4xdaVt2mU+ZYW7Okj+6I4mSc..+4j7wsbdxqKkg167zsfjU10+5aHxtH8qKC1U+TOG+2mEWWNO8KHiMWGFh.P104+eY.V1mZJeO5Ys72.........NxI7e.......GZ9Ojj+KyF9aI46F0pgiIeX1vYyd7koaAnqL3d8syycdRtomSSWz2v+U1M8tHcODemmE6Th65v+cVw7uYP0JWVWjMu6+8ZQYP+Nuk+1xrocDS........f8rubrK........ZweKI+mhf+Q+0LzXmmmCB3pbUi+87.DdL5WKd7k8XZKG2tD9uKR2CR1pl+sE9OVsxvQ10WqOKCSWpD........fWMpRxmaL.vPXZd93L2OpUB.8SUbsR..GytHI2ljGxymO+gY+M2H5uN8so9Z7V1v2NB0Dal1ds7+ir30uutg+H0emEeydqpWTY8vwoyyhuNd6ZF+KJF+qGzpa3cWVb8oKgB6rj7Tio4wULtk6mzksWSJl+OkWFZv2V77cIzlcQyZ8tNNMkaC2148PUCOVLNc4ZotNu70P...3zkq+G....fAPU7kt.L7lFg+C33TUbsR..GiljEuo9aaPW9AN87coag96iyF2udDpwlbCwc5nL3TK6bLSxhAnpsPocroLLiOkUGJrIYwP4+4rXmPrTa6CupwOoN.lqKvfk08CY2D.vS4v+cUd41rU892xswNVG...m9b8+.....L.phuzEfg2zH7e.GmphqUB.3XSagJnsgi8vV.7R+V5Vn+NT3Fh6zQYmr6o7x.pcQd44m5RWx6XPY2c6oY+sxy0dYdY2iaccJwks+bay+yyKCw1CqXdeyRp6kEBvIyVGVU2G7TN7esMdOlW993IYw2S7T517F...N9465.....fAPU7kt.L7lFg+C33TUbsR.v1YUc9FFFk2H+yCVvEyFtb13.bZ4axxCIzej5uahCMtg3NsbYd4qoOk5vRUF3sOmSuyEU1s8ZF9r6xKC.VWB9WZYdUFfxGxx2FutNS2pp6GaT6sU+csd6hiov+srejEZt8p703tNuA..fie9tN.....X.TEeoK.CuoQ3+.NNUEWqD.zeWkj2lmuIwY+4r7xavDAvDdc3GR6A34mSxWOh00p3Fh6zyEo8PnUFHvxtB3ohKS6g7qssAqp640TYP1lj5qyZcKi2lt2keaqiDttgkc8Em5g+Kod6Z4321v7.tJ7e...75guqC.....F.UwW5BvvaZD9OfiSUw0JA.8mavgwy04kcaFfWG98r39+2mjucLKnNv4KNMMI0mOpY2hadG.75z8.ocrZRd9GBglcHtGl82tJ8aavxBx1Eo977OT772jMO3+Wl16Tcy6pc2Nq9OaCp2U4XK7eyM+0flAm7gT+ZPysQ2U77...voKeWG.....L.phuzEfg2zH7e.GmphqUB.5O2fCimxab8KF2xAXO4ayy62+GotK.dLv4Kf0aSBxFGVJCnI...b5x20A....bj6qF6B......NoU1Idd+nTE.6ae2r+6+VR9qI4iiVkzOewXW..LvljE6DiuarJD...Xuv20A....bj6KG6B......NoUF9uOMJUAv91eMI+2RcG.7iiao..MbUwiE9OX23mSx8yF9twrP.XDbeigucLKD.....fSQ57e.......6ReaRllj2LtkA.uJLIc+GWgKRxMMd76htxLrq7sI4OO6ee+HVG.LF9yM92e8nUE......mnz4+.....NEccR9bigRetkg6JFmyKd9KZ7bSlsLdXEKiltJI2NaYzbd9vr+9EKeRWvEESeYma47TeCceWRdpw50MydtMwUI4s4400mlMOuMIWtjooua6W25+Yod68cI4wr3qY2rh5nMa6qqmUL8WW77y2dMuNmu8p70pllL64uqX5d6ZlN3P0uGA+Cf8kKR80ObcV906cVd9ZDa5GGv5B........fSVUY02jb.rKLMOebl6G0JAf9oJtVI.X8JC+WWFJuYnSZOjWmmECf1xNmz7fj8TKi6xV9S5v5Va0zY4kAKrsg21wkQR8MRdWp8GaYd12s8KK7emk5PF1k4wiqX9TZadccUS+CY003CyVmZ5xr9syc88F..6Cq65mX+psqU5tFCsccFOk98im.v5cedderoiZk.v9WyqynZbKE.....fSO57e.....zcyCYWY.tZy7tvWeBa2lDxq4gNqKAe6xzsaR+9TKeZ1vt1Eod8pqc9t4u1rIcJu975ZaNe1zuttq37wa9104cIv0scdSeuA..uNcQigxqe3cI4OkjeceWT.vR0ra22Lz12M6u2mOqZa+X1T1k6uc6KY.......dcqJ5lM.CuoQm+C33TUbsR.P+0kt415lt42Hdkcat6R8MPWal2I4dapC5UyaXu42bek015tI7ZNt2jE6Vcyuw.uH0A86lzd2d45WLWe1jVllqyyAaaxr4+7k8plWk0aW21edKS2iYwsgSl83151dqK.fa6qqq50faS819KlUGs0MAuc1y2r66bSio65kLc2rl0K.f8Ac9uCOmk5q6317xqq4grYgGAnetO57ezeSR8myaUcB94elwt7CcSyOK8cM9aket40843g9Rm+C.....fWcphancfg2zH7e.GmphqUB.5ucQ3+ZdiT20NsWyPysLMCA17gUciYuraFvkci.NIsGPtk0E4tpX7VWPAWW2nqua6aK7g2tlkyssrbV018s800kcyXtross5ad39dHs+58jTGZzt95F...LdtOB+G8y4o8ezWlGZ619g7YcA.r42uv7tGeaKit74dg9P3+......3Ump3FZGX3MMB+Gvwop3Zk.f9aWD9ul2Hd65.XUFNrUE3t9D7u4VV27qMkANaaWW6619xtdPW6nPkc4lUMca6qqsM8q6lmrsa3xmxpC5YedcC...FO2Gg+it67z9m0q7yjdYKi2p9gt45Fi2MYwOe+CyddelRFBB+G......u5TE2P6.CuoQ3+.NNUEWqD.ze6pv+stvZsotrX471dTSqZbapLTcKa5JCQ21pOa6mzx320s2m0iocaecsb5usCSSyaBy9Djut95F...LdtOB+GcS4OxKOkUGnuyS2+LgM+bmM+r8B7GCMg+C.....X.8kicA.....vQjeMIeX.luuq3w8IHZ+5NdYTt9sOuIAur3w8Y68GxK2VTN+Vls800xssccb1joaW20IA...X+41r3mq6GSx6Ww3+9j7SMd7kY4etvKZ4e+8ESO.......rCTEcyFfg2zny+AbbpJtVI.n+1Uc9utFlrMQWqwMccostpWatpkw65r4gNqO06sEi6U8bYUV620wZpuuttqd+TWz0W2...fwy8Qm+i06hz+tHeaS2x9LrOVLd5b7runy+A.....Lfz4+.....n65RmZaUtH0Ao6soNXZOk8Wft9TGGueIub87lTeSDdc5WWIruJm2qp6Gzlxwuq051955PpqutA...vgsxP600NxW4mYcYeV2x+922w4O.......zSUwul6.CuoQm+C33TUbsR.P+sO6Taklj5Py0LnecYXHpotNsSRxCqn1tMcOXc8od2Eau6x7XaWN662Ooy+A..vgs6iN+GqVYWcuuckulS60s77aZWED1Ez4+......FP57e.....LbtL0cLuaR8M5WSeJ0+58Oe3PxmRxeJI+3Rd9qxycBP....fU6hhGuq+d.J+A54W1wye......fQxWM1E......mntJu7WZ+2kjec1vmJdtCwN51Ok5Z8xTu9TdyDNOTiKKjf.....u7yS+9dLskAGrsos47+S8b9C......b.Sm+C....fcuIoNXbM88I4uj5e88KC92grOj5P.9eL0qCen34uNu7FQbaVVMcdOm9xw2M6HPe84hA...1E1lOuZ4zV9YmKGmccWED.Nt465.....NxI7e.....r6cUpC.3b+XpC82wteII+o7xaRwq1Qy+x461F9u1tgHA...f8sIqeTVpKa7ueeVe3+7CgC......bBQ3+.....X26xhGeJD7u49Tp6.fMsq57ek2fh8c9VtcW2N....fCAeZCmtKxhA66WaYbNKKFtP+P3.......mPD9O.....18J6.cq6l7quc3twVYH81lNXPSk2DiWltus477xvB11MEI..CmO2X3tQtV..Njroc59qa7u+TZ+GWnyVyxB......3Hlv+A....7ZP4u5866v1Udi3U55077GZJC62t5FK7C4kA16lNLcSRxsE+seIadmU..fWutIIOkjGyw2OPC.vgqxuWhxNWeatJK9ibyOk1+btkmuRm+C......fAVUV7WGW.FBSyyGm49QsR.nephqUB.5u6xhm+nLnXKymylcdmGJltUEtuqZY4rpk0lVSccZuHquS9ccw7YUAzqu06Yo9Ftu70qkUSyC9Wyw+o0rNrMaC2loeeOc.8m82XtIo97cMOmzwVX8GCG6c9uxqK6wwsb.Nhbed9XGSG0JgCYOlEOOypBYd44jdXEi6ayw84e43Wy2qVMtkBPK7cc.....v.nJ9RW.FdSiv+AbbpJtVI.n+JCq17.kcwrgqR6cmuM8Fins.8cSwx3xrXnDKC71xLzg+a9MM3sypwlgn677xf184r5Na3lTuss86wr3qSmM6wk27jeNK1YD1U0ztX5E9O3vm82Ho97KkmWV3+5li8v+010LBPWbeD9OVuKyhmi4oTecGMcVp+9CJGuU8CbSye.hV0ONOvPQ3+fCa9LN.....L.phuzEfg2zH7e.GmphqUB.5uIo8ah+0cC8uM2XDkc+uUMbSd4M22xLjg+aROp44Ck2nh6p5cYcDwUM7TVev+1lZZamdg+CN7Y+sW2VVnxE9ut6XO7ekcfXAn.nqtOB+GcSa+f57TpOuYaeOBOjU+CtShqWgwmv+AG17cc.....v.nJ9RW.FdSiv+AbbpJtVI.XybdVc..20g+aRVry9srvpMO7bkcZlkcy8Mjg+67r5POTV6WtCVlqx4Y8aCmObaV+MD4tnl1loW3+fCe1e60q1Bcd4Mmual906XO7eI0WOw0Y8+.G.PS2Gg+itqsNM6x9dJVUG+Ko9G.mlSSW9AwA10D9O3vluqC.....F.UwW5BvvaZD9OfiSUw0JA.atyRcGboYfxdb1ia6FjaWbiQbURdaVL3g2kWdS7Udy+sraXugL7eycYpC7PYv6db15RetY32EaCuHK+0sqS2C82tplD9O3zk82d857r34omedXg+qeNEB+G.ah6iv+Q+z12Ow7N.XWB82bk+.Fz0oC1kD9O3vluqC.....F.UwW5BvvaZD9OfiSUw0JA...CC2Pbut8PdY.2E9u9Q3+.ds59H7e.udI7evgMeWG....vQtuZrK........fC.+owt...........Z5KG6B........fCFmk5tb3aSxi44tCwSota9cSRtXGuLuLI2Na9Wt7tdVM0WWj5Zs477wNLO6R2KbRw30b6wYyVWdnX9b8roqulLaZuK0aSlus4sYwNU4EE0zlrr.........fNnJK9+fV.FBSyyGm49QsR.nephqUB...FFeN97Frnlue35QtVFZyCsV49AKansvk0kfy0zEYw.FtpgaVxxrzjTGLttLOaK.fcccnsv+cyZVdOkjy6v5vbWmmC72xFdX17rL7e.6W2mm2+a5nVI.r+07ZPpF2RAnE9tN....fib57e........utcQpCQ1UE+8Okj2Ma38M96+5rmaabUpCWWY.7lu7Jm+y69cqK.f2k5NIXayyOz3u8ghGustMqOfnSRc80k..daZOviyWWl67zssK.aluMI+dR9gj7M6f4WURdSR9scv7Bfg12k5vM+cI4q2Ayu+ZpO92a1AyK......XTUE+hKAL7lFc9OfiSUw0JA...CC+Z3SoWCc9uyyKeu+aS6ATaRpCsWY35lqqcMuqJF2mR6aemGJwMc9dcdYn3Na1eeYudtIc9ulcZvayya6lu8pr6F9vJluYVsUt8oLXlyGu4cFvxkAvty2km2252R6gf49Fiyzhm6aRxOmjON64+XKSO.Gp9477w2dSpCvWoU04+91YS2eL64+8goLAVAeWG....vQtuXrK.ZUUR9Wa7XuNALDllj+4Y+6+dd4+iX.3PUUbsR....rez7Fi7GSxOsClmWjt0425qMo1lj5Pi0LfbeeR9kMrFZt85cI4uzx3bVpC+17k4mlMduukwcdMV1s7V1qEOzX7V1xec5x5P43M2x11MYVs0rKG9+Up6fhkNK0ulL2519bdZOLg99Rfcq2jj+yMd7+H0AAb9v8I4OO649WRcXY9tYC+uULu9eOB+BvwkeOKdrr4GC7mm8bMutn+SoNjye2rg+oho6aRcP.A.....fiZUwu3R.CuoQm+C33TUbsR....reLDc9uxt51tZXSbS1sqicoq4caw3srtHXSSxyc3t4cBuxN5W4xeSWW1jN+WWVdkckvaVx3Ut84hNTys8dJfcquNO249JG9XR9e03w++rjwqstBH.GC9l7bm6qsiA17w++tjw6yo8tFH......bTpJ9ePKvvaZD9OfiSUw0JA...v9wob3+JCT2iqdz6j0EbtIEiSacrtkob61UavxuK1zv+c1JF2jWtt2ksOcccnb578k.CiprcGm998cACvNzOjs6Xf+79ujA.....NM7kicA........7JxOkjuX.F5qKxhcOueYClG8UYW9qOKyes3wmulw4hT2E8ZqCAtq89j7g0LNeZ13MWa0eYW9qbcdUy620wwEXyceR9usES+OripC.FC+bR96a3z9OhNeJ.....vFS3+........d8orS0sOBOVYP7deqiU69PpC41bs0o89ohGeUp6ng2rjweW4SqeTdw30VnDKqw9r8AX+XZpCwRe8ujjee2VJ.r28cawz8G6tx......30Eg+C.......30mxNO29HnYkc1t9tLaN9kyq4O+2W72ljjqScH.uaIS2ghw30Df94OR+6fe+6otiYAvwtOl5vL2G+8j7a69RA.....30Cg+C.......30m157bmB9kj7mR6cxvKRc..eaNLW+ODqIfW5MoNLKc0zniWAb53mS+5.p8Mvz......TP3+........3XymVwy89j7WRcH.+kVF2KScH.AXSMsii2eO0gEDfSE8oCn92RxuOf0B.....vqBe0XW......vQsuM0+puOW0HUG..GKtHImO.y2epmi+6mUKyc9r+1PZaWlM2t0ko68I46SxOljqRx044tq24ydbe2tMj9PwiOqk+Fvgg6Scv99yqY7lN3UB.6euI0Ge6eZMi2zgtP......dMP3+.....fswWm0eCuB.vyNOI2L.y29Fhsxtg2EY3C+21rLOOOGbuzioa9x8mRx6RcG+a974xbXG9uya4usLSV+n.ri8cI4+4Jd9+dpCIH.mhllj+6q34+aI4i6kJA.....3D2WN1E.........6cuq3wWsGVl+ZwiurGSa43tIAU78I4WZ73gnCLtMJeMoqaeNKGdqKvqAeL0gaYYlteJC.FEuII+6q34mteJC.....fSeB+G.......v9yOkjuX.F5q2mECP2YI45MX9zGeHKFvsyS2B31YYwvI9g7xfD1UkcevCIuOK1o+tLcKTe8IDk.6V+7R9655e.uFLcI+cc8O......N4UkjO2X.fgvz77wYteTqD.5mp3Zk..NjTEmaF.Nc07bbCcv3FCWjEWG+b1tN.Xy4yccbY9TVc.2ljjG5XMNoC0Xy4Ua0XWVG5y30zcY8W2zUEiyCY0qWs8ZnqIC1utOubevpQrd.Xe5i4kGC7aFw5Avke6BE...B.IQTPTA.....1Kph+GzBL7lFg+C33TUbsR..GRphyMC.mtN0C+WRxs4k2v12l1Cj2jTGNskssnqAh65hw8oY+sxPtcYRdrkZaYdbE09YI4sEyq1BQ3XG9u1FuGyK6teSxhaGepiyafcupr39eebLKF.1y9gr3w.eynVM......vdRU7+fVfg2zH7e.GmphqUB.3PRUbtY.3z0qgv+kzd..mGnr6lMzLDdKKra8IPbKaYNe4UFls0E7uy6XsuqVGFxv+0V2NbdH.muNUtcoqyafgwGyy6+8ciZk.v90Wmj+H57o......7JSU7+fVfg2zH7e.GmphqUB.3PRUbtY.3z0qkv+kT2E7ZKvcKanM8MPbW1wk47NC35p+tV62jW1kA665vPF9uLq9JG+kstz24Mvt22k5889iQtN.XL7lTeLveejqC.....fSRe0XW........bfnLvLewnTEv33WlMbUp6hdyGl6cI4SI48I4W2QKyec178xjbQRNqwx78I4Cyd9ec1xdU9kFyqyKlWenXd8gcT8Oj9TR9Kod6RysOI0aadWpWmaac486iBDXA+VR94TG.F.dsYZR9Om5iCBb3w20A.....Cfp3WmUfg2zny+AbbpJtVI.fCIUw4lANczkNaF.GhdH8uSDBra8lj7MibM.vX49j70icQ.zJeWG....vQNc9O........330j7xtzHv92Ojj+XrKB.FI+03Xf......ChubrK.........fM1UEOV3+fwgPu.7ZliAB.....LPD9O........3vwjdLtWjjaZ732kj2uaKG........fwhv+A........GNtHIOljqSx4KYbNK0g96th+9ONf0E........vd1WM1E.........v++tHOGtu4dWi+844kcGvOkjuO55e........vIEg+C........NrcwJdt2k5f+8g8Ts.........rmH7e........vgiuOI+TpC724otK.1L7euO0c5u2kjeMB8G........bxR3+........fCKeHI+xXWD.........iqubrK...................VjN+G.........ru74hG+EGnyS.......fQmN+G.................vAFg+C.........NDcdRtK0c1u6l83SQuVVOAnIG6C.....fiVUo9K2b9..Cgo44iyb+nVI.zOUw0JA.bHoJN2LvoiOGGSC.Xn0my2dWw3d2NXdtuzmPrz00S.Nk3Xev9wg30IA....vQup3KcAX3MMB+Gvwop3Zk..NjTEmaF3zgaHN.fgWeNea43trw+P4b3Wkj2ljm5Ycz00S.Nk3Xev9g8y....fibe4XW........bf3KJF..Xb8thG+9QoJ5taSxkIYROmtis0S.1EbrOX+v20A....bjS3+.........fCQ+XdNbHuKIe+HVKCoWKqm.zji8A.....zAe0XW...........s38I4uL1Ewdvqk0S.Zxw9......5.c9O.................fCLB+G.................vAFg+C.........1FSRxUI4sI4wj74j7TRtKIWO642DetXXW6pjbapqylKmGl82uXMS+0qo9Jq+OOaYstwquNaVsbWdd6+7k0MI4xdLutnnVtp34Oe177tT+Zbyky4aPsCmZJOV3mm8uead49SKy4Yw8CadrnIod+8GR2Olwt7XDklu9Nudler+a6v70w9......3nUUF1+mXAPRxz77wYteTqD.5mp3Zk..NjTEmaF..fWytLOGDhkM7TdNHE8IrGccb6y7bdvYVWM2LDIKK7hkg+qqyuso9a5rTGvltrbeLqOLisUOW2XYUFRx1Fda17vdBGyNOKF.skM7Pp2eZcZa+vksLVlg5XDY131kii9XV9wDbrO......NZUE2zb.Cuo44iyb+nVI.zOUw0JA.bHoJN2L...uVcS5Wv2tpk+1pz0wsOyyxt6TWFdHsGpiwL7ecM3Ms8Zv5TF.ly64x5gNtN.mJZ6XaqZ3or9tEW49gmkkueXaFxiQzmiitpiG3Xe......bzpJ8+K3Df9ZZd93L2OpUB.8SUbsR..GRphyMC..vqQsE7s6Rcm.bdP4NOK1k8ZKDEqRWG29Ffj4cNq2l5.gzrKbc1RV2tsCy2MIHKaxzcdKSyiYw0kIyd7CsLtqKDLMG2axhcZr6R81mKR8q02j1ec85WLWgSSk6ONuSmNoXbJ6dbqKnXk6OUN8ON6u017YHOFwj7x84mGTt4O+E44icrpiE3Xe......bzpJto4.FdSiv+AbbpJtVI.fCIUw4lA..30lyR+BG2Yo8fXLVg+qYPUVl15rUmsxoX+D9u1Bdyso8NS3b21xxXUq+s85zpBNyjz9quqplfSEMCH155neuMKtORWCFWyf+8PpO9zxLzGinrKGtp0gIqY45Xe......bzpJto4.FdSiv+AbbpJtVI.fCIUw4lA..30lx.U71NLMmmCmN+WWUtdttN5z9H7e2TLt20wkQYWCaUSWeB+xbKqafAmxJ6RnqJTdIub+jGWw3119gOj0Grrg9XDkAXbaB5li8A.....vQqp3llCX3MMB+Gvwop3Zk..NjTEmaF..fWSZqq+stNh2bkg23PO7eWVLeWWHGG5v+Mokwsqa66yqakiWWB2YxKe8sqSGbrpYW+qqgQqb+jkEXvx8CeJqe+88wwHJCS21vw9......5fubrK..........3nwkEO9WRxG53z9tcbsLzJq2tF1jgR419eMcea+GlM9qZ9sLkS2xbns8BFRmmEeO9ltex4cb55x966iiQTN+1Gc4NG6C.....dUS3+.........ftpLnJ8IPeGag+6SEOtqgzYnrMa6aa7WVGGqTWC.y6Kd7Xu8BFRk6+roAEqq6G1k822GGinb+7aRc..mzykUe3Xe.....vqZB+G.........zUkcznt18kNjcQpCuxaSxcI4oj74YCGRJ21WF3j0ob720cmpxvRBmxZFfrOjM+8+cc+vtD3s8wwH9kVpkaRxio93nCQWuyw9......3fSUd9+YRGZ+OTB3zwz77wYteTqD.5mp3Zk..NjTEmaF..fWS9b1tOCPel9tNtaRMMI0AUoYP+5xvtnd2zoaa21204w1rb1E0HbL3gzuicz2iqrI6KsuNFwjr50+aS2BXmi8A.....zA57e.........vqIWl5tT0MoNDKM8oT2UqlO.PaNerKfQzmRxeJI+3Rd9qxycBP......3jTU7KBFvvaZz4+.NNUEWqD.vgjp3by.mNzsF..Vui8N+2UsL92M6uWFDvgpd2zoS2uBNbrq55eO1w4+lTSah9NONK0g76wVl1Om5PVusKKG6C1Nd+I.....Cfp3KcAX3MMB+Gvwop3Zk..NjTEmaF3zgaHN.f0qLfGm0yoeLC+2jj7Tw3d0HTua5zUtsuucdryKl9G1x5YWOsvwjluO+tAd9208k1WGiXYl2w+Jq8KVx36Xev9g2eB....G49xwt..........fiFen3w8MDFioxt62OljeYjpkMw6Kd7lD.llJesDn6Zt+3gxwAG6iQ7KI4O0RcrtPVuNi85E.....vnR3+.........ft5cEOdYczo1zmwcHbYwiOlB9WxKC.Se2dVt9W9ZIP20b+wIo+cA0gvgvwH9TR99srNJcHrdA......KnJIetw..Cgo44iyb+nVI.zOUw0JA.bHoJN2LvoiOGGSC.XcNOKd9xmR2C8xsoemusqi6td7lqbccWUua5zcVKiaW6.VsstLYIi61bMQtdJds3pr360uYGO+2j8k1WGinK5R86Xev9g2eB....v.nJ9RW.FdSiv+AbbpJtVI.fCIUw4lANc3FhC.nadLKdNy21go4h7xy0N1g+acgV7s8rdK2tz0vozmkQYMcWGl+SRxCES2s6n5YWNsvwjIoN7yax97cwltuz93XDcY90bd8vRFOG6C1O79S.....F.UwW5BvvaZD9OfiSUw0JA.bHoJN2LvoC2Pb..cyk4km271r7tozk44PxTFVlUYWG9uxPfb8JF2xt5UWp26xK2lzE8YYbVd41vUsseRdYGW7oUL98sd1kSKbr457x8stbGMu2z8kF5iQbwJdt4J2trrthni8A6Gd+I.....Cfp3KcAX3MMB+Gvwop3Zk..NjTEmaF3zgaHN.ftqLTEeN0c9tqSc3PtH0AnqYf3dHuLTHqxtN7esEnuaxhc.vKKp49DVwx0s4gSo41i151f88ZPZa83wh4+YydbY2H7yypkUQ.XftqsND5co882uH0Gi4lTuu4p59nay9RC4wHlu9d6r0klgo67z94FV15oi8A6Gd+I.....Cfp3KcAX3MMB+Gvwop3Zk..NjTEmaF3zgaHN.ftaRdYmzaUCOk5fgLlg+K8rluY1PWm2SxKCKX4PacavM4ZPVVmIbcuFrtvuro0ytXZgiQs0g455vUqX9ts6KMDGiXxFLO20qiN1Gzed+I.....Cfp3KcAX3MMOebl6G0JAf9oJtVI.fCIUw4lANc3FhC.n+JCGWaC2km6JSic3+ljE6reKKnHyCrRY8tpN0URc.GWU..2Ug+a9xZcqKyGtsC091VOa6zBGytJqO7uc43AysK1WZWeLhyS6cTukcbzKWy7yw9f8Cu+D....fAPU7kt.L7llmONy8iZk.P+TEWqD.vgjp3by.mNbCwA.rYNK0g.rYW06wTG5hxtsTYX5NeEy2gH7eycURdaVLrN2Mq9lrh5sKcOp4aOZFNkGm831l9s8ZPtXEKuqS2C9xtndb8T7Z2ko9XekgS6gY+saR8welrrYvL6x8k10GiXYqiOl5iqtpt8WSN1Gre38m.....L.phuzEfg2zH7e.GmphqUB.3PRUbtYfSGtg3.....Nk365.....Nx8kicA..................vhD9O.................fCLB+G.................vAFg+C.................3.yWM1E........GH9hwt......XGx20A....bjSm+C.................3.iv+A.................bfQ3+..................NvH7e..................GXD9O.................fCLB+G.................vAFg+C.................3.iv+A.................bfQ3+..................NvH7e..................GXD9O.................fCLB+G.................vAFg+C.................3.iv+A.................bf4qF6B.......fC.eyrg49ij76iRk.....v16qSx2V72teDpC....fsfv+A......Px2kj+4FO9umjpQoR.....X68sI4es3u8EiQg.....r49xwt...................XQB+G.................vAFg+C.................3.iv+A.................bfQ3+..................Nv7UicA.......vAn+bR97RdtuXKm2Ka91Gpgse4qF1MKe0vgSMbJ79wCgZ3T38BGB0vov6ENDpgSg2KnF1MKe0vtY4qF1MKe0vgSMbJ79wCgZ3T38BSSx+7VNO.....NPoy+A.................bfQ3+..................NvH7e..................GX9pwt........3.vaRx86ok0WrmVNqhZnlZX7W9Ipg4TC0F6ZXrW9Ipg4TCi+xOQMLmZn1XWCi8xOQMLmZn1XWCi8xOQML2XWCuI6uuSC....f8Lg+C......fjONa.....fiIeL9NM....fSVe4XW...................rHg+C.................3.iv+A.................bfQ3+..................NvH7e..................GXD9O.................fCLB+G.....rLeWR95c777aSR0NddB...........bxQ3+.....fU4SI4MI4utEyiuII+PR98j7ay9u............vQmpj74FC.LDllmONy8iZk.P+TEWqD.v9zOmmOu6ej5f.9sMd9pz94l+5T24.uuX5aNs............vQkp3FZGX3MMB+Gvwop3Zk..1298r34e+bR9Xp+bE+eW72+qoNffki+mSc2+C............NZUE2P6.CuoQ3+.NNUEWqD.v912l1CyWeF9s8dUC...........bD6KG6B......N386I4eYKl9+QR9tcSo............75fv+A.....cwzj7usgS6Ojj+X2UJ............m9D9O.....nq9gMXZ96I4M635............3jmv+A.....c08I4u0yoYSBLH...........vqdB+G.....zGSSx+nii6eKI+9vUJ............mtD9O.....nO9XR94NLd+iTGTP............1.B+G.....zW+bVe2+6mScPAA...........XCH7e.....Pe8GY0c+u+wZdd............VCg+C.....1Dqp6+8yoNff............rgD9O.....XSrpt+mt9G...........vVR3+.....fMUac+u+Vz0+............1ZB+G.....ro9ij7aE+soiPc............bxQ3+.....fswzF+6+dR933TF............mVD9O.....Xa7wTG5ujjedDqC...........fSJB+G.....rsdSR92SxuMx0A...........vIiuZrK......3n2aRxWO1EA...........voDc9O.....XW3mG6B............3Thv+A.................bfQ3+..................NvH7e..................GXD9O.................fCLB+G.................vAFg+C.................3.iv+A.................bfQ3+..................NvH7e..................GXD9O.................fCLB+G.................vAFg+C.................3.iv+A.................bfQ3+..................NvH7e..................GXD9O.................fCLB+G........v+er2crxMN1UZ.3+oq4Av7Mvk7KvTEm7EAZych13IRSpyjCYnb13P0Qyl1Sh2X0Ussy0T09BndG+Bn19IPa.HWQcEHI.IA4kr+9pBkMIu3hCt.MEB3+b.........pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................Pk4aO1E......m.dt30eyQoJNsctrFdnNONWVu...........fsjN+G.................PkQ3+..................pLB+G....vWqldrK.............XU91icA.....vAz0I4x4aSRx2bbKG............naB+G....vWSt6XW.............Pe7ticA..................vqI7e..................UFg+C.................nxH7e..................UFg+C....3b1MI44k1J8bGa2Oviwj4Gm6SxSKMG2ljK64bLsnFVd+VL+OrlyitbcR9PRdbo86w4u208bNV0btnVdJsmq2kjq1x4LY+rFtJWrzbu7Zwh4eWp6gZRd60kEqg2L+yA...........nh0j0+CSDf8gY4kum4SG0JAfgoIdVI.n+JC+We15J7ekiYHy+GR+B00x6yMyeuo40AVqO+8uUsOkaOj1fw0GWlWBk251dLq9b8PrFtrKRanD6y07GS+CY3PtVrrqxlWCeJuDLys83............vHpI9wcAL9lEg+C3zTS7rR.P+MVg+aRdcm3qOAsaSJC+2EY0gEaUtdfmqOk1vBtNWtmNOODqgKWy8Irhka8oiHtMgx61snND9O...........fJTS7i6BX7MKB+Gvool3Yk.fs21Fnpx8a4NJ28oMrdWl1t61so6fmcyal0UeLtY97t768372aUgfaZw3WzE4lTLlx4ccgpaRGmK2jWBL3j4m22Nu9V243gXMbw4X498XZWKVzoCmL+0cE9vME.vgdOTWAP89zddt3Zyz4iaw4bWm6............TAZhebW.iuYQ3+.NM0DOqD.r81Wg+aSAEaUc0tIqX7kGikCn2CoMTbaxiKsOapi98ghi2pBUWYGnacguaR5+42XsF1UXEuaC6yc4sGi0s1Mj6gtniwe2FF+p5Fh............TAZhebW.iuYQ3+.NM0DOqD.r81mg+6pMrOqpq4MjiwCY8AWagxtK2lBKXYs83JFWYHA6SsrJGh0vaKF688r1J6Fhqa+Fx8PkAK7C8nVlFc9O...........fpUS7i6BX7MKB+Gvool3Yk.fs29J7eqq6ssrxvnstveUdLdJscBt9X4t9WeC7VYs0UfAKCE2tXrWCmzwwnuqec0g9V09126gFxbVp7b1y7...........vWgd2wt......3DzG2xw02vekj7KI4y8XbSKl2eomyeYsMsiwTd7WWW2an12qgkcQv9t9k4iqbcaSckvMob+e+.pm9t1............mwD9O.....Ft9Fvtes30cEvtUouA.qri8ssg+qqN+WY8eaZC.3jddLVm88ZX46Oz.z0m0igXWpGg+C...........D9O.....FQeYG12sI7eedGNlc0Q8deG0wsI4wzFBvgzIC2V887orVJCM3lTN9c8bqb+6aW+C...........fJVSRddoM.FCyxKeOymNpUB.CSS7rR.v164rc+cjsc+Fx9tsGiG5Xe21stLYCGi6R+BJ2XuFtKy+Xbb105Yeb9............mvz4+.....3z1zQd9+RR99j7mWwmecdoS.B...........vdhv+A.....IIedCe9eII+gzFBvtF6sy2............XOP3+.....37wGSx2rka+gdL+eNuDBveLuMDf2jjK20ShsTYsLzNhX43+0cnVRda8bwNNe...........vWYD9O.....NssbH0FZf21EuOIeedaH4t9.VCKqrN10v+soNg3lrqgQD...........9Jmv+A....voskC81jbX6vbeIsc.vkcr57ekg+an0wUEu9i6Psz09Oj54XsFB...........UDg+C....fSaG6NuW4wexA93uvuT75qR+61dSyaCbW47MTkg+6pz+fYVFDQ............pDMI44k1.XLLKu78Le5nVI.LLMwyJA.auGyq+6H8MbXOms+u+z28caOFSRxSY6Nu1GlTbreXEi6PrF9ghwceOl6IoslWd+taOTKIu89sOzi54xNNFdlG...........fJQS7i6BX7MKB+Gvool3Yk.fs28o+g7ZY0b3+RRtoXeeJ6mtG2kYycxuxi8sqXbGh0vKxaCB4cY0mCSl+4kqcq6bdHmGW0w3WW8b0R0e44A............Ufl3G2Ev3aVD9OfSSMwyJA.auxfpsHLVWNe65zFfrR0d3+RdaWuaQmuqqyoKSaPytMscmttNmWdNua93WNzZSyaCN2yqYtNDqgIsmuki+w750gKl+5xNy2yocsYeUKIcuF8XZuWb466VNXpOj2duJ............Ufl3G2Ev3aVD9OfSSMwyJA.auI4scTsxsa5X+NEB+WWcwt9tc8Jlu8w7rON+F591U..2z1SYyA+aapkIoMLeCoNlFg+C..........fu58ticA.....vAzWRx+97+2yMeII+37sgd9Moi26hj74Abr+ORx6G3wcr79j78I4iiz3GhuLet+K8Xreb9X+0QnN............XOnI9ur6.iuYQm+C3zTS7rR.vt6hjbaRtOu72Tdb9q6p6ucJz4+JcUZ6DfKeN9bZ6Bc2m1y+qS2A+qOyyiI4CY8c6ukcH67eK6xr5q02j16ENT0xh66VtS.9XZWeKuuqry+McfGK............FAMwOncfw2rH7e.mlZhmUB.............fybu6XW...................7ZB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................Pk4aO1E......bR66RxOszqaNR0A...........vYEg+Cs9kH8C..f.PRDEDU.....1E+tj7ucrKB...........fyMu6XW...................7ZB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.................PkQ3+..................pLB+G.....rJ+PR986447OljuaOOm............mcD9O.....XU9mI4+MI+OoMHf+tsbd9tj7SymuYI4218RC............N7ZRxyKsAvXXVd46Y9zQsR.XXZhmUB.3PZVd8e68uk1f.tPS59uM+6yKA8awm8Oy9uSBB............GLMwOncfw2rH7e.mlZhmUB.3P6S40+82EA46mSxep38+gz1o.KG+yI4OdPqZ............XOqI9AsCL9lEg+C3zTS7rR..GZ+9zF1utBzWe29oCcQC...........bJ6cG6B......pd+VZ+OfHaq+wNt+............e0Q3+.....f93mRxeeK22+TZ6bf............zSB+G.....zW+vVrO+8j721y0A...........vYOg+C.....5qeKI+0AtO+v9uL............N+I7e.....vPLKI+qdN1+ZZCLH............Cjv+A.....Cw+LI+TOF2+JsAED...........fsfv+A.....C0rj7O1vX9ozFTP............1BB+G.....rMlslO6ek90c.A...........XED9O.....Xa7yY0c+Oc8O...........fcjv+A.....aqeti2SW+C...........XOP3+.....fs0Ok1v9sreN55e............6Lg+C.....1V+y71t+mt9G...........vdfv+A.....6hkC62+YR9siTc............bVQ3+.....fcwukj+q4+++4iWY............bdQ3+.....fc0Omj+QR9zwsL............Ne7sG6B......N482N1E............v4Fc9O.....XeP..A...........1iD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A....bncYRtKI2mjmWZ6gj7gjbcRlbzpt8qmK1.............Ng0D+v.AFeyxKeOymNpUB.CSS7rR.bp5xzFvux.w001SyG+oNg+C...........fsx2drK.....fuJbcZ61e80jj7qiTs.............UOg+C....XrcUdav+9bR9kj7wkduoI4h4i+WRxWNHUGmqlFAHE...........f8rlj77Ra.LFlkW9dlOcTqD.Fll3Yk.3Txjj7Td82cuoN.3jzFbqyAOG+cqCoqSxGxK2yA...........bxRm+C....XLcUZCy2B+ZR9wMrOeI5Xarc1TvRA...........NY7ticA.....bV6xhW+9iRU.............mXD9O....fwzzhW+wiRU.............mXD9O....fwzEEu9yGkp.............NwH7e..................UFg+C....Xe64k1V2m02stbYwXtt3ymljaSx8I4o4i494u2zs6z5+2j4GuOjjGmO2OMe9uY9mencUd646yI4gkpq9ddew7weed47a40uqFXsMlWqtIC+9s66YcuuWG5y806x9NsXLWtzmMIsmKOzyi+h6uWL9E2eeWF94M...........vYklr8+Xv.nulkW9dlOcTqD.Fll3Yk.n1sMA7ang+q73by726hzFRoMMmeHaWH8tJuNbccs8TdIfa6Rfu5iaxqCl1l1VWvstHsg6pOyyi40gKaSFqqUkg+qOaaJ7ei05vXG9uxwsXcdZ59djtbY1782KNuOFgbE...........3nqI9AsCL9lEg+C3zTS7rR.T6NVg+aZ5WvkVr8v.Outcf080C3bYnljW2E25y1SqY95anu55brOFqqU66v+MlqC6x8Ba6+l3h0b9TprCMtO+2N............mMZx37CCDfkMKu78Le5nVI.LLMwyJAvojsIvSaSPmtMut6lceZC+zkosa2ca5NDT27lYsacExr6mO2K5.ZSmOtEGmtNd6CqJ3eKpmKVZrWL+8tKscPutLsi45wzFnsEy0j4utqi6PC91XdsZWVuG60giQ3+J6rhON+8JCu2j7107EgzbwmeYd4ZWe+2M............mcZheP6.iuYQ3+.NM0DOqD.mRNTg+qOgvZUglaxJF+BWzw9b2FF+p5Je6Cky8SoMXVaitB80cY8qI2k2ddMcMiOcL9w5Z01tdeHVGNzg+a4f+8PV+8Hkcox0EtuIYyWG............Na0D+f1AFeyhv+AbZpIdVI.NkbnC+2l59ZqpCmsNkg7ZUcPukMsiiy93uaU1ABeJaN3cqysEy288b+J6nbaZ+NTWq1106Cw5vgN7eKG7uMEVuOTrOB2G...........vJzD+f1AFeyhv+AbZpIdVI.NkbHC+WeBkWxaC5051ut55eWrkGm8we2pLLbWsCy0jr8maCcc4PbspqiSebnVGNFg+6o0TOKqLDi...........PE3cG6B.....f8jeomi6iEudcgipLbcuOIedKON6pqxq6Ha+Z5+47pluk8Ko+maetii8PBh3XbsZacLWGFa88bobLapCKB...........G.B+G....v4h9Fnres30SWyXK+rgDnu8c3+tr306Rv+R1systFeY8sNiw0ps0wbcXr02ykx04aSa..mzwXA..........fCDg+C....3qMeY.isrSy02NB2XnrV10vEVNekA.aSJG+XzU9Fx0ps0ov5v1pu2i79NF6sI4wzFBvZ5bB...........3npIIOuzF.igY4kum4SG0JAfgoIdVI.Nk7bF92a228Yal6C4wXer+i0bsuluZ5Z01dbNTqC098qSRxCcLGK1tKBAH...........GT57e......7kj78I4OuhO+57Rm.D...........N.D9O......V3ujj+PZCA3m63yuc9F...........LxD9O.....VsxvOcwQoJZUVKSOxyW43+0cnVNlrN7VeNuDBveLucM5ljb4gtn...........3qMB+G.....q19Nvc6hxZYWCeUYH010Pu0UWh6TvwZc3XFjzg38I46yaWmt9HTK...........7UEg+C....fU6iEudHAtae2Yz1kZoKkg4Zny2UEutr9NUbnVGJON8M7eGy.mtvWRaG.bY57e...........vWkZRxyKsAvXXVd46Y9zQsR.XXZhmUBfSIOmg+818ce1l4dn66zhw8T5enstaGqwRWzw7sKAvpq4quAMqbc44jLYMi+PbsZaONGp0gOTLta64wXH2GsOue6XL+............Uul3GREv3aVD9OfSSMwyJAvojS8v+kj7XwX+POl+K63XrO96V2WLeOk0G5tMoLPZ22i8YRRdnX+taC6yw5ZUeCw2gXc3lL7qcWm2d9erB+2jh49g877C...........bRnI9AsCL9lEg+C3zTS7rR.bJ4bH7eW0w3uKqN3VWk1fc87R+u6q+tUWcZtmR+5.fcUuWzQMttysI4scht9DhsC00pxvQtoPItvgXcnqNL3CqYeJCK3X9uItbC0dW0Se6bg............mUZheP6.iuYQ3+.NM0DOqD.mRNGB+WxaC50yosKycSZCN0kosKssb3ydHuMvT6Cqpavc27O6hkF6z4u2Gxp6lccMeOVLWWL+0kcVumS+Bd3g5ZUWAl6t75qQWrh88PrNrp6itMsgF8x4mCOzwmOl+ahEc9v6lWGKGDvoqntW05H...........vYsl3GzNv3aVD9OfSSMwyJAvojykv+MIuNPVaZ6ozFZpwH7eIqN.faZaeNe8siClATG659NIusC9UtcyZ1+wdcXruOZaVmmLf5Yw108btA...........N6zD+f1AFeyhv+AbZpIdVI.NkbtD9uEJ6.acscedoqnMVg+KoMTXK2oA6y1z8z7cWFVme6PdsZZVe..WW3+Vr+i05PR+C.3GxKcfuwL7eSS2cxvUEFwq547B...........bVpI9AsCL9lEg+C3zTS7rR.bJ4bK7eIsg85175.b8XZCBVYGfqLzVqK7caqEcFt6yqCw0Cyeu6RamZqugT6xzd9sb.3db9quY.yyxNzWqVbMpqyg91k9Fi0gkccZu1r39nmlO22l2deRYGIbU2GsKqyWMudJC93ioMHh51e............wOncfCiYQ3+.NM0DOqD..............m4d2wt...................30D9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJy2drK......3j1uKIe2Ru9SGo5............3rhv+A.....6huKI+2K85u4XUH............mSd2wt...................30D9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A.................TYD9O.................fJiv+A....7+wd2+J4F4nKH5+1IN96TVW2Nz9.rSD08AfF0Cv3n0tM1Pqa6o0aKSsd8ZVGKcb0Xb6wVGiZ70Dwbe.z41Gu0RSOOA5ZvhawBUlj.YBjIRxe+hfQ2RJ+CR.j.fjeeLA............5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.....XL+PiNt+9FcbA...........tXH4+.....fwbeDwuDQ7iw7SXueHh3miH9aQ6RpP............no1EQ78idAPKbe773LOtpkD.JytvZk..VR+sX+bt+VDwGiH9iI+66hwma9GhH9oiNFeO1mHg............vlztP.sCzd2GR9Ofsocg0JA.rj9gXeh+c77u+Vr+o32eHd8by+9XeB98KI+8eO1m7f............vl0tP.sCzd2GR9Ofsocg0JA.rz9iwqSjuCu9eGuNw.GZ690XehAB...........PF9cqcA......5d+RDwedj+s+uR9y+GGY69wXehAB...........PFj7e.....PN9wHh+wD22+Wgm33............EQx+A.....432hH9oIre+iHh6qaQA...........3xmj+C.....x0GiH9KEtO+TrOwAA...........n.R9O.....nD2Wv19Wh8ILH............ERx+A.....k3wHh+bla68sqX............bYSx+A.....k5mxXa9Kw9DED...........fIPx+A.....k5WiH9WNy1jSBBB...........vHj7e.....vTb+I929yQD+sEpb............bQRx+A.....SwuFi+z+6mWvxA...........vEII+G.....LU2Ove2eIh3wksX............b4Qx+A.....S0uF6S1uic+xWL............t7H4+.....f43mO5++eO7T+C...........nJj7e.....vb7Kw9j9KhWlHf............LCR9O.....Xt94Hh+QDwGW4xA...........vEi+o0t.......adeLh3ODQ7aqb4............3hgm7e.....vb8aQD+3ZWH............tjH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+..................5LR9O.................fNij+C.................nyH4+....fKe2EQ7PDwWhH99Su9xS+c2thkKpuum7B.fqGVGPcYMzbowXD.aYFCa8ntG......FvtvGdJP6ce773LOtpkD.JytvZk.HW2DQ7o30Aoywuta0JczBBHK.fqWVGPcXMzboxXD.aYFCa8ntG.....Xk4I+G....bY5lHhOGQ71yrc+0Enr..zitM1OW42e5+5I4ELrs78JkV1sFZ.tLskmKCfV6ZeLxq8qe.....Xh1E9kSCn8tO7j+CXaZWXsR.jiODu9Wl6Gh8OkRtK1GPyeX0JczJ90XeaRPEAqiCA22gWedcKNqpK8wgtzu9NnUqCXKeuRokcqgda5Z4d7gTx0t2q.Wy1xykwdFCqdJcdS08W9t1Gi7Z+5G.....lncgO7Tf169Px+ArMsKrVI.Nm2DuNvbtlCH1qIBHqsi2EQ7oHhuEZqf0R5XlWa2KdoONzk902PZU+4s78JkT1sF5skqw6wOXpW6a06igZXKOWF6o8adly7lp6u7csOF4090O.....LQ6BenR.s28gj+CXaZWXsR.bNuOd8SqDtNHPU1NzVAquzec++x5VbVbW5iCcoe8MjVcMukuWojxt0PusbMdO9AS8Z+ZtNC1xykwdFCadlS8m59KeW6iQdse8C.....SztvGdJP6ceH4+.1l1EVqD.mSZ.Kb25VbXAIfr1NzVAquaimmy7yw02S3qK8wgtzu9FRqtl2x2qTRY2Zn2VtFuG+.I+GTts7bYrmwvlGI+Gmx09XjW6W+.....vDsK7gmBzd2GR9Ofsocg0JAv4703kiUdy5VbXAIfr1NzVwVxODQ7wUtLP8coONzk902PtFulqIqgda4Zt+tj+C3ZjwvlGI+G.....vF1uasK......U2aR9y+8UoT..WJ90Hh+PDweK1mHf.bIxZnA........5NR9O......fy4iQD+mi8I.3ebcKJ..........v0AI+G....bY36G85T+aGdc2YNduIh38QDeNh3qGseeNh3CQDusfx1sm3beySmmubhx+b7tHhOEu7Z3qO828tYbLeH1WWb700Wd5u+b0s43MlzHZm...H.jDQAQkw954OGQ7sjywmi80Y2V3w7Pc8wGyCsm0nLWhZd8Uy9p2EurMMsOxsCTtObdNW488Q42m94LK20rNXnxRK120bbAllO9z+8+XDw+OQD+RDwue0JMO6v37G5u7sXee+Ghy22O29qCc+YIux4d4VLeUpVNNTqlusj11Vd8sjlSe5RbS7xwYOzlk9zuKhWWuMlz4Qeex+9wyWcXdzCWeuejy8bctxdsWCcINrlxC22LVcw6RJCCsliZOuZOtF5deLrVt1lkX7sV7dEp46apkqSuTuIorjNVWZ+oC2aep9R27z+9mS1u098s9gj88qOUVOmahWd+zP0SSg08UOWJelOkn1060bMasX8eK0Zi644OL2Q9xYLxdp9L0buGJmq+kX9giuVVy4H.....fLsKx6Ke.f43934wYdbUKI.Tlcg0JAvPJMfCFKPYdSrOvHx4X70SbbNU46P.tba75.BrVisO1wN80Wh7Bz7CAyzwIp14BnibBJxTuOyx8gWoAvxX0koA80Pu9zDKykXtWeGaI6q9l30AcVo0g4zFTZfAsD0AkdOYI66bFW3v094BFNpqeIdY6xuEQ7SqTY4tHuwjOUPpma+0Ru2sj6kq87UmRKFGpEk+o111hquSo1iCsj8oi30ye7sX7fxctisey.muwdUijCojxdo8YpQx+cWj28MGpKNWv6Oz0xTWucOuF5svXX0nMXH05ZerxPMeuBs78MMT8aMVm9TLVacZRUmSeo2Fmu9J25oZW+OTR78gLJGo8olax1ace0yV9y7YpGmZWuWi9is3XkplyaNVc+VX9ig5aZtiSW1N08W8T8YD06dnbt9K89obu+5fdXNB.....nP6h79f0.XNtOddblGW0RB.kYWXsR.LjRC3fgBfqbCXhzW4Dv6oAGxaNw4ZtRe5nbtWmJX2OH8W25bd8kH+fZYnm9N4TtSktMkdb+Rlk2RUqquCVx9p2V34Zr5vZGv5KUcPo2SVx9N0wEtYfsq1IKBC6Gigae9aw90ouTJYL4SMtVt8WK89rzWeZjiaKlu5Tp83Pq87sossKYx+U6wgV59zo0UmqsYNisOk0.L0eDElRYuz9LyM4+J89lODSO4+Jc81q88zG2Gen1+svXXysMXLsJ4+Zw6Unkuuoz52ZsN8oXNkkiS.gR5GlS8TKp+G5Xdp6EReJv8sXdIof08UOa8Oymobbpc8ds5OV6i0PZYx+skl+Hsuo4NNeY6T2e0S0m07dnbt9Ks+Y5qwleHh9XNB.....XB1E48AqAvbbe773LOtpkD.JytvZk.3bxMfMNVZ.5cHvRdW7bf5cyS+4gBvmyELXoAGR5uHze8o+t4FDHCEnguKdYftb6.m+bNuG90W9SwKqWhm9+GJvpdHii6XAM0mi8+Rdmddd6SG2gBZjgN+Ge7derO3XdarOXxGJ.cpcRTUyquHV19peHd4u510rNbJ2mdvRVGTZYqj8cpiKLz8ZesvxIS2uEiG.ZOFQ7CM97OVRWc6Q+62EOe+6oteL29q2UvqgRppgB38VNeUtp43P0n7Wy11Hl2024TywgV59zucfs6bIz1bFa+34gN7TR7P+j27zednmvEmJ3XKwTK60tOSDCGTueIdccR5S8lz6iFyTmWMhs4Zn6swvRKSs787L0q8gpmOteVsVm6Rzl2x0omiSUVd3oxvcw3iw8P7xjV3aOcbNrei8DSOmm5dsn9+CIa+o5Cm1ueN04V2W8bI7Y9T5Xe0tdul8Gq85dywbl2bKO+g4Nxatib6ezK0mqw6crEyODQeLGA.....LQ6ho+AuBPttOddblGW0RB.kYWXsR.bNkFPOCEvDODm9WF5GhWedx8IFywAqvWh4+DT4XGGzIm6WA4OkTtNWffbbPjLlg9Um9bOkCRCrtuESuNI8be30XAp2XIlWsdZ6DCb7my02R2Wsk0gkde5wmuktNnDkruScbgwdBFvx3iw32mb30Gi1kDfoIOy4Bp1ScuQs6CMz8mucjsskyWkq4b82hxeMaain9suGqliCsj8oG5IyQsehvlNmetWWCMW0X2+ThoV1qcelwl+dLuIF+IpyXl57pQrMWCcuMFVZYpkummodsO1710dctKUadqJ+4XnxwodeNCMF2g9geIF9Z+l308+Vq5+ahWmPICcuP57iS8Ir6AV2W6RRls3m4Sosg0tdul8Gq85dywbtGXKO+g4Nxq7ma+ido9rmeuikL+PDq+bD.....vLrKp6W9..C4934wYdbUKI.Tlcg0JAv4TZ.Kj9q3etAnW5u3vmZ+FJvP9RT2jLKMPCOW.lkFLF05IGVZv4bp.wXneInOWfNcJCUOet.meresrqgZe8sV8UOWhQLk5voFXQqQcPIJYem53BuYf8KmmVLTG6hwC3uzWe7osulRC1s4LORMCvuHdcPMN1SXgdY9pod82pxeMaain9suGqliCsT8oGJwMxIw+N2w8baaIqqHstnF80mSYulRWeXNOYCG5ozzoJWScd0dYLoRVCcDSu8pkWuSsMnTS8Zenx2Z9dElaadNii0px+PkkRRx1CuN0SBnH5q5+zDtIsrmVV+VL+99V2WcFi8R4y7oj1vVTuWy9i0dcu4XN2Crkm+vbGSaN1RtFVi5yd98Nl67CQzGyQ......yvtnte4C.Lj6imGm4wUsj.PY1EVqD.mSIArvMCr8m6ItvACE36isukFnJSwwADStAyVZPvUieQ5eaxw7TA2cI+RPmiz54bSDgz5gbBH8bTyqu0puZt0EkVGNk.KZspCJQI66bFW3cwy2y+oXYBVxi8Cw92W805qeKFNn+F60iQD+XTGoAg7bTy.7KM.TOUvN2KyWM0q+VU9qYaaD0s8cH0ZbnkpOc544TAgZIG2ysskDPpCMW0b9QCXnxSs11RLm4uSu24TkqoNuZuLlTIqgNho2d0xq24r1lRL0q8z8aseuBysMuUqSOGSotbnmZr4j7C8R8+PkkiuGJcsP03o2p08M+wXuj9LeJoMrE060r+XsW2aNly8.a44OL2QcWWUuTe1qu2wRleHh0eNB.....Xl1EK+G1Kv0m6imGm4wUsj.PY1EVqD.mSIArv6h4E7Eo+RKOV.nL0.EJWoOYTx8IYS5SufZ7K4cZv08kQ1tzfUZrsqDo0y4Fvko0C0nrT6qu0puZqpCmRfEsV0Aknj8s0iKzR6hWW9857u90X+mGwOTV08KT5SolSYN80OV53ceOFOgk5o4qlx0eKK+0rsMh5091ZKQe5zyQoi2VRcY51laejCRKqkjjh4Tdp01Vh4L+8PO8+FS51kS6bOMlTtqg9fdaLrgJSsZsMSsuZ59sluWgHlea9ZV9mRYYn6myIAmSK+4lb.mSo0+G1mzmBU2MPYrVI3i08M+q6KkOymgNGioU060r+XsW2aNly8.8z3uQT13W8TYumm6H29G8R8YO9dGKY9gH5i4H.....fYZWTmu7A.Nk6imGm4wUsj.PY1EVqD.mSIArPZvRTZ.ZmFHYiELISM3PxU5uD1k7z2ojfgYJGywZCZQvdM0fUYnmF.yUsu9Vq9p4pz5vobd585fR22VOtPKsKdc42q7d8qQD+boU3GIse7gwWlxScsZLt2ahW+TN8Ti20SyWMkq+VV9qYaa54apsuKgV2mN83Okfwuj5xzsszm5OoAM6b6qOmxdsL24uysbktc4LuZOMlT5wrEsWs95cJsASwT6qN08qEuWgoTl5ox+R1FzK0+GjlzAeMd4SfouE06oxs08M+wXuT9LeF5bLlVUuWy9i0dcu4XN2CzSi+VZYpmJ687bGas5yd68NV57CQzGyQ.....rg7Os1E.....fUUZ.Y+WKb+S29bCv6+0BOOmycG8++uEQ72m3woj.T+tX+uRy2F6CPiC+2odtpccRIlZ80oT6qu0puZtZQcXpduNXtVy6AJ0uEQ7WV6BwJ5+bDwuuv84uD6S5ueYlm6+4XevDe739eH1G3b+OiH9Sw94AVJeJd4X++omJGiYMluplZY4u2ZaWJs759130I62o5e1BkV1SmqJmmrI8t4N+8Tky7paw0POGK806VZsMmxbWm6Z1lGwxrN8Vp2p++Wi8ykbHoFdS7x6I9uE0qNu2VavVbceWJelOknU060r+Xu02tU5swuJw09bG0VsKO818PkN+PD8wbD.....vLsKZyu9Y.br6imGm4wUsj.PY1EVqD.mSK9kcdtGiV8K88AeYfywTecJ2D6CjjzeMmmxwrE0Iqwuj6aoiWqaWZ88dpCnG7CQYi+8wm1mZ5l3zi6+PjW.vM29fo+R8myS5lkZ9pbLkiWqK+0pscpWeqkV0mdni4GlP4aoGaulsc8v7Ry83l692i2SePMWC8A8306RMtyTOOyo7U591Ks40Xeq4wao1uVT+md7+5.6+mJ3XTx4x59ltZbb5kw+x8bzx58ZtV0ZdrxwZMF5ZO90ZccWyi2Rreaw5yd48NNk4GhnOli......locgOnFf16934wYdbUKI.Tlcg0JAv4zhf6XtGiVGTB0JXINUY6sw3Aez2hH97QuVq5jdJHb5wiWqaWZ88dpCnG7Sw4GG82h1jzeoRCxtzWue7cMhA19Rb2.6+cmbOF9b1h4qxUMFGpUk+411N0qu0Vs6SO1q2VX4ZoGaulsc8v7Ry83l692q2SW60P2yWuK03NS87LmxWI6aO0lWi8slGukX+ZU8epGFX+yY94ox59llZbb5kw+x8brD060Xsps3XcJq0Xnq83Wq00cMOdKw9sEqOOXMeuiSc9ggNmsXrJ.....nw1E9fZ.Zu6imGm4wUsj.PY1EVqD.mSKBti4dLZcPITqfk3qib7e2.a6me5ueneMmWq5jdJHb5wiWqaWZ88dpCnG7qwoGG8iQ6S5ui8lXev7MzSeluGm9ob1T6CdS75fRM2mlZsd9pRTiwgZY4eNssS85qGTy9zeO1mbFeH4u6aQYOIYV5w1qYaWOLuzbOt4t+838zsXMzSYaGaep806RMtyTOOyo7k691as40Xeq4wq06WKq+O1PI6vgW07IUVJq6qb0nueNGikX7ubOGKU89bWqZqNViYsFCcsG+xbG4seaw5yisFu2w4L+vPmy0XNB.....Xl1Es+CGGf6imGm4wUsj.PY1EVqD.mSIArPZPQbagmqaS1+uTgxzTjFbP0zPAyw6Jn7L106bq6m54sE66Pp802VnuZKBrpioNf01eHFOfy9XrrI82PdWLbv9M1u79SsO3mh7tW5bmyZOeUolx0+ZU9KssMFXa2hlae5O8ze+MCbbJo8aIGaOctp41OqGlWJccjklXL4Vt5s6oa0Znmx1Nz9zhwvVpwcl54o0qwqGayqw9VyiWK2uVW+e74YrjqXIWef08kmsv6gLWSY9vds+3RcrN1ZMF5ZO9k4Np6br8T84XVp263bleH8bt1e1......vDsKVlOzKfqa2GOONyiqZIAfxrKrVI.NmRBXgz.U3bAWSpzeYt+zHaWqCviubzw9aU9X+93kk82mw9jy06mmvwsFm2VruCo1Weag9psHvpN1ZUGzyOcnXY8ywqa29aw90n2KtId4bB0998z4DJ8InVKmupTS45eMK+kz1FwkyXLyoO8wOkTRCd+RladIGaO24pxUOLuT5ZhdaA66METt5s6oa0Znmx1dPqGCaoF2YpmmVuN2drMuF6aMOdsb+Zc8+AoOMYea754opw6sMGV224sEdez4J2ywZUuW5ZUWpi0Aq0Xnq83Wl6ntyw1S0mmRqeuiyc9gH5i4H.....fYZWrbenW.WutOddblGW0RB.kYWXsR.bNkDvBoAqPoASTZvLOVfj05.73gjieoAbwojFrH2b5MOhHuq2z59Z7q7bOEDN095aKzWsEAV0wVp5fz9749DFXnDK4TVx.+h53Wimau9sHheZUKMiKsu3XARWo8AuMJ+IRQpVNeUolx8fqc4O211HtrFioV8oSmG46QdOAflyX6kjnaQ75jTXtIPROLuTZhx7PA66cETt5s6oa0Znmx1dPqGCaoF2YpmmVuN2drMuF6aMOdsb+Zc8eDudLoOOxe+TRBhox59Nssv6iNW4dNVy58RVq5RdrhXdsQa44OL2QcmismpOOmV8dGqw7CQzGyQ......yztXY+Pu.tNce773LOtpkD.JytvZk.3bJIfEdy.aeNAAdDCmnOiEfNsN.OR+0n+CU7XOkfDLm8Yn59bSxpZUVq09NjZe8sE5q1h.q5XKUcPZhWj68SoAtTKpCX87GiW94H7CqYgIC4z+pj9fC8jCnjD34fVNeUolx8f8P4O2x8k1XL0pOcZ+3uFmO.qmyX6kbexPyyM2ffsGlWZnjhImfZOhxlas2tmtzxyR7iHPqGCaoF2Ypmm4T9p87pQrr+vQT61lktMnGp+uI1OmwXiQmNdUM9wsIW0t94RZceag2Gctx8br1060rtnWNVa44OL2QcmismpOq44L2sqVyODw5OVE.....TA6hk+C8B35y8wyiy73pVR.nL6BqUBfyozfoHMQexIH8JMXGZc.dbS75e0kyMf1Nmzx94BB8z5ySc8l9qneIACdNk0kZeGSsu9589pkruoANat8WWh5fzmND4ztkFzR0L3xFxah8WCeNl1uv5TtOF6amtecKFY4l3k8s9xHaWI8ASexckSBSMVYqUyWUpoLNzZW9yssMhoONatVxwgpYe52DutM7bOEflyX6eOx+o+W55FlZfzdpxSs11Rk1eLmf6cn.a+TkqoT92pqgNh9bLrV1G5XSc7sVuN2V2l25x+Rb7Z49055+z0BkNN1P2eM2mdq4v59Nud+8QmqbOGqY8dIqUcIOVQLu0Fukm+vbG0cN1dp97bJ4dnbKa0Z9gCkudXNB.....XF1EK6G5Ev0o6imGm4wUsj.PY1EVqD.mSoASwPAA9Cw3AuvMwq+U8+bIGzRDfGCkvR4Fr4mRZ.ucp.XrzDfZnf59aQdOg7Fp9t2BBmZe8068UKYemZBNrD0AC8zg3KmXeRu2q1AWVp0Jvhul86iH90X+ZwWa2EmO35R6SNVR1jaev2Fu9dn4DTdsZ9pRM0wgZU4ulssQzlDI6fZNNzZzmdnwsOUBLNmw1yYt+glq56w7ep+MT4oVaaoRGG4b8YtMdceryUtlZ4eKtF5H5uwvhX5sAkZpW6yo7ky91517VW9WhiWK2uVV+m6Svzzi62h4MVt08UG896iNWkbNZQ8dM6OV608li4r13s77Gl6ntyw1K0m09dnbJa0d9ggJiq0mM......LQ6h1+giCv8wyiy73pVR.nL6BqUBfyYJASwPAOyWe5u+Pv58lm9yo+Zg+837Iy0RDHXQL7u92Gdh7jFzg2E6CnhOD6ulFKnDGpt4CIa+aiWFHUoAV2oLVfK8v.k6ae5u6Swv+Z82KAgywp402XGudouZI66PIdwCOU9tKFtO6AstNHhgSBiuF666+1mNFuOdYP5c3eu1AWVpgp69ZA6Ok6Gd5UO3v37OD66Kdb.+caTVBDkSevgBV5Z7TdqEyWUp4LNTKJ+0rsctWemSMGGZo6SevPOcdqwwMcaO99mCWiGbp4pp0SSw4T1qsgtu4SwqqSde7b8VZvvepx0bJ+aw0P2aigECbLakodsOmxWN6aqayac4eINdsb+ZU8+MwqGm9TIlP57Km6oK6oXce0ace876iNWkdNpc8dM6OV608li4Lu4Vd9CycT24X6k5yZeOz4JasZ9gH5i4H.....fIZWz9Obb.tOddblGW0RB.kYWXsR.bNSMXJFKIsN0qbeJtsDABVDi+jiImWmJnMFJvqG60GhxR.pHlVc+PG2dIHbRUqqu4b7Vh9pkruC8TiJ80T90tuF0AGJekzu+vu34oAT3oL055wdRCxkuah5N1dN8gRCf8o9ZnqkVLeUIly3P0t7W6114d8cN0Zbn0nO8wm6z5muTgia51NzS7tkpO9bK601TmaM2x0bJ+aw0P2SigcPq6CcvTu1mS4K28sks4KQ4u0GuVuesn9OcaF6GokCF5oH9TdJFYcem+ZpT856iNWkdNpY8dM6O1h08li4Lu4bZeycea07GKQYu0GukX+xca6g5yVbOz4JasZ9gCWO8vbD.....vDrKp6GhH.C4934wYdbUKI.Tlcg0JAv4Lmfo31H+.Z3gH+eggqc.ybNuKNePMk95TI.vMw4qW9V7bPWjlT.4TOURc+gW2lbL5gfvYL035apGukpuZo66swo6mdtjRoU0AGjaRJ7o34ek0Whj+an.J9gB1e1ttMF9IQxXiIet.MOm9fkLl0odMlZOeUol63P0p7W611Zc8MlZMNzZzm9XCkXdyMggFZay857qQ9IodtlaYu1tIdcvpOzquDOuNnbKW0n7u0VCcuLF1AKQenClx09bJe4tusrMeIJ+s93058q10+2Mv9my6oH839s3kOUlxg08k23XkpGeez4ZpmiZTuWy9isZcu4XpyaNm120Z7qkrr25i2Rre4ts8P8YKtG5bksRF+3TuNkdXNB.....nP6h59gHBvPtOddblGW0RB.kYWXsR.bN0HXJtK1GXxGG3Me8o+76ixShnZGvL45sw9.VKM.h9xS+ceH1GbE4FHhuK1mnSGGLFGpSN9XjFDRkDH6Gd5o843kAyxgx7COUNFpMnGBBmyYNWeCom5qNk88Mw3k+b62T65fTuK12tbHQ.+V778OoInY5SShSk.myot9cwy8eNN4C45vXis+0Xe+gb+0uOm9fKQP9cpqooNeUIpw3P0p7Wq11iUiqugTywgVx9zoF5oLQZ8RIG2SssoymbnOxCQcCr8bKOyYamqC8KOttXr16z6oFSMK+ao0P2Sigsj8ghn7q8kbctsnMeIK+s53sT6WMp+uIdcxUTRRFjtuepf88XV2WazSuO5k5bTi58ZtV0Vrt2bLk4M2xyeXti71ub21dp9rl2Cctx1RM+vottVx4H.....fLsKZ+GNN.2GOONyiqZIAfxrKrVI....nGsDA++0jahWVe940s3.........rz9cqcA.........3UReJ17WWkRA........vpQx+A........8GI+G........bkSx+A........8kaiHd2Q+4+dDweZkJK.........qDI+G........zVuId8SxuwbWDwmS969eV2hC........vVv+zZW.........fKbuKh38QD+aw9mfe+0m9++qO8ueSrOo+tKd4S7uHh3eMj7e........vUII+G........zVu8o+6ah8IAXt9SQD+2pewA........XK32s1E.........3B2eJh3uWv1+uEQ7eOh3+Rg6G........vEDO4+........f15+9SudaDwsO85lm9uQDweM1mje+0md8mVgxH........PmQx+A......vd2ez++GiH90UoT.aW+GV6BvFveJjXe.........YRx+A......vd+ON5++wPx+A.........vJ52s1E...................dII+G.................PmQx+A.................zYj7e..................cFI+G.................PmQx+A.................zYj7e..................cFI+G.................PmQx+A.................zYj7e..................cFI+G.................PmQx+A.................zYj7e..................cFI+G.................PmQx+A.................zYj7e..................cFI+G.................PmQx+A.................zYj7e..................cFI+G......vkt+XDwenxGyeHh3Gq7wD..........9+Px+A......bo6wmd82hH9oXeh6ME+9XeB+8KQD++EQ7qysfA..........rsrKh36G8BfV3934wYdbUKI.Tlcg0JA...kaW7x2KwuD6Sjue+Qayw+66N5u+OFQ7wj+8epsEW..........fdztP.sCzd2GR9Ofsocg0JA...Sy8wKe+DeOh32h8I12eL4u++ZDwO+z+d597KKawF..........nWrKDP6.s28gj+CXaZWXsR...vz8X75j4qjW+V7xmVf..........PS76V6B........KneLh3eLy8+2pRIA..........NAI+G......v0jeMh3mm399miH9k5UT..........fwI4+.......t1beDw+dg6y+Hh3mpeQA..........Flj+C......3ZzOV31+yw9mZf..........vhPx+A......bM5wHh+Rla6+drO4+..........fEij+C......3Z0Ol41ceDwu0thA..........7ZR9O......fqU+ZDw+xY1l+8HhO17RB..........jPx+A......bM69Y9uC..........Mgj+C......3Z1uFi+z+yS8O..........VMR9O......fqc2W3eO..........zbR9O......fqc+ZDweN4uyS8O..........VUR9O.......h3mS9yebMJD..........vAR9O.......h3wHh+eO5OmlLf..........vhRx+A......vdGR3u+kHheaMKH..........fj+C......f89kHh+Q3o9G..........c.I+G.......68aQD2GQ72V4xA..........H4+.......3Hdp+A.........PWPx+A.................zYj7e..................cFI+G.................PmQx+A.................zYj7e..................cFIiD9lHD...B.IQTPT8G.................PmQx+A.................zYj7e..................cFI+G......vVx2Sdw0K8EXKR+156tHhGhH9R7b85Wd5u61UrbAzmLNLszR0+Zq2OdqW96MpOAfoxbH8CsE...mz+zZW..........nP2D6Svu2Nv+1sO85OsnkH........nx7j+C......fkysQDeN1+K37mCOUp.pms53KSobeySa6PI92w9qyqnAvpZqNtN.vbX9OpA8iVOp6A..fqF6BOBuAZu6imGm4wUsj.PY1EVqD...Wy9drseOAGB9kCu975Vb1z158EJ0kdvRcoe8cPK62tUGeYJk6ODutt7gHh6d50aeZaf0z0x3ZaMao0OrUGW+Z1R0+ZK0OdHa8xeuQ845wb8sg4+195g6MzOJOsXND08Si4yg85g4P..frsKrPdf169Px+ArMsKrVI...tls0CDhzx+V7ZnWbMTO9tHhOEQ7s3x7Z7R+5aHsre6Vc7kRK2uYfsWfAQu3Zbbsslsz3ja0w0ulI4+xyVu72aTetrLWe6Y9usod6dC8ixSKpiT2OMpy3ZVuMGB..jscgExCzd2GR9Ofsocg0JA..v0rsdfPj9qe8WV2hyl1VuuPNtzuFuzu9FRKul2piuTZ498Ia+CMszAk4ZbbsslsTazVcb8qYR9u7r0K+8F0mKK02sm4+1l5s6MzOJOsncSc+zza2CAKI8+A.XyZWXgL.s28gj+CXaZWXsR...bMaq+EAea7bPv74vSqp4Xq2WHGW5WiW5WeCokWya0wWJsbmFHg20zR2q8lXeBH9oAJKe6o+tODQ71EtbQe3ZbbsslsTazVcb8qYR9u7r0K+8F0mKK02sm4+1l5s6MzOJOsncSc+zza2CAKI8+A.XyZWXgL.s28gj+CXaZWXsR...bMyWDLGbMzW3R+Z7R+5aHWiWy01WiWVGdyBcdeWr+IVPZa3od80m1Otd3d79m1HZII+Wd15k+di5ykk5aXXt2XaR6V+PaAWyz+G.HC+t0t..........PldSxe9u23y2sw9j96gm9++6QD+yQD+WhH9+Nh3+vQu9O8ze++7Sa2adZ+9x.ka........fMpcgeEC.Zu6CO4+.1l1EVqD...Wy7q.KGbMzW3R+Z7R+5aHWiWy01RVG99iNOk9T76lj8+aw9jGjKatGu+oMhVxS9u7r0K+8F0mKK02vvbuw1j1s9g1Btlo+O..aV6BKjAn8tOj7e.aS6BqUB..fqYm5KB9PhV74XeRV78m9++PDwcy779tHhOE6S9iiSDjOEkkLH49EYeax1cb4+v04Wx33bnr+Prut33i4gmjU4V2TyxzAuM129bba1gx1me5XNVxxzp9BeHdc8TId2L1+iSTnbe84BJW0nO7PGyCs6e6oxyCw911Ts75aIU508wJIXVtId48TGZyF6IHWNG66R1l2m7u+l3026b3568m3bOG4TtKseybGyOh8smGNdeH12dLE2Furt7T0gqU6SuNOQMF2JsNMc+tMd87PGluHmj0rEiqMmwXVZG2m731oC0gkTdaca0AmaLm0bc.oJYNiiO+qQ+msv8qmprWiw.i3zsY0bL7oz23XsXcg2Lvw83quimGctk+yoVsoqUexH5q5yCly6cKUMm+Hh11V0x2CSsqGlSegb12V7YBL0xxPVq4.q48FQrcVeUqVG7RLm7wVyw5i3xbN4sRc+oTy9h4ZNi80que9Ghg6C9ljs63yaoss03dnkZ9swzqqwZqMGxAas0WEw52GD.fYXWT+2TE.otOddblGW0RB.kYWXsR...bMaruvzb9Bi+TTdxaba7xuj3wd8kHu.1sjur3i2tCI.xXkmTG9Rg+1.a6Xe444T2Lmxzwd+H6yXuF5KkuU8Edy.aeIAdxmR12RBVqVD3C0tObD6C.gb5a803k0yKcx+8l34.fZpAM2wl508wJ49jGR11y8jiK2i8P2Gey.muwdklPZyUNk6R62L2.w635hZz243D.7bIBzR09zyySzx4dOTldS75fibnWmasC0bbsZLFyR4v3q4b890H+6IaYa0Pmig5GtlqCnzx5wVq9Oao6WO1RLF3wsYoIU5XuxMYyKouwwZw5BiX+Z0OWc42hmueXpk+SYImWqE8IOVOTedrZ7d2NnUyeDI6aMaqZw6gYIlGsz9B4tuCUOOkOSfZTVNXslCrl2aDw1a8U05dikdN4yssK0X8WxyI2608ioU8EyUI0a876m+tQ19zWGN9oikjqk38gT642RsEViUqtG05qN81tT8AA.nB1ElnFn8tOddblGW0RB.kYWXsR...bMK8K5bnmLVm6K7OWo+xCetWmKwbFp7m61d3WE4wBpiTo+x7lacy4BDj4Tlhn71qC0qmqrT69BoAvvGNw1drgRXfRBDnZG3CsnObI8sRqiWxj+6l308MmSRqMmq6ik6X.o0U0b7kz5jobeYMCxsbJ2k1uYNI+2w22TiD+6fiaSO0wcoZe504IZ8buG9EyO2fj7b2SWqw0p0XLKgbCv9zW4b+TKaqF5bLV+v0Zc.SorFw50+Yqc+5wVhw.Oz9W5X3S47jiVzdEQ9I13wiELkx+4rTyq0p9jGzK0mQT226VDsc9iHYepYaUseOLK07nk1WH28Msdtz05UyxRDqybf09diCWGas0WsFqC93xTMmqrU0Qi4ReN4dtt+TZUewbUR81kx6m+CwzR9uk38gzh42NXKsFqVcOp0Wc5ss08AA.nh1ElnFn8tOddblGW0RB.kYWXsR...bMK8K573eMW+br+KF8tX+uDteHF9KHMmD.51j84vuJ12jrMoAGdIOQmJ8K7M8b80m96F6bd3WE1O8TY+3ekieSL7Wx9CMrLMVfM74Xe6UZ46sOUd9TFkkZ2WHMHR95HaWpz5zyUedNy4K1uE8gGKg5t8n+86h802eMN+8ZsLvEFp+ctsiop40cNWyucfsKmjYK25yzqiiuu7vSIwC8SdyS+4g9Uldr6MKUo8CZY+liCrlbS1mai80Qu+oWuKFu85Pc8o5KtjsO817DKwbuGtOsVyWbpyUt8Oq8XqsTZazg1zi6+byS+4gly+bAV2RzVkSazVZc.qU+mKg6Wa8XfGN1GW9eaj2X3m6G+fRGqoUsWCUGkdcda7xmLMC0lUKstMs08I6o5yZ+d2Z87GQrbsUyo9dImGszxVt6aZ8UoeNE0rrrFyAV66Mh3xX8UommR6+sDyIm6115w5uFlStWq6yQK5KlqRaK5s2O+PIj2WhW+YXj9DKL8bbNKw6CoUyuEw1aMVag4PtDVeU511x9f..TY6h5+lp.H08wyiy73pVR.nL6BqUB..fqYoegom6KocruP8y8Kc7weQ1m6WG3iCp2y8EZO0uv2i+xd+RjWh.cbPuMlg9kh9MmX6mSYJsc3aYrOmRq6KjFrBuMixT5wOm84TlSvEzh9voAxyo5qeSzlmZM4ZreAomhZdcetxyP+BZOkm1Im5ZM89vbutNNAaqUe7zxSNsQsreyg6ENWh9LT.qk95awqqSOtuzX2StjsO817DK0bu0d9hSctxQsGasUFJ.6e3Lkmg5Wdp10knsJ21nsx5.Vq9OWB2u15w.KocYn6Ux8oDaNi0zh1qgdRWdp.J+Mw3OgSpkkrMs18I6s5yZ9d2Vh4OhA19V0VM0560XdzRj69d71LkOmhZVVVi4.q8mqwkx5qF57ThkX76SYopih35XN4dstOGsnuXtJssnmd+7iMV1XlSevk38gzp42hX6sFqdeNjKk0WktssrOH..U1tn9uoJ.Rce773LOtpkD.JytvZk...3Z1PeYymKvpG6WC9wjlzPm6KWM83m6SzooD.LeIpeP+m9EdWZ.YmSYJsN8bAmQNZcegOjrcm6WG6zfsZpOk4N1TCtfV0GNMnYlaew4D7DmSoA+1oTyq6ScMeS75m9O4l3em6Xeps6b22erz5h0nedq52bbPwcp6YNWR+cp9b2DmuNu2ZehXclmnky8ly8Vkt1gwNW4n1is1JoyKdtmLYGj9qU+o1uknsJ21nsx5.Vi9OWJ2ulq4NFXtkkgdxNj644TZU6UZ8RNOwYG5G4fZNWdtlaaZK5S1S0m098tsDyeDwx0VM0560XdzRj69NT8bs+bJxsrrzyA1hOWiKk0WMz4oEly32mxRUGcsLmbOV2WakzWLWs5dnk38yO09fCc9Nkk98gT6421hqwp2mC4RY8UCsssnOH..Mvtn8uYX.tOddblGW0RB.kYWXsR...bMK8K.M2j4I8KB9TAgvwIeStegwoG+wB9f47E99snN+RRm5sQ90MSsLMkmdNmSq6KLTxicpur8z.33CYVdNkoFbAspObZfQLWyI3Ixw6hmqK9TL8fknlW2m5ZN87TZenbqOS2tRRPkgtun1Ixas29bcHX0NU8QZ.s8P75wyNdrfgBtoCsyicuYu09DwxLOwRN2aNAh3PG+b1uoz+r1is1BGm3pGdk6ZRFpe4X66RzVkaazVYc.qQ+mKk6Wy0bFCbtigO1ZlKYrlVzdUx80m6XuFi6Mm1zVzmr2pOq46caol+HFXaa03GSo9dslGsD4tuoaWK9bJxsrrzyAV6OWiKo0WMz4oEly32mxRUGcsLmbOV2WakzWLWs5dnV+94myXYk1GbIeeHsX9ss3Zr544PtjVe0Paaq9tf..nx1Es+MCCv8wyiy73pVR.nL6BqUB..fqYoeIn49kje7SzouG6+UScHo+pCm6ScqzietOQmNkzscpO0xNmzun7wpalZYJMHSN0wuDstuPDuNXBOU+gujrs03KmeJAWPK6CW6eYymSvSrjp408XWyCkTY05XetsqjmtfQ75x5bSvkR6Gzh9M47D463.W5aw3AL1wI.zPay4Rxvdq8Ih1OOwRO2aKluXryUNZwSMhZ6cwKKikFbqoOYdVy1pRZi1BqCXo6+bIc+ZtlyXfk1djduxXigma+3V0dklrqkrtkzicslKuDyoMsE8I6o5yZ+d2Vp4OhXYZqF57ji0ZdzRj69ltcs3yoH2xxRNGXK9bMtjVe0PmmVXNieeJKQcz0zbx8VceKTRewb0p6gZ86meNikMzS+ub21V+9Pp87aa00X0yygbIs9pg11V8cAA.PksKZ+aFFf6imGm4wUsj.PY1EVqD...Wyl5W15P+RvNjzflojmTXGue49DcJ2iWIe45SQtkqoTlZU.4059BQ75fHXr10zesfy8We5yYJWisrObZ8wg1yo9D0aNAOwRplW2CcMmd7mZvcL06iKMAURCXo41euz9AsneywWSCUebbPK8s3zOM8NN3gFx6Oy+du09LV4J2sKm4I5o4dOVIyWLmyUsGasERmKuzjRM24SWh1pRNGag0Arz8etjtesDK0br09dkV0dkFnrk99TZYaUsKCKQexdp9r1u2skZ9iHVl1podd584QKYeS2tV74TjaYYImCrEetF8d+hk3dionEieuD0QWSyI2a08sRsO+s75okiwO2wxV66gFqbT6421pqwpmmCo2qCJceaceP..Zjcw59FS.tNbe773LOtpkD.JytvZk...3ZVq+xVO9I7xXOUlx43m6SzoRJuyM.1tK1GXAeJ1ec9sANGkFDH4TlRep4bpjloDK0W7dZ8zPAwcZ.nTZvFTix4AstObZ642i80QuOJO.2mSa3RqVW2oGig9UNepOsnl58wkJMIW91DNFyo7zh9MGdp9MV+9udz46bAeygscriUoI+WolS6SOLOwZO26b22odtp4XqsvbmKOcrt0rspzywVXc.KY+mKo6WS0hw.KU58JiMF9T5aTy1qzmzkkNlPKlKeHqcaZt6aOUeV6261RM+QDKSa0TOOWxyi1hDsqjqikZNvV74ZbI0uXtmmTK832KQcz0zbx8Vc+bTi9h4ZtGud38y2x9fK86Co1yusUWiUOOGxkdcPO8CBE..mvtn8uwD.tOddblGW0RB.kYWXsR...bMq0eYqoAMybdM2xeMBhjah8A9woB3i4DDH4nFWG093Vx99gjscneYlOtey2h58kyOkqwV2G9lybNdHxOHKaUeiVnVW2o62PGyOLwxXKuOtEGiodrZQ+lCALzP+Jee7SRubdZdcXa+zH+6sN4+J8XzCySzSy8N28cpmqZN1ZKrT8KWh1pROGag0Arj8etjteMh9XLvobLx87zp1q4dcVi5owzSsoKU+lZVeV61lk5dh4dtJYemx4o2FaXN6aKu+cJmikZNvVbceI0uXtmmHV2wuWh5nqo4j6s59RU69h4ZJGudXcOKUevd98gjidn+xTNFK08nqQeubOF8bc...cfcgIwAZu6imGm4wUsj.PY1EVqD...WyZ8W1ZsBhfZ7kEO2uv22FiG7GeK1mDKGdk64Zs9h3q8wsj8M8onU5uBvo+6OTXYoVkyw1mZ2G9fzmxQouFJ4Hpw02ZatW24V2etmtb4brm61UiyUKNVsneygmVeC098vQmqy09dWFa6gi2XIR3R19zqyST6wslSc5R2+rFis1BKU+xknspzywVZc.KQ+mKo6W6kw.mxwXpkmZ0dM2qyZTOMjdqMco52Ty5yZ21rT2SL2yUI66TNO81XCyYea08uy8bz54.aw08kT+h4ddV6wuWi6clyqZU1qw9O2i4R0+LWsnuXtJ83s122Lm8YJ6eqtGpVWGmyZ2eYpGik5dz0nuWtGidtN..fNvtvj3.s28wyiy73pVR.3+e16NV4VGIMQA8+sh5An4Sv1qtu.SDZ7WZn1daGM1skF21Siotdp8ZWUNaecUsF8ZeJCMQrl5DQuO.5r07BnSuOAZMHQQvj.jHAPB.J98EAiyQh.I9QhDIRIl+Jyy5vXk...3RVo+vVGqIQP5DCuOw+PNWuqg8+Ka+9MsZzz2IZQWTpO35o5CdOhCmnLWW68Rmjg2jYrLlwYS6yX2FttqhMm+UINU5qSsB1ctNoFFx4cSa+SwgqrTuG4uBUTx6iKQYz2xpDsapJqSshdcpqI0uN1VeAUkWaqLfS00mk7yIF69slxmWLFW+FZeqkvT0tbJtV0miw4z3.Jc6mOK2utj5CrOkQeimw550POOGi5oTKwqoSU6lwr9bru1LU2SLziUN6aeNNKs9FFx9Vh6eGqiQIeFXINu+L0tXHGmkP+2yw8N8804vyjWZ08cUoZK1U4TdKg6aFx9LFw1XcOzXcdbJyY6kgTFS08nyQautVFK45...V.VGdHNP48PrqelWl0HAf7rNLVI...tjU5Or0zIMwXaJ9.eWEG9W946FoiUehozId20Gey6ro5CdOhCmTM0WUepmXPcIg4xwPm3CknMbatKZdRVdrjf3yvjZH2y6zsqJAvV0P4j60uRdebcWGia6rbimRztoprZJ4+x4XU+ZXSIJX8UHr1V8QlhqOKsmSrjd16P22wt8Ye5asDF5yxSaW9ZKa2TbspOGiyowATWIZ+7Y390kVef0ktRRNzUI1Rc8JscUo9CVPWsTul108cIUeN1+raS0yOhXZtV02iyk9yQy0XbLF6mAVheuFelZWz2iyRo+6o9dmOyOSN2xbpZedJkrsXW00xaobeSkzXYJ9CY0R6mCoKNWGi0R9YHpC.fKN+vbG........rf70Z++wJI0lZo+Ud9+Hh3mloXIhH9VxWO0IrvX3mhH9dsut5bXUre6j4rdtxb0F9mhH9WSN9Qb5Ifz4tgdd+uu8e+dDw+Vx6cSzdBhMmRaW88F2pKO2G6OI2R66KhHts1+uT8WzkqOKsmS7Y3YukxRou0zieelTc00z8GKYmSiCntRz94yv8qKs9.qKcbxC8Yrk55U58vycagk70ztXIUeN1+raW5O+nxbUOjaBX7YxX+LvR760v8Gm+8emiKkmIet5bps3RKVGReYMsJE1kiy4X6biwZ7Y7U.vEGI+G.......6T+CMdUbd9g4daxWO2SVkeI4qOGS9uH1ud7pXyDDHst9mmtvoUyYa3uG6RlsJmqWuywPNuqOo9+ZrYRaU2iQ4mTSosiOkzyszIay4npI3SS000m7Oscs3lXy0piYUrKYNSSjnioDWeVZOm3yvydKokPeqosix83m1lKcrAmCNWFGPpwt8ymg6Wmx9.ysO7zmyLzmwVpqWCY78kn+qk1y0x0Rp9br+Y277iMlp5gziSWum+bLIJ5hw7Yfk32qg6ON+6+NGWJOS9b04TawkVrNj9xx44Om6+bHFi03y3q..XQXcX46En7dH10OyKyZj.PdVGFqD...Wx9H5+OSPW126R1lSkLG4Jm3uumq4teWmw9zmX5pF1uwXBFU51BoROOdLh34Ze8yYFCcQehyR2FtKJY6okrtb9zks40js4sna+0Puu06O0gxtRS2OOzIbUtsCJQ6lursrdsg26oZGquzv6eWDw6ae+6ilqWVE6tt9db75ro35yR64DKom8Nz8sj8qMm8Y1TaqtNQ1Zp8Sa8oMEWq56w3bYb.ktr9Lb+5T1GXNsKx4YrcMdJ00qz5jS8rs5p+b0wp+rk1y0xceWR0mi8O61T87ingsMG4ru843LU0COmrcc8d9bZGM12+NEGiwn7JwuWiOSiupuGmkR+2SQczkxyjiLKyop84XWV4zVbrigkx8MUtIYedO59J5WNsAWx+bHcw45XrVxOC4yz3qhL2V..VPVGdHNP48PrqelWl0HAf7rNLVI...tjU5Ov4Uwtj3H2Oz3wJF5y1dr86TS5mzO.6wdRfDwtDqoOSDjwNVFx9V+730X+1J2kYLzEuE6GmcosXoaC2kie8icSISUk9b9kiqhMSzhuDk45Scc87tKs8tJN7ZXWRdf9de7GQ2WYhRuWNmDSqqwyXu8cQaIsWDGNQ1da61eerehZdWre6furceuK1us9opqmhqOKsmSrjd16P22R0uVN8sVJosCZJYXSUOwW6R+FSw0pgbLl5wALV82Mlse9Lb+5T1GXodFaWimRd8Js+ttLVkzmoNVOKeo8bs9ruKo5yw9mcaJd9QDy20ptdO0TTObej+0tzjonj2SzUi4wXLeFXI98Z7YY7UQzu6MVJ8eOE0QWJOSNxrLmp1m4VViYaw9FCcc6VBi6IsMXWRNplR9p45dnHi3XHNGGi0R9YHQ74Y7UQlaK..KHqCODGn7dH10OyKyZj.PdVGFqD...WxlhOv4l9.c65j1crhgb215R+vqu+Ha6TMQ+ZZBc7dzs+BGO2+kGtt1pudOyieW02DspTsguIN8jaH8XerI7SIRjrJMMofN18BGyXdd229g9HNchkz26i6x8iqhl+KV8PW0+ZJdF6suKp2GUSsSZ6d+p5t5WaZZh0ky8gSw0mk3yIVJO6cn6ae5War6asTZJwjeJZO1apc4oljbSw0pgbLl5wAzkXcNZ+bte+5T1GXe6CO2UI1ioTWutsg33X8IbarqOjz9RFpk3y0xceWR0mi8O61T77ingXNG4ru88mgYJpGZZEv40irOM8ybTx6I5ptdLl5mAVheuFeVFeUD86dikR+2SUczkvyjiFhkwZaGy8MUIaK1Ucs7VJ22TWSsAOVbccbXau47dnHy3nuNGGi0R9YHQ74Y7UQlaK..KHqCODGn7dH10OyKyZj.PdVGFqD...WxlpOv4lRdipUOrlVUntM1LIxdqg2uuwPeOWaZhc7XRbcar+GpdWmrOCo9usIbxSwg0qWu868bz9ewdmp1BoZZxoTpjvnoIKvSwl1bUqnXs0dqDsgqJym1t80mjCWG4mbXC476TZpreqmk0XddOjI9xXkH.oaW81zUmiUtJNbkqq50XsJWk68ikZxvTcN1V6jah8uu503v9ViX2DI58Za28Q2+q49Tb8Yo9bhkvydG591m90F69VKolZ67Vr+40wZWdpI03TbsZn8gLkiCnKw5b094b990opOvmhx8L1bqmJ00qlZeUsB4VueuzUMyz9JGpk5y0xceWJ0mQL9+rak94GQC6SNxYeGxOCyTTOzV6nGiM2GbSb3JXc06W56I5ptdLlimAN12azVYdtM9pH528FKk9umx95+r+L4ng3Xr11wbeSUx1hcUWOeVJ22jpo11OGGN926i8+8krTtGZJd9VDmeiwZI+LjJeFFeUzP4C.vYh0gGhCTdOD65m4kYMR.HOqCiUB..fKYS0G3baqhRc40wlrt4DCC4bsoIOQaudLltI52wV8rN1qwNVFx9lVW8QTtjvnoUutzWs8WR6wtM7pQpbFqyuSos+JKmqw97N29gRqedcDJ6zsqo+BsOzqs4H2qQC8ZZap2+Tea2MFlpqOKwmSrDd16P22b6WqD8sVZ84Y4cc0LXJtVMz9PlxwAbpXcNa+bte+5TzGX0jsuDWi5SeSk350pHu5x2iMSh4RjnAKwmq0mqSKk5yHF2e1s9Vdc84GQFwwP22g9yvT55gR2NZH0ycUWNFy4y.G66M5aYtjFeUD8+dikP+2SUcTDWFOSdoV2eJkpsXWky4yR39lT8sM3R4dnwt8zwbNMFqo5dzK8wWEMTF..blXc3g3.k2Cwt9YdYViD.xy5vXk...3R1T8ANW4t3zevy47AQmSLLjy0UwgqZXM8gPWMoGR+fnGiUsr1bcGhszWWOxwxP12zDw44L2+bccb71fmJIkFq1vWGM+WG41ZacaCkQIN+ZyUMTVO0ixYrOuyssWSI9Ua0IcsraZ65544aQ2mXLcUt0IiQ+Pso9D4oo9clBS00mk7yIlym8NF6aN8qUp9VKsbdV9SQ2SNto3Z0PaiNkiC3Tw5Rn8y458qSQefU02knO79VOM1WupzTRwl95Kwt5sRjnAKwmq028cITeVYr9Y25S4kyyOhF1+bj69NzeFlRVODQ2mf5OG6Vs7N2R9u49Yfi88F4VlKswWUoO2arD5+dJqip7Y9YxK8591Tp1hcUNmOKg6aZKt5RavWic8ItTtGZraOcJmKiwZJuG8Rd7UQCkC..mIq4FDqC..f.PRDEDUVGdHNP48PrqelWl0HAf7rNLVI...tjMkefy0car4CEN8CP90seuGiMS5fUsU.8HFFiOv26hMefy0+fy+Rr4Cdtdrl9AQ21DOdL+Pnq9qe6Wh8mzdU0oOsM9WRSD2HN7utzichP0jqhMswp296ssecWO9iUa31Jm2hMs05ypovXb90j6hcsspOwK5iw57tOs8Z5un4MUuz0x9Xa2caOd0mLKut86UpjNJ25jRNYXp+Wc9p+JcO0l5qOK4mSLGO6cr12b6WqD8sNEtIZ+779H+IS2TbsZnsQmxwAz0XcIz94b890wrOvzUtjzsYL6CensiGqqW0U0uW8yu21dbRqKRqOGym2tjdt1P12kR8Ykg9ytkZre9QDS+0pw3mgoD0C0k1uy6wt6wSamjth4zV6nwbrdsImiwb+Lvw9diHNOGeUc88di4r+64pu9H9b9L4yk591L1sE6p9b9rjF2Scs0Fro9kSa2mqkvOGxPrzGi04xyPp6bb7UQLesAA.XfVGdHNP48PrqelWl0HAf7rNLVI....lGoqlbeYdCGnWLYRNt5SLm4XkVy0GX4x3.....FGqB+7U..Pm8Cyc.........bl3oju9uLKQAPI8SQD+6a++qhM+koOm+BiuJ1j.g2O9gFvLy3.....FGo+dV95rDE..vYhebtC........fy.OF6OoT9ksu.974mhMS5rmiMqzW2r802hH94s+62ps8q1tcWG6Vo.+dHwffOSLN....fwij+C..xfj+C.......33tO1eU756wtUFLfOm9ZDw+8Xy892EaRtuqhtsh98sXSBDtJ1zeATRccUorOjbaaXb.....imqiM+tVp78Xyerk...3rx5HhOp8BfR3gXW+LuLqQB.4YcXrR....LMVEQ7Tr+OG5GQ2R9GXoJs8LcyswlU9quDQ7drec3qa+92Gal.aCgqOjqz1Li4qKcFG....vocUz8+vzbSb3uWE+LV...mkVG9PU.JuGBI+Gv4o0gwJA...PYsJ1LoSRmHJeDaRB.3blj6YYy0Gxkj+a7Yb.....c2iwledo219+uM1+ONRq198Z5OtJeYRiT...FQqCenJ.k2Cgj+C37z5vXk....nrtKZNIHLg+4y.I2yxlqOv7y3.....5t2h98GblmiMIFH...mkVG9P8.JuGBI+Gv4o0gwJA...PYsJNbxnb+rFQv3Qxksr45CL+LN....ft6wn4UN81d8V3mwB..3Sf0gOTOfx6gPx+AbdZcXrR....TdeI1sJ+b0LGKvXRxksr45CrLXb.....441XSh.9kHhWic+tMdc626wsaC...eJrN7g5ATdODR9OfySqCiUB...fx6pXyJ+C..WdLN.......fEgebtC........fEnuM2A...yFiC.......XQ3Gl6...................f8I4+..................VXj7e..................KLR9O.................fEFI+G.................vByON2A........KDuT6++miH9GyTb...........R9O.......15+sZ++e2rEE..........PDwOL2A...................6Sx+A.................rvH4+..................VXj7e..................KLR9O.................fEFI+G.................vBij+C.................XgQx+A.................rvH4+..................VXj7e..................KLR9O.................fEFI+G.................vBij+C.................XgQx+A.................rvH4+..................VXj7e..................KLR9O.................fEFI+G.................vBij+C.................XgQx+A......7Y2eJh3uFQ76Gox62EQ7m2Vl..........PQ7iyc........Pg82hHdIh3+2Hh+e190+sHh+YlkyeJh3OFQ7+dDw+UDw+x3Dd...........mKVGQ7QsW.TBOD65m4kYMR.HOqCiUB...x2uK1jre0+4I96wlD5qR82a81u25XWhBV+8k3e..........vEn0gIzNP48PH4+.NOsNLVI...neVG6+yST85eFaRvu5eu+OiH90V19GlxfF..........X4XcXBsCTdODR9OfySqCiUB...5u+ZzbB800WuL4QL..........Wj9g4N........XB8PDw+0.1++z3DF..........vwI4+.......tj7Oi9m.e+OhH90QKR..........fiPx+A......bo4kHh+uxbe9uhMqZf..........vjPx+A......bI5OW3sG..........FDI+G......vkneMh3+QG21+yHh+d4BE..........3PR9O......fKU+0Hh++5v18PgiC..........3.R9O......fKU+yXSB.dL+mQDuT9PA..........1mj+C......3R1oV8+9SSTb...........6Qx+A......bI6Xq9e+mQD+5zEJ..........vNR9O......fKcss5+8vDGG..........vuQx+A......boqoU+u+yHhWl9PA..........1Px+A......PD+sS70..........vjRx+A......PD+ZDw+ys+++qPx+A.........vLSx+A......vF+sj+E..........lMR9O.......13kvp9G..........KDR9O.......14OFQ7qycP...........R9O.......14eL2A...........Dgj+C.................XwQx+A.................rvH4+..................VXj7e..................KLR9O.................fEFI+G.................vBij+C......3RxMQDOEQ7ZDwGae851u20yXbA.bI4ijWL9tjqiWBi2Km5+K4qU740R39PXrUuu5uLywB.....LyVG9k6CTdOD65m4kYMR.HOqCiUB...x2pHhmiCmb00ecyrEc..WVjrSk2kXc7RZ7dR9OtTsjtOjKOOFQ7dDwaQYRxTI+G.....7aVG9k6CTdODR9OfySqCiUB..fKYWGaljcUS1ttLg9VE6uhSz1qUEHdA.3PR1ox6RqNdoMdOI+2vzmw7eoXIW2rztOjKK2E62N6sBbLj7e.....vuYc3WtOP48PH4+.NOsNLVI...tjUMQWyYB28Xb3DN8oXyJNwMQD2tcaX7sjlLxvkpO62G9Y+76bRNWKjrS4K215WZ0wKsw6I4+Fl9Ll+KEK45lk18gbY49n78mtTu2C.....lAqC+x8AJuGBI+Gv4o0gwJA..vkrlV4HNlqZX6knHk0cQDOGQ7d3maClKe1uO7y9424j9dsPxN0MCos9kTc7Rb7dR9ugI2w7eIYoV2rDuOjKKWE6dd4GQYRzTI+G.....7aVGKueQs.e97PH4+.NOsNLVI...tjktRW75I19z+5++TQiNhXYNYjgKMe1uO7y9424j9dsv0vtYH0SWR0wKww6I4+FlbGy+kjkZcyR79Pt7bUros3cEp7k7e.....vuYc3WtOP48PH4+.NOsNLVI...tjccraBu9k3zqlDoSN1aJZzQDl.6vRvm86C+re9cNQx+UVR9utYINdOI+2vj6X9ujrTqaVh2GBiMI+G.....7aVG9k6CTdODR9OfySqCiUB...5t2h8+YHVMugyEASfcX98Y+9vO6memSj7ekkj+qaVhi2Sx+wklk38gvXSx+A....LK9g4N........nftJ4q+9rDE...khw6AyO2GB.....THR9O............Nm0mUluUQD2uc6eOY+eLNLwVA....XxI4+.......Nm7QxqSsMmZ++Hh3lQL9tM1LAASm3fut86ceDw0crrtJ1MIDeKNbRHdaFw0Mw9my2k79W2PbWcbNU7dejecdWmHliYcPSwRI12qi1aeUMwResmwPDGds79j2udcV00x2ics+56jW8tHhm1VN0O9ut86Oj6itKh34XW8RU79Tj203wpbRKu5s8da62K8dn4JFqTx6CWB0Ck37qTWKFCU2uUUm218v2E6eN2kmuLz6kKYasJMMI7q52eLdl8XzltT80OE0u0iwRTGWh9LZxXOduwdLGSkwHtuJNr9pqpOd2myHlqerdqgsoqwSIGi6oTx9pOlkTcyXde3458fel7Gm6.XFbero8V0y+VU68tI48A.....1y5ne+h0AHGOD65m4kYMR.HOqCiUB..fKYcYxt1zDM8XuFiDInZRA10i4wl7pWEalHwcobdKi3u99UkvXWEGl.HM854X+IBY54dt04mJQElh5fb+YJyYeapt95n41H8QSk+pn60YoILXapRNj5Sr+Sccss1IM4lNV1uchxcrJmJscsJ80qQ2SlxwNFSUh6CWR0Ci44WouVLD2DcqNu5d3SknXUFy6kGqqEoaSNk+wdlzwL1soa5ZxP6qeLaqO00wknOiiI25o1FqvRXLG8o8xXG20SV0iUeUWZxk8Qzs1MoICWSIUSeq+Fyw31lR0WcWsjpaFi6CK08f0K6uDiaxG+Y0eOh3uN2Aw.Uu8xoFqaas69RbXRn9QCaeeR9d.....3Sj0w39K+Efl7PrqelWl0HAf7rNLVI...tj0kI65XLIT6pUwgSV5S858iTdcMoTRe0kIyZ5j+85LOVu1R4N1IczTUGj6OSYN6aZc8UQ6mS8QZ42m1gcIQ8ZZR82k1IcYRzmSY2VauwrbpjlPBc494Ss53L1wXSF66CWZ0Ci042TbsnuxsN+wn6ITxXduboR9ub6GK2qOknMc8ser5qujI+WIqiKQ86oja8TSi2aoLlibauTh3NssWW9CEviMbL5xpy1yI6SSsE5a82XNF2lTx9p6pkTcyPuOrj2Ctpgxtq+Av3R0eJ1TO8OhH98yZjze0uderw5l1+06wtetp5NVxxJ4+.....3B25Xb+k+BPSdH10OyKyZj.PdVGFqD...WxxcxQm61mi1lD8eI1Lwmqup1b01u2SwlI7bSttgx5sXyjasprVs8qa53dpIAa5DQt9JYvWhMS1wa1FmOFMOQb6xDlcH04SYcPtw1Pln0oSXz21985axEkV90qKpVYSpl3pWs8qaZEpos1h0UseOG6ecnpraJQUd5DkYaSF6qq892D6Zm1V6twpbpj1968X+5xpsI854wtNN1wXWMl2GtDqG5y42bcsnKZJYRdMN7d4zUuuzqAGSItWNZXe5plNVk3YRQTl1zomCknu9ziwPetUopiKU8aN5S8zRZLG4rskJtSK2tjTKMM1htzuQ81Zu0x1z25uRNF2onu5tXIV2jabEQ4uGromq0V6M132EQ7OiM0U+yHh+77FN8RW5GK8OJBcIgzaZUBTx+A....vEt0w39K+Efl7PrqelWl0HAf7rNLVI...tjk6jJsOSF7tJcRn9dz+UQvlRJkmhiuBp0zDP7XSZwzs8TSb11RtwSspt02574nNHG8chVWeBe+ZLrUZxlJ+50YGaxYuJZt95TqPO0SNp1zzpJ1UGY6Sm77mJtaqMvXUNUpOg3O0j.NcUKpsi8XGic0PZqeNTOzmyu45ZwozVees4pn8UusioD2KGYFCGa+J0yjhnLsoSOGJQe8oGig9bqRUGWp52bja8zRaLGccaKcbmV1GS8D2pd6lisBWGwg8yzV+cCo9qDs0mp9p6hkVcSehqo3dv1VIU439aw90WuDmWqBfoOatIoOKpKqXoQbXh7J4+.....3B25vu7Qfx6gX+eo8.btXcXrR...bIK2IuYolrmoSlztrZAbLOF8ahDlyDPLmI9ak1VorNl9VmOG0A4XnSz5WixkXWc45RkzI65XsBnjNgrOV7jFC8sdYrJmHN7d5Sk3No2azV83XFi4nus0OWpG5y42bcs3TRu2oKqHmMsZIMVOiKm6kiADCME+mZx22mmIUp1zQz74vX1WeSGigruknNtj0u4H25ok1XN551V53N89+ic8r909zU5tbRHq1ZSNj5uOhweLtKo9pWZ0M8Itlh6AupgXpKqLkW59iQysadH1rx.tzcp1GqR1lbVEZusCkO.....bAYcLt+xeAnIOD65m4kYMR.HOqCiUB..fKY4N4YG6IaakzIDaWWs.ZR5DP7i3zqzRUZZRs119ltccYRKGwgSN2Sse8oNetpCxwPln0uejXpORK+bRdhlpuFRhqVIcxvdr1IoSb69ZrJmH1ekqpqSj2z6MZJIIFyXLG8ss94R8PeN+lqqEGyP56KsderNmx4d4X.wP5900DxH2mIUp1zQb34vX2WeSGigruknNtj0u4Hm5ok3XN5x1NEwcNqPp0Wc3tI1OAqeri62wVk.GR82XOF2kVe0Ko5l9DWS08fQroMcU+TOGKmD+eo6WiCqm+X62+OMWAUGUOda54R4zOWpz1tR9O....fIyOL2A........mYtM1ehi90HhedfkWc+bDw25399sFN1cMQD6ZL+KIe8XmXCQLe0ASkbNe5i+RFa62hH9oju2XTekS6jz5hblzsknbtN1Od668FMkDkiULNE9rWOrDhgTCouug7bmiYJ5yuKG2ttcGK9JYa5lT595GpwtNdpqeGKmqi4XJh6zsosDy7pX+qa+RrY7vmZ+VkrekperwdLtKw9p6qkv3+mx6A+oHh+6QD+2hH92hH9dGONW596s78+eIh3+i37HI.aSZBf10mMFg1O.....Ph0w39W9M.ZxCwt9YdYViD.xy5vXk...3RVtqbFi8JsQDaV4b56pEPWJu6xb+SW8BZaEHnu0EMs5bbL843rzqCxceS21wNw.56pkRkzU1qwZUqnq0QoWuptOJ2UikwpbtOoLxY+yc0EouwXt5Sa8yo5g9b9MWWKNlg12WIdFWtkaeigo3YRkrMc51Th95a5XLE6aWqiKc8aNx4bcINlitrsSUb2kUI05W6qJmqS1ulFaR53ON14vTzOTWaquz5qdIU2zmi0T0Vl96eIN75YSu90X4kDfmpswPWIn01C.....9Mqiw8W9K.M4gXW+LuLqQB.4YcXrR...bIqTSB0bjNgAG5JVyPKuzIa8asrcCotnzSx3O60AicxEMz10Wkr+umw9dSrYR++br4516MDOcItRulWEG2G4kLiiQ4TuLZqsSa5R6tw5bsuwUetOboWOz26AliqE4DO4122P5KXrtWtuwvTzeboaSW595a5Xrj12RW+12xK2m+rDFyQt02kLtSSpylVE+dt16W+OBFu2x2uRZRecr6Ylh9g559Nm8UOzxaJ6CoO8MWx1xLL+Zz93BRe8qwlj.72M8g4ApGWR9O.....nnVGi6u7W.ZxCwt9YdYViD.xy5vXk...3RVolDpkLFlhxqKkwTM4e6ywQcP4hkwnLVEalD+GK4fZ50oJyWOx99TzsjwZLJmis+49pjmq4nOsQNmpG568.yw0hiYn2Km69Wh6k664vTzeboaSOzqecwTTO028sz0uic71mscHkwXGSSUbmlXUoIwW5JBW8D2pdx88bCk8am38yMV6y11m8cn08mqs2yce651OUskGp0Mbb753u9mQD+0Hhee101im5wij+C.....Jp0Q4+EUBvCwt9YdYViD.xy5vXk...3RVolDpkLFlhxqKkwPNN4ru843nNnbwxPKiai1STn2iMS50pW8ItRWggRe0zJGzXWNi4jddJNW6hw39vkb8vPuGXJuVbLC87Hm8uT2K22yggbt208szsoG50utXJpm569NU8YLVwae11gTFicLMUwcD6mjdoI2xc0duzUbs5u2Gw9qreoq5v2MRwZtaae12gV2et1dO28su8M2GSQ+uqa333U2e8RLOqDf0iglRNuzUfzgr5SK4+.....3B25n7+hJA3gX+e46.btXcXrR...bIqTSB0RFCSQ40kxXHGmb129bbTGTtXYHkQ5j3uZRtdWr+D5enw0UwljspdxFT+0iEtbFqI4bZRPTxy0SYLtObIWOLF2CLUWKNlgddz08uj2K22ygon+3R2ldLZGdJSQ8Te22orOiwHd6y1NjxXriooJti3vjios26oj2KcUA71ZuWZRWepDtYptlNE08iceEKo5l9r8SYa4gXcCGGuN8qeMh3OGySh+EIwRSImWZeQmJQjqKsONI+G.....W3VGk+WTI.OD65m4kYMR.HOqCiUB..fKYkZRnlizDE45Yt7tNY+esksaH0E4ru843nNnbwRSRquZZhqtJNbUBaLWkdZycQyIi0MErblqIw6Xct1j9bs3bpdXruGqjWKNlz6wFxpOSa0Ck9d49dsXJ5OtzsoKce8C8XT58ct5y3TwxoNWWhi4nKa6TE2QrIo8Zquv58mb6g6Z7Zs2udxA9bGO1Ulh9g559NE8UWpxaJ6Coqa+T1VdH9cwlOOpK0W+eGGdM8XudY69M2N0ylRa+7bFkc5eLEl6m8A.....yr0Q4+fh.3gX+eY7.btXcXrR...bIqTSB0b7kjx79AVd0mLzeD4s5CDwgSBw1l.iS0j+sOGm4pNHmIu8TMQqG6XoIco9JcUwnKsyGqy6Uw9IOPtSL2bKm5ay6833LDi04Zp9bs3bpdnD2iUpqEGS5ySZJQZZS5pOSa0Ck9d49dsXJdlToaSW595G5wnz66b1mQpbNWWhi6pKa6TE2MESU8aTOoYZ6Zd89bpupNVOA5VJ8C008cJ5qNGKo5l9r8ScaYx2uON75Yau9aa29kh5wVaImWZBn10+XOjNNQI+G....vj4Gl6........fyL+RxWOzUFpuNvxKcBHmFemClp5fziSWS9ugt5NVZ4LIzi3v52z5klJyeJyiwP78Hh+8juWetOqqkS8y+UQ9qnOCwXctNFtzqGliXXH88009kly6kmayYa5KAmq0umqi6Zpi6etgi0Ms79sseWU60pNruKUSQe0WRNWuG7RxerCay+yHh+WiH9SQD+ZIClB3uj70OG62GUSdJb+L.....jXcT9+JQBvCwt9YdYViD.xy5vXk...3RVoVAJxwUMTtCIAQZp755DKr9JvR0q1l3hS0J+QeNNSUcP5JMxic7X7TCGiioDs6NV4+TF6aS00MkvF4dNzz0ggZrJuSUNoqfLcscwXZIT2cNUOTx6wxsrO0jE+XtI4X8dFkWW6Wpz2K22qESwyjJca5R2W+POFkdeWB8YTImy0k33t5x1NUwck5qfeUqxe0WA7N1e3Apu5XcWreak2Nx9U2TzOTW22onu5brjpa5y1O0skIe+i3v54pW+8XYsR+kpdrdrUluzUzy2iM8Uk1d5ljss9OOoU9O.....tvsNJ+GTD.OD65m4kYMR.HOqCiUB..fKYkZRnlqllrfCYhmllTZcYhDtJ1exU+Qb7j.apl7uukrsccx7NE0A2G4ecKM4FJ8DstKZJd55p+WZa21puRK+SshNkd8anm2qRJqWKX4rJ1zVnOsaGCi04Zc849vyo5g91OyXDC2EatO58irM4H8boKIPUSI+Pa2yU56k660ho3YRktMco6qOhg0Vuz0wyceF0k645RabWccamh3tRZBZU+qe+H6WDa5Gq9wp9W20jDsD0eCYeKce04XoU2zmsepZKe01s4Kwlmeyo8uDM2t8eDa974V55Z6plZOUe+pOVupW2E6+ySJ4+.....3B25n7ePQ.7PrqelWl0HAf7rNLVI...tjUxIgZNZZx79dzsU.vlR1rqhCmbgO0x1VUFoqjHmJQ1lpI+aWStrTSQcPSqzHudj8IMYAmhIZcWzT7bp1eMUe8Qzdh.kNYXu+HkctIH4MQdq3PsMI6Gqxoos68n6IT4wLlwXN568gmK0C847arhgzi8wt2nKtMo7NUYdcbXekG6dtRdubD8us1T8LoR0lN23nu5a8aDSScbIqeyQtmqKswc00scJh65p2+Q8q0mpcX8wI+Zre63RjfvSQa8R2WcNVZ0M8Y6mh1xMkfxC8Y1WB9qw90Y+yHh+7rFQ4odrepjyaUz7ezCReU+YaR9O.....32rNJ+GTD.OD65m4kYMR.HOqCiUB..fKYkbRnlq1RRhm19d0Sppq298dNZeRB1T48VRYc01uNc0G4i3zId3TM4eaJg4dZa7cSbXcScktNHhlS.t2hMI4ysaKi6i8mv6Uu+TLQq6hllPp0qqqm3EGq95Xq.JMcs3wX+qc2F6Og9Smf0soZR1VEq0m31WGcOIEGqxIs7RmzvM0l8lsGyGiM0ssUticL1UC49vyg5g9b9MVwPIV0AapN+43v6kuO1eEGrK80Tx6kin+s0lpmIEQYZS2m3nOFx8xSUcbopeKU7VYIMtqb11oXrRUpO1m58KzkD7r9wtZeeKiicop+Fx9Vx9pKULOk80l61W51xM0+YNsAuT8qwt5q+dDwuaVil7k9rnt35XS+c0GKzawl6uS+4kp2tZLVstA....fyXqix+AEAvCwt9YdYViD.xy5vXk...3RVomDp4psD.7TuFyxqqq3fS0j+soUYizW8YkmZLpCphullH1GqruNNbBDeLktcWZ42zpQyodcrD+qRN0SOFcKAIWMRw5XUNokYSI.1RJF6pgbe34P8PtmeiULjt5gNVIQPe6WJ862lRbub8XuOs05Zr2jb22wtM8XbNzUC4d4opNtT0ukJdqaoLtqbi+ROVoJ2zR4zEM0lnTqbkSYa8R1WcIh4oru19brJYa41VAuocqiM0Q+yHh+zrFI...FOEfX...H.jDQAQE...mAVG9kOBTdOD65m4kYMR.HOqCiUB..fKYSwjPMWWG6uJAzkWGakhJmx6on6qZNS4j+8533IqvwR9up8uD0AU55j294X2pC1RN4+hXScVSqJJoudKxKQIO00g2icIuQZcTSWW5ZbVU1ss5BMVkSStKNcx1zk1zkLF6hgde3RudHmyuwJFRSz1SUGliUwgIcWSudM18Ljt1WSItWtt9zVqqwdS569NVsoGZbjq9du7TWGO10ukNdqrDF2Ueh+ROVoJoWS6ZB70zeXBx44bkt9qu6aI6qtDw7TV2z2iUoZKmlv94z98R0eKh3eDQ76m2v......37v5XZ9fh.tr8PrqelWl0HAf7rNLVI...tjMUSB09nZ0g6Kw9IYxqa+dOEalX7ccBqdSrYxEWexv911u99LJmJS4j+MhMwWaweWS9rwtNH0cwlqKUIB36aK6GiCSPyzUljik.mktc2wJ+zyop1fOE8O4xtK1jHj0S.fpqAqpscoILzwtNe61XJcxd+11iUWWMnFqxImxt5d5G2V9qZq.lfX7TFi6CWx0C4d9MzXHMgOFZePMo5bp98vsEeoWONkRbubZb20qES8yjparZSOkiwnO2KOW0wiU8aNFiqEy43tFR7W5wJ8bRrkyXIp2WSWWw.qLU0e8ceKYe0mxRstYn2GVh1x2E694xp+G0CZ1eMh32M2AA.....v4h0wz8AEAb45gXW+LuLqQB.4YcXrR....bYaJS3DfcpmjGeYlikUw98CL2wC.bH8UC.....vf8Cyc..........vB2pX+U7yeZtBjsRWs295rDE.vwnuZ......FLI+G.........G2s09+eKh3mmq.YKITB.Ke5qF.....fASx+A........vwUeU+6uLaQwFWGQbWsu96w7mLh.v9zWM......iBI+G.........GW0J+22hH9oQtruJNb0gpM2DQ7kju2bmLh.bIPe0.......+l0QDeT6E.kvCwt9YdYViD.xy5vXk....3x1Gge1XXJsJ1jHGqJT4+Xr4d4219+uM1ekFb01u2Swg2+mlbI.PYnuZ......fey5vGZOP48PH4+.NOsNLVI....trI4+fOWdKN795t754nbIjH.rO8UC.....vr3Gl6..........fKX+bDw2yX6+VDw+QDw+Vl6G.ze5qF.....fYwON2A..........Wv9O1951Hhq29Z01+MhH9ZrIwQ951W+7LDi.boSe0.......+l0QDeT6E.kvCwt9YdYViD.xy5vXk..............3SteXtC...................1mj+C.................XgQx+A.................rvH4+..................VXj7e..................KLR9O.................fEFI+G.................vBij+C.................XgQx+A............v35wHh2iHdKh35YNV....3Lkj+C............fwycQD2GQrJh3pHhmm2vA...fyU+3bG..............810QD2r8++Wly.geypju9pYIJ1P6C....XjsNh3iZu.nDdH10OyKyZj.PdVGFqD.........QDw6wtO6zuLywB6bUr+0lGmo3P6C...fybV4+............fySoqvbrL7sHh+0HhaiH9dDwOMSwg1G....m4j7e.............Lt9VDweYtCB....Nu8Cyc...................v9j7e..................KLR9O............9L4pHh6iHdNh3sHhO1958HhuDQ7XDwMcnbtqkx34su2orp198Qxw7pHhmhHds16+ksw8pSTt0Ky5tI48ZZaZxXeddcRY+kLhkiUt2j7d2usreuGwbatM1bcodLW0t49Xy0stpdr+kFd+yk1G.....IVG9gqAJuGhc8y7xrFI.jm0gwJA........bnpDlpoDbpoWskDUWG6mzUs850X+DcqIMkbWOdhx88STtc876Telpk97roqE4pox89XWB+01q25PLW2Mw9I+3wd8Xb5DvKM1aJ4+Z67aoz9....fEfebtC.............XftI1rpuklTVeOh3qa++qhcIM0Ou88RccrIQspWNes11dcs2qZa+WiH9VGiymhSuxzsZa49GpE608K09+0Ws3petdJk977wXXq.esIs9qJluJ1eU46pXSRK9Gh8quZxcaK2TU6W85hH1j7g2rsrapMzPrTZe.....bDqC+k0An7dHrx+AbdZcXrR.........6bcb3pY1yQyqNZqhMIW0sM7dWE6uhx8ZrexSUIckmqsU0sngXp5++Ts3qJlRW44d8HkaSk+whi5J8448Ie8Sa+d22w3qsxs9JI3yw9I6WD6RRwzUIuisJ8cWCaeSw4MwgqRhmp9N2U9ukR6C....fSXcXBsCTdODR9OfySqCiUB........XiUw9In1GQ+Ww4pm3XuFGOowtsiGyzjR7Xa6p3vD7pojTrsxuqI2UoOOqNGdMNLA8xUS0emJIBqmjfUIRWSRSBx2ilSXzJqhCS.viEK4l7eKk1G.....mv5vDZGn7dHj7e.mmVGFqD........vFOF4kXXs4ljx4XIAVk5IQ2ysrM4l3ZoqDcOdhsO2j6ZpNOO0JtWWkVtc4broDBsojPLMIAOUhz0TYeryy9j7eyc6C....fNXcXBsCTdODR9OfySqCiUB........3vDw5sATVOWqbZKA2Rktp30TRfklbWmZkvaUjWBakaxcMUmm8MILOU41kjUL1d7OV7jVO+ZFwTZY2kUCwtl7eyc6C....VX9g4N.............fd3lX+DQ6mFPYUeUe6W53970ju9TIl1WiH91I1lumTtcMY25po37LhgcsnMeqgXoqG+zXNcU9Km38mOQY2WKg1G....rvH4+............3bT5pjVWSlsT2zyxIMQsNUhX88NVt02tlVk85qo577qQ2OWywoRLt59dx1m1VIsdsqIUXUbT+76TqVec0b29....fEHI+G............miRSBsbRfq5RSdq2hH9niuNmLUmmkHw+5i5I+WZakzDgL21N029zxB....FMR9O............NGMVq5YWJqdZWJmm....vmF+3bG.............vBxuzy86amdSVTtTNOinrqFgKkU5P....9DRx+A...........v4nuFQbSsu95seug5OLBkw4fO6mmWW6+m1tXnscNVYC....ileXtC.............nGRWw0tows5zRSdq9VNKcWJmmQDwUQDqp80oqVgCosy0Iksj+C...fhQx+A...........v4neI4quqmkykRRwcteddSreR2cL2l70om6+7I19gT1....vnQx+A...........v4nuF6m3UWEQbeOJmuG6mLX2ssrN2bpDi6yv4YWRvyUw9sCROuiXyJAX8jG85naI.3UIwv2ZnrWp5ZhSB....bBqiH9n1K.JgGhc8y7xrFI.jm0gwJA........rwMw9e9geD8aE.LsbdMFmDiqdY9kNtOeI59mIZ51dpXdIcdla410quOkr8skPno0EuGaRBv1rJ1Te00XoK0IKs1G.....cv5vDZGn7dHj7e.mmVGFqD........vNoI60Ga+dMkHWqhMIrUSID1iwgIC18Q6IL0pXypE2wVsAKcxckFyoIyWSw9R47rKZJ4+pRnuzUxtqiCq6d8Dk+8Qy0Eok8sQDukrsOkQrOWI+WeZe.....bBqCSncfx6gPx+AbdZcXrR.........6qoD.rJYt9x1W0Sdq1Rzp1Jm2pUNeYa41kO2xRmbWW0R7dpDTaIbd1Eoka5Ju2qwgWaq+doIwWSZqtns5ftj3eME68caRMEsO.....Nh0gIzNP48PH4+.NOsNLVI........fCcWzbhZ01q1zzp71od0zpLXjrMkH4thXy4caw0wNly84YWjVtqhHdtCw4yQ2R7uJ2FcqsS0JCXeh89tMolp1G....r.7iyc..............ifeZ6q6hMIoV0qJ+RDw2iH9ZDwOejx4m2951HhahMqdZ2T68+VsWeca49sQ4Lne9osG+6hMwYURuUEas4b67LhMW+92hMw4sw9Wi+kX201ulY49ya2+50EUk6WiMm2+x1s668O7mE8s8A....PKVGVMa.JuGBq7e.mmVGFqD.........WBrJ0A...vEseXtC...................1mj+C.................XgQx+A.................rvH4+..................VXj7e..................KLR9O.................fEFI+G.................vByON2A..............M3+1bG.....vbxJ+G.................vBij+C.................XgQx+A.................rvH4+..................VXj7e..................KLR9O.................fEFI+G.................vBij+C.................XgQx+A.................rvH4+..................VXj7e..................KLR9O.................fEFI+G.............C2iQDuGQ7VDw0ybr....vm.R9O.............Fl6hHtOhXUDwUQDOOugC....eF7iyc..............LXWGQby1++eYNCjKTqR95qlkn....fOUrx+A............m2dOh30HhGicI.HSqeNh3609ZIfI....ClU9O............37V5pNGSuuEQ7uFQbarII.+o4Mb....3y.I+G.............C22Bq3e....Lh9g4N...................XeR9O.................fEFI+G............elbUDw8QDOGQ7VDwGae8dDwWhHdLh3lNTN2FQ7z18IsLte6woKVUa++H4Xe01iwq0d+pxe0IJ25kYc2j7dMsMMYrNeSisuzw8o9wss3Mst75Zu2cIkQecSroMR8x5sna0CG67N87KmWcoN7tn417Ou88.....FIqi79kt.Pe7PrqelWl0HAf7rNLVI........fCUkHccMgpZK45tI1OApN1qGOR4TWSI+2imnreO1O41NVY1kWsozmuiYx+kV1U0kMccOWqhMIJWWpGZKA.mij+65X+jGssWuFGu8D....KP+3bG.............v.cSrIwsRSLsuGQ70s++Uwtje5m29dotK1jHYo9ks+60IGi62dr+CsTds4o3zqFaqhMI80eH1cNzTLEw9qlf0OmOko57sjdLFmU1tuDGlbbU0CWE6R3uus8Ut550jHNrd+WNx18kjs8qwtqM0Kmps8eM5W7C....r05vpYCP48PXk+C37z5vXk.........1453vU4rmilWkyVEaRTraa38tKoLdO1jraotINbkV6TqtcowV0++oZwYUrktJ785IJ6zxuqqzdS04aIW4+tO4qeZ62qoyiiIst393vDI8pNT1847NUZ641JmqhMWyp2N4lF1t6S1t9FW.....asNLg1AJuGBI+Gv4o0gwJA........rwpX+Da5ineqBboIR06QyIOX8iaZBw00jB6Tw4p3vD.rojUrsxuKI20Td9Vxj+qpd50X2JyWeT+baHIG2PS9uzq8uGsedUu9503vjUrtaShswXkRD....tXsNLg1AJu++Yu6niZbj11Fv20TSB3TfTfM.7AdCA9BAdCA1C4PlPfIDXBAlCl..BAHDfPX9OP1+H2HYIYKgkgqqpbsXSqVOpaAq2EeWOWGg+C3zzx38JA........T4lz+.osK2VLOcE1tj2G7vWR6AvpL3ecUmkchta5X7CMzYejWuSY3+5pN5qw3dnx4YeB+W4ZPa6KqJF2tBtYSy8c6QsA....r1x3CzNvz65H7e.mlVFuWI........f2GFsmNf4o9eCxGFvwdUww1VGUqLvZc0k5JqotBR1PF6G806TG9uCIrdMMmGqN+W4Z6s6Xr2Uab8MHekc+uCMvj....7A3aG6B.............1Cqx1AX5m647T1c0Fx77qhm2mNv1iI44NFyqqG2Pl295i95cpsu660U+5ZUpBd2GY33Vks6tiOmj+aGiu9d3u6443whmOG16....nCB+G............mhJ6dd8MDTkJC4UYHo1kmSUP81nqN5WJFeeG2XFDsO5q2ozio+qm6xOJd9kopSRdSl9qwE48c4u+uz900phm2266KCbpv+A...bBP3+............3TTY3kFRH1pqLLUCcdpO9x4ZN5yz06XD7ujpqo+WwqsHIWkpP.deltq0ay1AL7+xt2SJCi3SI4u87A....mXD9O............NEMlcCO3mI4eRycRuUoJ.f2kw89tKSxE0d9uy66BgkbeO...vWHe+XW.............vmDiUmn6Twmsq2GSx+lptJ4lf4UOrcWjpNu2+LBmqyRxM0d9q48cev9novJ1GOumGG....efD9O............NE8Xp5Haab95W6iddNuXtl69pc8tOdLUAw6+RUH.uJuEBvyW+7t5PecorKB9+x9EHu+8.qC....lw91wt.............f8PYWmaUiiZZmmyy1A35THLbeDWu0OGKZYLmBdMUg76ey1WSWbfy6UY6PT9ij7qddrkq46688....bBP3+............3TzuKd9k647TF5pgDrqxwdJD9uOhq25udYfAaxhLuCw1iI4m0d94sMvdXURtoXtGRWDT3+....9BQ3+............3TziY6fPcVp5nZC0yY6fDdd5Wf3NKaG3vmS+6daSotBZ2Gw06yEOuq4eeCt4GoxNl39XQRts309eCbteMauteYp1a.....9frLI+s1C.lBWm298L+4nVI.LLKi2qD........PkUY6+9g+M6WPxJmmWxt6taKRxCC37Veb22yZ59z++1nkisqvfM0WuWTL1mR6gR7x798vcc8tOqkcoq.Slr80eam2tps6JFy9DV0j2u+8PD.P....3Cyx3CzNvz65H7e.mlVFuWI........f2badevwtMMGlsEoJrYME5pqJliWV+ZkAC6hTElsxy2tL0g+6lr6vf0Tvvlxq2zvw7T1tC.dd1duqLXbsYJB+2So86YNqgZqsfOtqZqb8tOqg6R4d9l8u1BA3hTs9uuAND....XskwGncfo20Q3+.NMsLduR.........aqo..tIPT2u9Q8vn0VnwZad1LGuzv2qOg3ZpC+2YsT2cUiS00aRyckwcUekiuMic3+NuXNa6dl9bNaabmm2uV9PsySedzj11+dp3XKO2.....Gfkw+g1.Suqiv+AbZZY7dk.........duKSygUqsGs4hdNOa5zZ8wTG9ujpq+1p0ccNmhq250TWy8MqG6wJ7e6ZcqoZsryH1mZqrq+sOOZSSclwtdzTGND....nmVFef1AldWGg+C3zzx38JA........ztKSUGQ6g79vXcWpBh0YcLGKVOO2ULOOr90tL6NDXk9HB+WRU.5tKaG3tGR2g1arudq6rTEZtx48lr89PY3+Z67M1g+aSMdUd+0+lNnWetmYW01TF9uMtHU22WdeylqgaS09XetN.....1gkwGncfo20Q3+.NMsLduR..............7I22N1E...................aS3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+.............9r5u0db+QtV....fAQ3+.............NVtIIujjmRx4G4ZA....lUD9O............figKSxUIYQRNKI2cbKG....Xd46G6B.............XucdRVs9q+wwrP1CKJd9YGkp.....loz4+............fSSujjGRxM4s..dJ4WI40ZO+TK7h....vjRm+C............NMU147N07bR9mjbQpBA3OOtkC....LuH7e.............GKOGc7O....nQe6XW...................rMg+C.................XlQ3+............3yjyRxUI4tj7TR965Gujj6SxMIYUOlmKaYNta82qKKpcb+s3bdVRtMIOT66e+55dQGya84rtUEeulFSYMcdsu2kqqglNtRWrt9qO9MquWs95qupWO22yiYw5yy8qOu0O9aF34G....fAYYZ++4K.LVtNu86Y9yQsR.XXVFuWI........f2aSf5ZJ.bM8nsP1cd1NTds83grc34ZRSg+6lNl2W5Xd660Wa+MUaplZZcqIqx1ggbWOtIcGjwx5oOg+6prcf+104eele....X136G6B.............NPqRUG4qLrYuljGW+0Kxagp6Wq+dkNOUADq977Xswddsu2lw9OI44dVm2lt6ZfKVOu+asZuteW6qq2MAqesND2ziZJqGys6ndpu1jTERuUo55no058Qaqeapgyxac8u9zEEA....XvVFcyFfo20Qm+C3zzx38JA........7lyy665a2kl6ddKRU3wtngu2YY6NJ2CY6v0sQYmmaWcStxZZyWeas5aSMU1Q8dXGyaSyee6pc0OlqJd9sqesqJNlKKF2KMLljp0qxtlXW0UeGaYGSbSMTFvuyVOOM0M.04+.....NXKiOP6.Suqiv+AbZZY7dk.........prHaGDu+l90E6ZR8.i8P1cWi6hddNaJ.ZsM1E48A.roPJ117uOg+ay46g7VGyqTYnHeIMGrxMVj2G.vlBJ3PtFVULttpgjpfLJ7e.....itkwGncfo20Q3+.NMsLduR.........UJ6Fb6JjY6RY3x5JXYIaGVv6ZYLkgOqq5qrC6cSGi+PC+2lfzsqfNVFhttBjXx6Ck4tNG84Z3tL7ZH48c.Pg+C....3fsL9.sCL8tNB+Gvookw6UB........38AL6oCXtpGtr1BxWoxt+WSgaqLncs0c81XQFVX0Fiv+sq.IVVOOzyyQVOuCs6H1z0vgTCk6QB+G....mT91wt.............f8vprcf694ALW06jb+tmGyiEOuqtE3iI44NFyqEyae5.gGpcstU1g8FxZ7uJd99dsTVCky6tz28R....XVR3+............3TTYWzaeC50p8bdJCxWWga60dNu0GWScSvwziY20U44uLvi6xyEycWc8v9VCCYetuq4....vrjv+A...........vonxv1MjfoUWYnzdJI+smON00U33JCF4PWiqO9x4puNzZ.....NYI7e............bJZr5JdSc20C....f8x2O1E.............Li76873ddTqhOe5pKCB....TP3+............3TziIYUsme95W6P8uivb7YwgtFedwbsOJCU4YM7Z....vmRe6XW.............vdnrSxspwQ0sxPosuyymQGxZ74IYQsmOVg+aH0vhtGB....LeI7e............bJ52EO+x8bdD9u18qhmew.N1xwtug+qbedH6OCodA...fYGg+C...........fSQOlsCT1YI4p8XddMaGxsKWOWmZlhtb2yY6v2cd5Wf5NKaGFymy6CRXe8X1t6+cQ5e..22.gB....yBB+G............mp9uhmeS1u.e8yZe8hjbWNMB.XYv7lhZ9GEO+10mq1rY8qdXDKmiCsFJm+lzUcB....vdYYR9asG.LEtNu86Y9yQsR.XXVFuWI........f2ba19ug3eS6A+ZQpBGXScHvaJliWVOt1BT2hT0E51U2Fr97ceGWGabe5+eSzxZ9gh5soZeepoqRyqMkAv6hj7Td+dwtz25obc4kTsWVVCqJF6c8b9A....nWVFef1AldWGg+C3zzx38JA........rslB.3l.hc+5G0CkVag.qs44oZyy8qm2972sbpC+2YsTu6J3c6SMkz9ZSaqI8I3eCodVjpvMNjZXSPOE9O....fQyx3CzNvz65H7e.mlVFuWI........f26xzb.zZ6QaZp6000il5xfoXLSQ3+RpttaqtZ5btug+KoZsoOqwa5Lf8wPpmEY6N42tN+Wr9XD9O....NY88icA.............ifet9wkoJLdadrwuSxqI4wj7qcLO+Z8iKRxpT0c8VU66+bsGOtddedTtB1O+b84+xTUmKV+5apswzuVOm0Wa1rF+35532qG2qi74Nqmy+u0myKV+O2r2Te+3msb7KZ40A....n2VFcyFfo20Qm+C3zzx38JA3FOVvC...B.IQTPTA............vmbe6XW...................rMg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+.............NkcSRdIIOkjy+Dd9.....lQVlj+V6A.Sgqya+dl+bTqD.Flkw6UB.........pbY19ug7SexNe....7E12O1E.............vmRmmjUq+5eLQmiEEO+rI57bHmuOh0A....fOHKitYCvz65ny+AbZZY7dk.........Xt6k71eW26mvyyYEmqalvy09b99nVG....3SHc9O............fwVYGxap7bR9mjbQRdMI+blc99nVG....3SHg+C............3T1yI4GehOe....7E02N1E...................aS3+..................lYD9O............9L4xjbWRdJI+c8iWV+ZWtmy4YI4pVl26SxMIY0G37jb3WmKpcb+s37dVRtMIOT66e+5ZewNly5yWcqJ9dMMlx547ZeuKWe9a53JOu2ui5qz9tez04aeVGdHse8uKkqaOzyiC....XOsLs+e7O.ikqya+dl+bTqD.Flkw6UB........38NOuO.UM83gz+fUsIDbcMmadzVv3Fq4YruNaJ7e2zw79xNl29d80mP7sodZZcaWGWeB+2gteLjv+020gKKdsa5w0QSG29FvU....lg99wt.............fCz4oJDV0Co0iI40Ze+EEi8eRxy6XNWkpNBWYvudc8bm0euMAg6W0NeSw7Tu1Gyqy5tMcGdrEqm2+MuU+a76Zec8Nl2qML193ldTOC0Xtezl8Yc3Wo55cSccYR9udbtJ6Lg+pOEH....v9aYzMa.ldWGc9OfSSKi2qD........vaNKUcit5c7tx.QkjbUw31UGh6779ty1co4Nd2hTETqKlv4IYZtNKqqMe8s0pwM00SEi+gcLukyce5FekGyUEO+10u1UGv4Zr1OFx01PFaY2Hrs6EpWikqQ.....SrkwGncfo20Q3+.NMsLduR.........u49rcfzJ6na0cQ19u2XScUtEY6vy0135xXMOaL1WmoXLcM1E48A.bWgS6PC+2ly0CoJ3i883Z6bMl6GSU3+JCm3ccL9KKFeSgAE....XjsL9.sCL8tNB+Gvookw6UB........nxpr8e+vl5fakpGhtlBW0MEyYScZt9Xrlmjo45LEyYepwxvlcyNF6gF9u+lpv5sqPNNjy0XteLUg+KoJri0Olcc8WeO9odL2.....ifkwGncfo20Q3+.NMsLduR.........UtK8uKosQYWwqd3pJ6Nb6afpFq4Yiw95bixv10UG1aQw32UX1Fiv+02.5004Zr2Olxv+UFvx1VCNqmiC...fSXe6XW.............vd5hZe8u64w7Xwyq2E8VksCI2O2mhZDmmMF6qy1F+ycLlWKl29zABODG551Fi89wT5WoZcdiKZYbku9ullxA...fiIg+C...........fSQqJddeCEWY.2pGfsxNeWemyRi07jLMWmM40N99MMtl5lfikGS+qotLl6GSsWy1gS77zbGYrLPncEbS....NAI7e............bJpLPTOkj+1yGsoLfbkcOu9Zrlmjo457TvXE7ujwc+3iPYmI7xhmeV19ZRW+C...3SJg+C...........fSQSQWmarlywr1lxtq2WEmZqgOms6NgWT78q+7xNEH....eh78icA.............ife28PZzyiZUL89pbc9U2uRxp0e8YoJvea5veWTLN....9jR3+............3yf+cDliGyaAtJI470u1wZdZxXbc9UyTteLU9YRtIu00BWkpf9cVpp+5iC...fOo91wt.............f8PY3sV03nFlWGo4brlmjo457qlwb+3iT8f8cQw+Lo5di4dHFA...3.H7e............bJZJBE2uKd9kG44IQ3+FCi49wGo5g+aQpB9W8t92u9XKG....9nI7e............bJ50rc3mtLImcfyYYmT6rjb0QbdRllqyOZKNxm+wb+3PLz0gmy1AWbU1ty+8y.....7gaYR9asG.LEtNu86Y9yQsR.XXVFuWI........fJqx1+8CeHGdv3Jmy+l8qSwMVySSy0Xbclh479ddL2m982rsbb8od2m5ouG2XteLj5beVGp6x7959uI41ANO.....ijkwGncfo20Q3+.NMsLduR.........u4lr8eCwWRUWcqsPVsHUcOsc042tMMG1pyaY9trk4arlmjo45bJC+WY8VFXwlp6oL7eIi29wPpy8YcnzKMT2q5wwA....LAVFef1AldWGg+C3zzx38JA........rslB00eSxSoJbVadTFhp8YNeo178T5NDXi07LEWmSY3+NqkZcWcttoN7eIiy9wPNe6y5Pox.D9TONF....fIxx3CzNvz65H7e.mlVFuWI........f26hrcns5yil53a0cYZtqq01ioddF6qyoL7eIUW2sUSGZn5Nji6P2O1my2PVGJsp3XtrGGC....vDYY7AZGX5ccD9OfSSKi2qD........P6tHUcSsxPpso63capBO0YCXNub8w8PdevstKIW0y4arlmjw45bpC+WRUv0tKaG1tGR005XTOGxwsu6G6y4aHqCkp2sBeommO....fIxx3CzNvz65H7e.mlVFuWI.........3qgyx1+Mx6SXAA...3ShucrK..............nQ2V6qeMI+7XUH....7wS3+.............X941jrp1y+uTE.P....9hP3+.............Xd41jbYsm+6nq+A...7kiv+A............v7vpj7P1N3eulj+uiS4....vwz2O1E..............7tt8WRUv+920+S....9hQm+C............fiumKd9iI4eV+OA...3KHg+C............fiueu9e9ZR9uTE7ux.AB...vWHe+XW..............PdLI+eI4WG6BA...f4Ac9O.............lGD7O....9+S3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O.................fYFg+C.................XlQ3+..................lYD9O............f4l+V6w8G4ZgOel62eM2quOSrVC..LqI7e..................yLB+G.................vLy2O1E.............7Iz4IY05u9GpClH1egs4mI...9TQ3+............fw0KIYw5u9243E.k4Rcvzv9KrM+LA..vmNe6XW.............vmLK5dHeHlK0ASC6uv17yD...e5H7e..................yLB+G.................vLiv+A.................LyH7e............bpZQR9asGmW66cYRtu12aWtHI2VL9WV+7qRxY8nVpWG0sp36sq5Yw55dSs7RC0xhOf5XiKSxcI4or85xcq+dC0hTcMT+Z6uqe9MoeqyC87MF2erY7i4ZQR006UsLuaVSVUbLyk6y1LO0OW0q0yVO+Ojs2m66b2z4p7dmlV+KWG1my0tLE2GLVNzZ6Tc+bL+cdsUiG507pT8yy0mqmxv92w....yHKy98enA.Cw04seOyeNpUB.Cyx38JA........7llBqxsoeA9XU1NnL65wMY2A9nOyQa0yh0yeeNtWxtCxygTGabd1NjOs83grcf51kqx1A9aWqykWG22yyQSNj6ORll0hMAopu6Q0uuatbeVS0yl02tNGuj9uVkzu6c1r9WF3q9T2849qo39fcYH02XVamh6mGxOSTd7aVquriZruWyKRUfF6ScI.f...bBYY52+wm.bHtNu86Y9yQsR.XXVFuWI........f2TFVk1BpRoKaYb2m22Y5pGHk1B.380dTFRj6a3QckcbqMmqcUKWLA0QRUfVJOe6pVdIcGZk1B51l4rL.lkieLC+Weu+HYZVKV0vwUt+TOHW2Ub7yk6y1nb8sugZrugmpq6cJmyKJds9T28Ibci88Acou02XWamh6mG5uyqrNZ6e2v9bM2TnLa5268TGyC...LyrL86+3S.NDWm298L+4nVI.LLKi2qD........vap+2O7phme65W6phioLbGuzvXRpB+RY3M5SPzF53SpB40lfmzT.CK6VVO0x3Nj53rhywC4st+0tpkcM2kgsayZcYseVde3cF5ZXS1m6O1TOi8Zw448Wa2klCPzhTcuvtBe2b39rxqk5qsatt1bsTFxyG5nVK2uZqaDVulKOG8ot20Z2TbePezm5aJpsS08ylp+9tGT+Xpe9Nzq4x+8Ls868Z62AA...yXKiOP6.Suqiv+AbZZY7dk.........dSSA23gzd2spLvLc08lVj2G.vtBpw9D.k9zovJCOSSAm4Ppi5guaWc4vj22QtZpVVULl9zorZpyfMVg+qO2erwXuVrHuuKr009WWlC2mUtWsqwuHuO7TsEtwyJFWW26zTvJGiv+M12GzW8o9lhZ6Tc+ro5eeB+WetlK+43lBbYx1+6MNzvfB...yLKiOP6.Suqiv+AbZZY7dk.........dSYnMdI6NDLkgKaWcVsMJC7QWmiwJ3ZModXatqiwNj5nLndcERujsCeTS0R8NGVeWqKm2wL7e8YuKYZVKJ6.hiQm9ZNbeV45aWWWkcCsaZYbk+bZaArptxPKdng+aJtOnu5p9lpZ6Tc+biwH7ei007X+y6...vLxx3CzNvz65H7e.mlVFuWI........f2LjfarnXrOLfyy91MzF6PYUOPccU+CoNpOu8MzRkcSr5gp6PVqKm2wL7e8IDNSwZQ8vi9TOmytLGtOqb8sqNKX48EMU28YL8YtOzv+M12GLDcUeSUscptetwXD9ut1y560yT9ym...eg7sicA.............inetiuWYmmaWiszuJdde5zVSgGmnZn9Zyu2iZIY65obstb8aW564eezm87wdsXU1NPQC49tik849rGSxycLlW6wbW1U3568Nulw8dmw99fwzGQs8Ya+rO985y6tzmq4jsuNWkpte39FFT..fuvD9O............9r3wr6faTF7hxvvrKOWL2c0QrNDKRU3dtIUcLpGxacPpalfyWY3b5afaJCFT8PvTtVOjP7zU3a1Wcc+QxzrVTduxGcflZyXeeVe22pOtlBCU450P94zwxTbevX4ip19LseN155ZNI4GEO+xT00OuIS6+9C..fOY99wt.............fQxPC10PCgxi0lix4ZLbVRtJUgD4iTYPTdZDlyCcsdJzmvLMEqEkgr5XuVbrtOqulCqWSw8Aik4bs0j4v94wviI4+kpN92FKR0O6cUpBs4Ox7ILv...yTB+G............b7cY1NjHa76rcGqaUF+fG1Vmq5qnoXsXNs9dLuOqulCqWygZnMy4ZqImZ06X5mo5mqtIu+mm17yX+JUgDbp53o...m3D9O............X3FyfZTFHqmSUGg5msL9oNTV6amn54QsJlG9LsVL2tO6Txb99f4bsQU3+92T0ADuLIWjsCD4EopaN9Oe7kF..vo.g+C...........fuJdLaGnoyW+Z804Ey0XXQp5JT0m2+MG2t.0+NByQYvhNqgW6TvXrVbn22MFli2m0l438Niw8ASk4bskLO2OOFdLUc3u+KUg.7p7VH.Oe8y+wwoz...ly91wt.............fOHkAcZHc1ryy1cqowJ7VWVLu+W93CjU40xXzw2JC2yPlyEcOjIyTrVbH22MVlC2m0Wk26bdiipYi08NSw8Aik4bs0j4v94bxqoJjekgu8hiS4...L2I7e............7UwuJd9PBaQ4XGqv+cVwy+cGieJBCyTDlnxqigLmGyPv7QrVb4HLmC0b39r9pr1568CmkgErrcYNGvt4bs0j4v94bziI4m0d9m4qU..fCfv+A...........vWEOmsChx4oeAQ4rrcfsdNuOHgsoqPTUFJqtlq8MXb6pNdMae8bYFVc0jGy1c7qKR+CozwHbbaLUqE0Cr0YI4pCbNKMWtOaLzz8N8IXTiYMOE2GLVly0VSNV6mmBcMv4Z22D...5vxj72ZO.XJbcd62y7miZk.vvrLduR.........uo9e+v66w3WUbLujcGDkEI4ghioqvocew32Uvbtc.yc4X65uY5Ppix0kG5X78wk48q0cEHmltF6y9Za1m4YJVKJmy9beTWlC2msOquk0cSJu24gr66cZZ88Pq6o39f9pq5appsS08y1pk9rlLUWy8I7g0+2sbH+dN...3C1x3CzNvz65H7e.mlVFuWI........f2rOA23phi6k0uVYXMtHIOUL1a6w7eSwwTFLm5ecSgQrrC4cVRtqXb84uY5PpilF+l0k1BPylND2t5hckgj4kTEDnx05UEis906Gc3+Rll0hlBU2so4vmtHUqS6Z9lC2mMUAmpow8Tde2faQ19mmeYjq6o39f9nO02TTamp6maLzemWxzcM+TZ+mua5m0Nlc7T...XfVFef1AldWGg+C3zzx38JA........7l8MbWMEDqMyw848gNouA+KoJXGMM2sMOkAIYSvXtOaG9vMg6ou+MSGZcjz95xl5os0m1zTmSrq05Mgdae1WKsu2ejL9qE6ZNeo17UeOeW07b39roLrXscuS80+xq29N2Cotmh6C5Requwt1NU2O2Xe9cdSw074Ee+1946w32wA...GAKy38e.H.s4571um4OG0JAfgYY7dk.........dygDfhKRyg7qofYMzN40k6X9JqyEo4fYUFPlyWO15udac4q8oN1noNdXWOZp6VU+5qsNJW457lNA1bH7eIi+ZQR0dRetuqO+cwO12mMEAmZn07eSUGeaHy8Pq6o39fcYH02XVamp6m0Mzem2TbMuqZnoq0xNgJ...LysLC++XE.Fpqya+dl+bTqD.Flkw6UB........3M6SvMpaQpBpwcY6tR0CqesKy9GLiUqmi5A85gzdPB2TGaBxyS0pg5peMuZBpiMtHM28s1zottccs0U.D237TEzk5yWaWi0C+2C8b9axgd+wFi8ZQVO9ay66FZ2mp0jq547cLuOapCK1FqR0ZU8Pt8Pptep9Zz8oe22ru2WLE2GLV02XTamp6mMM+88mIlpq4yVe9J+2srY+nu+7M...LCsL9.sCL8tNB+Gvookw6UB.........f2qdHqNjvdx7f8S..fu791wt...............NPKRU2kbieerJDFE1OA..HB+G.............b56xhmKrXm1reB...yVKyaso7+dbKEfOwtNu86Y9yQsR.XXVFuWI.........fO6VLfwtJa+YI39Ioh3PX+D..f8fN+G.............L2rJIOkjqRx4sLlyRxM48gC6+lv5h8i8S...1Ce+XW...............EVk2BC1F+t1Wedde2j60j7+RxiSaowdv9I...6Ag+C.............NErZGeuempfh87GTsvgy9I...cP3+.............f4l+WR9QpBH14opqwUOrXOlpNC2uSxuhPhM2Y+D..f8fv+A.............yQOmjedrKBFM1OA..Xf91wt...................XaB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.................LyH7e..................yLB+G.................vLiv+A.............k9asG2ejqE...fujD9O............fMtIIujjmRx4G4ZA....9RS3+.............RRtLIWkjEI4rjb2wsb....fu199wt.............fOgNOIqV+0+3DoNVT77yF+xA....nuz4+............fw0KI4gjbSdK3cmB0wuRxq0d9wLzh....vWd57e............v3prC5crLz534j7OI4hTEBveN5UD....PuI7e.............a7bzw+....fYgucrK...................1lv+A.................LyH7e............bpZQR9asGmW66cYRtu12aWtHI2VL9WV+7qRxY8nVpWG0sp36sq5Yw55dSs7RC0xhItNp+8tuiy0Fiw5Wx62OWU66c15ywCE0WeVSFpwXeXy77Qc8rX8wVVu2s9ZYix6CF60tKWeNeJaeuPYc.....mrVlt+exC.Gpqya+dl+bTqD.Flkw6UB........3MMEtpaKd819aKtJaGRoc83lr6fR0m4ns5Yw54uOG2KY2gn5Ppixiuqv+MlqeMc92re10ZyKY6fetuFy8gOxqmqxaA9qsGOrdNKC+Weq8ttW37rcPF6pN....fSVKiOP6.Suqiv+AbZZY7dk.........dSY3pZKXUktrkwce1t6oUFbo1Bv180dTFjq6a3QckcHtMmqcUKWLA0QZXsnMi85WSm+Uo4fbNUA.bL2G9ntdZa9Z6dfKJds9V665dgyy6Wa1051Ko+cCR....X1YY7AZGX5ccD9OfSSKi2qD........vap+2O7phme65W6phioL3ZuzvXRpBqUY2LqqNfVYM0mwmjb25wdYZNfbkc2smZYbGZczmiYJW+pO16x16kaBC2h00PYWG7gtt35gwdeXJudJueustQX8Zt7brK8Ye6rr85wC4sNbXa0vPteD....lcVFef1AldWGg+C3zzx38JA........7l5+8C2DroGR6cVrxvJ0UGVaQde.1ZJnasUS8MjS8oSnUF1qlB50gVGccLS85WScwt1tNWj2Glst5DecYr2GlpqmyJFWW6Cm2RsrK849m5cWvt5rikccvtt+E....lkVFef1AldWGg+C3zzx38JA........7lxvL8R1c.jtM8KbU0sHuOva8sauM1c3r5gC6tNF6TD9uod8qb+rqfVV1EBuoG0yXnu6CS00S49PScauRkgV7PC+2phwrqvGtQ8vB108u....vrzx3CzNvz65H7e.mlVFuWI........f2LjvUsnXrOLfyy91s2F6v+cW5e8O1g+6iX8qb+rqNwWYMM1q2sou6CSw0y9dMWdbGZ3+puFz2f7U18+1UHZA...9x6aG6B.............FQ+bGeuxtT2tFaoeU779zkylBOdDqgO50uGSxycLlWywYMYeNmi00SYW9qbscWy8u64X6i52Oz248whmer94H...fSBe+XW.............vH4wTEvo1T1kwJChzt7754dybzUGb6PrHUA7570OVj4QHo9nW+10dYaiaL6jbi89vXc8Tt1Mj8gwRY.D6a3+JC+34C3XA...9xQ3+............3yhtBWUYfkFZnodr1bTNWigyRxUI4xIXtGCy80uwxbeenL.hGiv+UF.wmNB0....vmdB+G............b7cYRtsgW+2Y6NZ3pLuCN2otSg8gwr6FtulC0....vmdB+G............Lbc0kAGhx.m8bR9QR9YKi+yP3+Fy0uwxWw8gwxu2yi64QsJ....9jQ3+............3qhGy1A1570uVecdwbMFVjjaJl2+MyyvwMGW+FKmR6CkAl6rFdsOZ+6Q97C...7oz2N1E.............7AoLHWCoyscdpBH1FiU30trXd+uLOCbVx7b8arbJsOTFzuyabTMaQ2CoWJ2+zEDA...l.B+G............eU7qhmew.N1xwNVgW6rhm+6NF+XEdq8wbb8arbJsOTVa8ce3rLrfBtKB+G...vG.g+C...........fuJdNaGbpyS+BN0YopyvUedJCBWa5JjXkgNqq4ZHAtaH0QebLV+9n7QsOLFdLa28+tH8KTeiYM+Z1dO7xLr0P....5Ag+C...........fuR9QwyuM6N3TKRxcY6vyUNGkJCH2tBE0yEO+xFGUka5XtNj5nu9HV+NFlx8goPS6C6JfmqRUcOl9Ysudy97wdcA....lbKSxeq8.fov0++Xu6kiZjr0vEne2NZGPtftl.sAnApMANl.sIPOjgzl.kIPYBTCJIzwlcA..f.PRDEDUC.LAvDnLg5NHktJ0V4SgR8.VqHxnJIkZm+6GoZUG36rylOm4mmzJAfwYQ7ck.........1n9O+vmF3641h226qdtxvSccRds3beX.s+8Eummy1ghp9eeYC0xxh1adpBV0ua33PUGqMjwyob7aelOeJCeLoMS07vT1eJOuWyt6teyx1yWuOv1dn0d4Zr0qEZKDfq20DusmqM....b1ZQ7KzNvz6tH7e.WlVDeWI........fM1mvUkTEBslBw0SqNJCI0PC9WRUvmZpsaqcJCw05fb8T1N7bqCV0P+YlN15HY2wh1LUiempv+0T6bHlGlx9yrTEny1p4x14gQz1io1aasP85no0D....vEoEw+.Wfo2cQ3+.tLsH9tR.........arug+KoZGHqoPpUdrNrWiwMczdk04rzbvyJCR0UqN25Oea6vZ6ScjA750MEiemxv+MEyCSc+YH07uS0Nz2Xa6wtVnbWdruiq5oMA...fyRKheg1Ald2Eg+C3xzh36JA........rwGI7eIUgm5lj7X1dWT64UO2MqNm8wxUsQ8.x8bZOHbqqi0gn50Z0Pc06yKOv0wXGOOziemxv+s1gbd3X0eVlpcfu5Av64TE5u5AS7ohWuK6SsecZdGFb8t.3CoZbruPqB....msVD+BsCL8tKB+GvkoEw2UB.........XeTOfl6SXYA...3H5ON0E..............L4lkjqp83ebpJD....FFg+C............fO+to3wB+G...vYNg+C............fKOyFw4tLI2W6w+HIubXKG....NzD9O.............t7rLIuljaSxUsbNySUn+dp34+2Irt....3.4OO0E..............LZKylv8s1Op82uJ6t6.9qj7Owt9G...vEAg+C............fOGV1wq8iTE7u2NR0B....ePB+G.............Wd9mj7eoJveWkpcAv5g+6kTsS+8ij78Hze....WbD9O.............tL8VR91otH....XZ7Gm5B..................fsI7e..................mYD9O.................fyLB+G.................vYFg+C.................3Liv+A.................blQ3+..................NyH7e..................mYD9O.................fyLB+G.................vYFg+C.................3Liv+A............vWO2jjGSxqI42I48j7zpmG...fy.B+G............b969TENqWSxUm3ZgKaWkjmSxCI45jLe0yOKIKW8m....bF3OO0E.............PmtII2t5uOKU6Va+eOckCWvlmpc2u5A76WI4kU+8qRxaG6hB...flI7e............v4sxchs4MdVecbUp1g5RR9uSYgbA5gr85o+M6NFZm+a7rlD...3KjEI420N.XJbW174L+7jVI.LNKhuqD........vWKySx6YyOmz6OskyIU8wgmNw0xkl4Y6ed6OdZKmOMrlD...lL14+............fyaukj+JIWmjekjucZKmSJ6Jc6uqKd72OIUwmOVSB...SFg+C............N+8VR9uScQvmJB+G...vYt+3TW..............vja4ot.....XbD9O.................fyLB+G............WplkjeW6XYwqcaRdJIuu50eOIOlja1iqyMI4gFZumVcclsG06U0dsaV0VqesR0eeOMf1t9Xw0opeuttecUeYdK047Uu9y0Zumyv6mM4lU0vq0ZygNeTueU2xhWqswtCUcj7wlC2GWmMq6pWuqW201b3Z2llWSjr63VSqqFq4qtlMMF+TRtug5nIez98ZcceQSqyG58yGx0jGp9ZYcMz4y5W21p0i85d...fyZKxv+G8Av95tr4yY94IsR.XbVDeWI........fMZJXO2lMAcqsiWy1AXoIyRUXk5pcpGVmgDdrlp2GZn85580VndJa6YoJDVcU2k0be822SUXkFpqx1gqpsimS6yGCY7uueNxGh5no5YLygiwxrc345539zdX0tcfswXBKVSVGjtgdsZqdOT865ZZ9ZHqy6ZcvgXM4T2WOjg+qrsmp08....WDVD+Cg.ld2kMeNyOOoUB.iyh36JA........rQYfTJCixyoJbKsExlt1ExJ2sqp2d02A.qezWv3Ju1sEBotdeCM7ekg5ositBxSaG8EPtr5bJGi5Z768z7tb1S0NJO+mZ3Xppi0124vg5lVZutV28bZNbX2zw6qbb698rdW1RMUe9odvKe7HzuqquOinsitB.3GcM4wnuN0g+6PutG...3hwh3eHDvz6tr4yY94IsR.XbVDeWI........fMp+yOrdnddL6FfqqRyg0oq.073p2yMsbdk6xfu1S6U+ZWtqr8vpm61ddeCI7e02w+tsVM0zXvqE0xiY6POcc1M7ju1QeLoZru93xyo4fVVN90WfkFa3llh5XemCGhxPg8dKs0xr6NYXeiGCMjWiwUEsYSqeVaVp5eMEP1ore218EOTqNWWakqyetm1tr8GxZxiUecJC+2gdcO...vEkEwuP6.Su6hv+AbYZQ7ck.........1nocdp9BfR4N+0CcbtcsCvsVYPXtYf065fF87.tNiM7eqOZamKqLTQ8U6yxtAipqc4v5AJpucrrqGXMjLrwgotN124v9TFTwt144Rp5Kkyics1+PG9uYY2cnttl6ZyT2umx04kseeqIOl80oL7eGx08....WbVD+BsCL8tKB+GvkoEw2UB........XixP8Lj.uzTnk9nAXodfgdriyqrd6amGro22PC+WWgDpLna8U2I6tikceKm2xhyqqvMsV8.HMzwu9lqmp5XemC6SYnT6KzYI6tVtqZ4PG9u6KZu8cWeap62i49hjguNuo1uu0jGy95TF9uC45d...fKNKheg1Ald2Eg+C3xzh36JA........rQYfTFR.uR1c25aeCtzZOVqsdtiyarAQpo22PC+WeAyo776KHRyFXcTernu.EtVYXDODgaZppi8cNrKkiscsFpzP24IOjg+qLPZu9AZmoteWNe0WPeG557lZ+tN2icecpC+2gXcO...zi+3TW.............vAxaI4kAdteq3wCMzfso90cLsUYcbn7RR9UOmyOJd72647+UFV+rdHBKuFsobd6iNebLqiCwbXYvKGSaVNucHF65yxrcvH22wfic+9kT84DcYnqyGqKs439LUe1E...Tiv+A...........vmE8Epm59Uw422tAVRUXmtNI2mpcKqmylcAq6Gw0dsgDPu80wncaZWwaYwiGZn6Jm69nga5XUGGp4vxwxgFh0jpZtdMLj0xeTkWigN9V5X2uG5bUeqy2GWZywcYJ+rK...nl+7TW.............vIxaYSHZ5JjWySxsI4lC70+yX3YJCkzqmjp33UGGp4vxvJNlfgs97W2Fks0Tn79kwVuqco0u+H9L0W+L9YW...bVR3+............f1cSRdngm+GY6c+pk4zGHmyAGpcIsOpyk53yJiu....GAB+G............z7NYUYv+dKI+WR9VKsgv+sqermuu2NnUw4ScbL7UcWY6qT+9qTeE..fuzD9O............9p5pZ+8WJdsYI49hW+uiP2LV+8ot.V4boNZyKY6vidU1cMYW5Zs7T3iVuGp14X2u+H9J0WA..fCj+3TW.............vIv7TEvu0J2g2to30+2H3eCQYnjNU6FhmK0wPUt1ZL06UY60pGifg8Qp2CU6bJ52eDGi9Z8qwrVNG...3Bhv+A...........vmEKyvC7x0EOtLLMyKd7O5o8DzlJmKgt6boNFpuW73x0mcou0xSgx6GtYOamKs98GwwnuV+4KCLXSlky+6M...3KMg+C...........fOSFRHjlkjaq83ekcClSY3+5q8FSPd9Lqbr7lLtwxwnqfMcLqiCg2x1Ap6pLr0Tyy1q4eK6tVdJ7R1NnYyy12SMTWZ869z0ZxiQesbGLsu1eeCsI...vWZKRxuqc.vT3tr4yY94IsR.XbVDeWI........fM9cCG8EnkGJN+lBsT44zUaVdtc8yxr947TO04XeeisseJi+m+5PdOKKNmmygK3ckW+tZ2opN124v9TVuump.h0lYopOMz0o6y78Xp2gbu2PZmCc+deluFyX0GYM4gtudcw49ZZOPh2jcm+lhO6B...3SmEwuP6.Su6hv+AbYZQ7ck.........1novqrNPekgd4praPcdtk1soP5rr3blmjGa45Oj58yZ3+RRtO6N9caZOXTq28D6a2iqrcKCzWY6OE0wTFBpaSy0a4Z4qSUvtpetOzSaenC+WRyAe8gzbf1lkp.m0zX6T1um5v+M10jSYeMM7ddMauC.dU1ddq7yvZiv+A...rxh3Wncfo2cQ3+.tLsH9tR.........aTFHkxcIqmW87kAhY8q01thUxtA.ZcPZJau0g2Q3+1VSACq9X35i2GQaNuk1rqvQcnqioNDTsUusUmCMTXSQ3+5pdeuVMW+9k1Fylp98TG9uC4ZxOZeMo4cjwtpsxyuMS85d...fKFKxz7OvFf5tKa9bledRqD.FmEw2UB........Xix.oLKsua7U+3wzcv+xpWuo..VFfrqVct0e911Y412.zLj22Xa6oN7eIMu6k02QS6Zb0cSGu2152Gx53XDBpqSyA.q7XcvSGhoJ7eIUyICod66ZOE868Y9ZriU66ZxCcesd8zWae+pyU3+....FoEY59GXCvZ2kMeNyOOoUB.iyh36JA........rQaARYYp1Uqdt30uO8GtrR2jpvBtN7Xut5w2zQsrbj0aetTC+2ZWmp4ix2+5ceuGR03YaglrzxTMGTOfSOm9CI0gnNNVgfZV1r1q953myl0e8Ef05lxv+s1MY266VON8Xple5aN9P2uOFg+KY+VSdn6q0MOUedWY6de1dNnL7esc8D9O...fUVD+BsCL8tKB+GvkoEw2UB........XCARA....3So+3TW...................rMg+C.................3Liv+A.................blQ3+..................NyH7e..................mYD9O.................fyLB+G.................vYl+7TW.............vGv+mScA.....vTvN+G.................vYFg+C.................3Liv+A.................blQ3+..................NyH7e..................mYD9O.................fyLB+G.................vYFg+C.................3Liv+A.................blQ3+..................NyH7e..................mYD9O............fKA+t1wSm3ZgCOyu....ED9O.............RtOIumjWSxUm3ZA....D9O............fu7tII2ljYIYdRd7zVN....PxedpK.............fOktJIKW82+uSYgL.yJd77SRU.....0Xm+C............3P68j7bRtOaB.34rumjeU6wm6gUD...fu.ry+A............bnUtS5ct6sj7WI45TEBvucZKG....P3+.............HoJ.f1w+....3rwebpK...................1lv+A.................blQ3+............3R0rj76ZGKKdsaSxSI48Uu96I4wjbydbctIIOzP68zpqyr8ndup1qcyp1Z8q0kaRU+30Zm+X5acMtMOU8ymq85CsOVuMqaYwqMj93XTetdr0bc0qsmF364POWL10DmaqMmu5Z1zXxSI49r85sgXelequ9sr+z20p9664QVq....7EvhLM+OvA.0cW174L+7jVI.LNKhuqD........vFMEhsaylPP01wqo+.AMKUgUpq1od3lFRXuZpdeng1qIWkcC0TSGOOf9VS0Qe8026ocGx3zG4m2aSgy6lz8bce0beseal54h9VSbts1bdKmaaGMEZuC476MEm28c20a88M1fBC...vW.Kheg1Ald2kMeNyOOoUB.iyh36JA........rQYfkJCfzyoJHQullCOTW6BYk6BX0au56xZ0Otdj0aaA3pzUMb85pVdOUAxZn0wPCtUWgo6oZGkummZ3XrJCGVYPs9nA.bng+apmKFxZhyo0lKa45UedudPIeb.W+O576rhZ58d56q8XQaOlcNR....9hXQ7KzNvz6tH7e.WlVDeWI........fMp+yOrd.1dL6F3pqRyASqq.97X1DDolNuxcYvW6o8pesusg5+1UG0Mu3Z7bZNzhk0RWAXq90sdfmdHaBR0rT0uKCN4ycztM096SP+5qMqWSGyZdpmKF5Zhjyi0lWUbdqWO0TXKWO2zVHDOzyukAZsuvOVFnxG547A...3KpEwuP6.Su6hv+AbYZQ7ck.........1nocBrlBJUckgBpqP9z0N11ZkAk5lAVuqCvzy8bcpGXwmS2A355AVKMMt014NK6F1pwrKxMEg+aH0b4tQWW6xiksea07TOWLz0DY.udxzt1row3tZ+9bnmeKClXa63fqUtSC125E....9hZQ7KzNvz6tH7e.WlVDeWI........fMJCKzPBZVSAGZHAopK0CGWWgLprd6amGbYw42zNpVo5ATqsZYrAlrLXT22y4eLB+2wtlOVyE8slXrlp0l2mwMezmoX984hyoq9S84pWGSgC...vWKKheg1Ald2Eg+C3xzh36JA........rQYfgFRfrR1cGQ6iFboGq0VO2w4M1.NUuc6amKasxcbtlB7TYczW3GmUb98EnuiQ3+5KfbG5Z9XMW7QWKVZJVaVFf1CQX4lh42x.B1VeZ9.OO....vuP6.GE2Eg+C3xzh36JA........rQ8e9giI.RkAGZng4pMkgIrMiMfS0O2aFXsTFjok8ztcEHr5puKp8dOm6TG9ug1lGxZ9XLWLj0Di0Tr1rLTiGhvxMEyukgTrs05kiQezcBT...fCh+7TW.............vAxai3b+0pyecHeFRXelkpvac0piYY36zfM4kU0QaJCJ1OFX6VNNbUOu2tpg1NuCc.0lJGpZ9XMWz2Zh1brWaVd+xPGONz5a98WI4aYS3DuJU0d47x0096+ngWG...3jP3+............3qp5g+qqfRMOUgGZn61aCUeg7pLfUiYmMjCqi0bwXC92oZsY48Kubfu9GR0C+WR0X0+V6wyy18mueLJJ...fgP3+............f1cSRdngm+GY6cGskY2cGtOpKkcWuuBNGmKr1bXdKUiIqGCtNaG9u565eq2o.A...NKH7e............Py6zYkgq5sj7eo8vAcnCXUoermuu2NnUAIm94hys0lm69d1LFLOUA9a8N720EmG...vYCg+C...........fuptp1e+khWaVRtu30+6zbHAOV96S30lscJmKNGVa9R1NPgWkcuG5bx2R0X15crvkoJneyy1eNfc8O...3rxebpK.............3DXd1DDnjc2Q1to30+2b7C9WYXp9pu6scJcNMWbNr1r75cIr1rdv9tt3OSpliOmCvH...7Ejv+A...........vmEKy1ghpKWW73xP+Lu3w+nm1anW2w3bJvYe0cNMWbNr1r7ZdyDbMNzpG9uYo5y.puq+88ia4....zOg+C...........fOSFRHjlkjaq83ekcC9SY.q5q8JCS3gPYccSFWcctXJBe1w14zbw4vZyxcIu4Y66oNG8V1NzhKy1iMeK....mYD9O............9L49ze..uOaGHs+KUg6pt2JdbWs48Y5BBV4tU1iS305PpdHqtJWF0beNWlKNWVa9uMbsN22A.KCv4ZeK69Y.....PiVjjeW6.fovcYymy7ySZk.v3rH9tR.........a76VNtM6tiycURdp37dtk1cYw489pmqt4oJ.XMc8GR89TectUtugZ41zdntVuau00Nw19TGkicioletnd2m.oM007PZ+yg4hyo0lOzP6+PptWqzrTE3t1FKl5420dugZtb7C....Z0h3Wncfo2cQ3+.tLsH9tR.........aTFXnmKdtmW87ulcC7yyY2.BVWYvh98p1or8VG.roJfUIMGxp50y5ixfMcHqiwDzp4sTu0CH1XcND9ujyy4hyw0lumMiE0qo1Z6iU3+JCv4qC78A....IwuP6.GG2Eg+C3xzh36JA........rQYfglk12wype7X5N3eY0q2THqJCNzUqN25Oea6Db6a.qRp1A4ZJDicczzNv19VGiMnU2zQcM19d1y2+TD9ujS+bw41ZyaRy6ndscbnt96S3+J24DuYfuO...fit+7TW.............vAzuRx+KUA745TE9o0gt5GI4kj78U+4PZq+NUgCZ4p1YdRda06+GI4as7dWedGRee0w0qpm4q9y0dq1w556PWCiw2Vc8WO9sNrkqqsKYm54hys0lea0wMYy8b0C63OVUyqu+6T55Z+8ek1Gm....fFsH1Ma.ld2E67e.WlVDeWI........fM9n6lb.ecLOa+YF2dZKG...ft8Gm5B..............3H3gZ+c65e...vYOg+C.............9r6gjrr1i+2TE.P...fyVB+G.............7Y1CI4lZO9Gwt9G...bAP3+.............fOiVljmy1A+6WI4+cZJG...fw4OO0E..............vAV4t8WRUv+96U+I...vYO67e.............vmMuU73WRxes5OA...tHH7e.............vmM+X0e9qj7uoJ3ekABD...3r1edpK.............3C3+yot..NK8RR9eI46m5BA...XeYm+C.............9LRv+...fKZB+G.................vYFg+C.................3Liv+A.................blQ3+..................NyH7e..................mYD9O.................fyLB+G.................vYFg+C.................3Liv+A.................blQ3+..................NyH7e............7Uzuqc7zItVfyY2jjGSxqo59k2S08L2bJKJ...fuBD9O............nY2mpfN8ZRt5DWKzLyQSmqRxyI4gjbcRlu54mkjkq9St7brumw8n...vmNKx1++pT.LEtKa9bledRqD.FmEw2UB........3iquc9uaJNmWOdkFCj4noy7TEXq5iuq2w+dZ0e+5SV0w95XeOi6QA..3C5OO0E.............bFpbWMadimEmRlilNOjsGe+2j7eEmSS67eWkpcEvzv4yo2w9dF2iB...eJsH1Ma.ld2E67e.WlVDeWI........fOt914+J24yt+3UZLPlilFyy12e73.ee0mKZ5dJN8N12y3dT...9fry+A............65sj7WI45j7qj7sSa4PCLGMMtt3weefuul1I.47xw9dF2iB...eJsH1Ma.ld2E67e.WlVDeWI........fOt914+fuptM62OWd2SA...bf8Gm5B..............Nar7TW.....TQ3+..................NyH7e............7YwrjbaRdJIumjeu53ojbeRlOx162Y61nsqY8yq9tl10I4wZ0xqI4gNpi4qd8mq0dOupOMaj09Z2rpFdsVa99pm6lA796p+0T89zdVuKS0bzS0ZqWq0dsMlMj4nlb8pZu9068Ab8JcrFeFRcbS1zmVulqdepqq4so49Px18uxw45OecKa38UdNkNzqUupnsqOWOVGp19i1Gqaptm4oz7b2PNZp89neN5g99nl9uSzzbP4Z3C88r...vErEY3+icAXecW174L+7jVI.LNKhuqD........vttMaG3u1Nte04Oj.oLzfkUFZkYoJHIcUGkA849dN+2SUf0Fpqx1gkosimy1AYZH8ugVu80tICarZ8QSgYZnyQqsLaG7p9VqLj.+LkiO8Y1.tV0ulsEvraGXaTNNOz2SW+L9m50pOLv5nOej19P1Gm56YNEg+q77lp6iFx+ch0yAkg+C..fSh+7TW.............vGzCo4PM8iU+47rIDLSwttVoGyt6dZkdHIukpZrs5ut0A94uRxK8btWkpP1Tue9RR9UsWeVw49WqpmgXn06SI4u6odeJ6Fdmll2daD0WaVuy3UZ80q93RR0ZkkopO7qx2TGNjiOCwsEOts45YqpsekjuW7d9UZeb3GEm6Ks7Z0Wy+qLr90TuV89L9cTugZns8gtON02yLl0i8sV4i3PeeTe+2IVu9c8bv+LrxD...9JZQ7+ag.L8tKa9bledRqD.FmEw2UB........XixcFp2SyA7adZeGs5Pty+UeG4pdcrNPI0O2Wy163ZOlsC0y0Y2cotW6nNV2OquyV8bZNHhk6.V6S+6gZ06rTErlx584NZ2aJN21l2tM6Fvslpst5Ck2Rodly...H.jDQAQUq0qSJsL6tCs02NJ3TM9LTOtpFuIMGr0x45Wa47Vqbc5PMlwrjoesZ4tY3Co60R8YeZ6Cce7XdOSetZfs0G8yQOD2GUNe01tfY84gxqA...v+eKh+AC.Su6hv+AbYZQ7ck.........prL6FnixcDqROT7dNzgVY8Qa0QYvxVez1Nb0rraHTttiZodvsdNcGxqqGXMLU0a8wh8MDRCYNpL.V8sNYV1cdpq.iMkymCw79OkcB+TW6nZGqv+M0qUWON+bF1XTe1m19P2GOV2yzmx0wum1GG9HeN5g39n4EmWe2+WFpQ+9o....6XQ7OX.X5cWD9OfKSKhuqD........Pk56NTiIDUkga5PG9utBJVY.e98p9QWJ2sutukyqLLj8EDxjsGKZqNFS+aL06XZy1Lj4nx.eNj0IyxtAFrsfaMUiOGZ0CKUWq4NFg+6XsVsq4swZrs8TzGOV2yzmx0HccO0T74nIC+9nx6+aZmWrTYXY86mB...rkEw+fAfo2cQ3+.tLsH9tR.........Ugto9O6vmGw6sL.dG5v+0WXiJO+9BiVYessZodXH6KPgqUNVzTsWVu8sKpMz58PDBo9ZiOx5jgta4MUiOGZ0Wez03vwH7eGq0p6a.4ZxXa6onOdLtmoOk2W7vA55ME2Gsu2qU9976mB...rkEw+fAfo2cQ3+.tLsH9tR.........6tqOMlP9bnCm1XCW19Dtpmqc9uOf5nsfpUZdw6qocEq8I7bCodK24FeHieWZqu4nx0ICcbIY2wl1B4zTM9bnUFZq1bLB+2wXsZaADbeM11dJ5iGi6Y5R4tY3qC35OUeNZR+2GUFlxwb++9de....GT+wot.............f8PYfS9wHdu+5PVHGo1td61TXaJCIzPGOdq3wWMh5XnmWagC5+Jd7MoJLQ2m920uFpxq8Ki389V1teLjZ5PN9rOlkp.OcepBuT8vQc+A757QbrVq9Rlt6G6qsmp93w3dl1LK6F.1+Wllw3C08QkiIi49e...NKH7e............bIpLbMe0C0QYHWdM6tSk01woxKI4eJdtYoZGp60TEdsl1c2FiO55j5m+GsVlRySUvrdOU6Nb2lp5su.xcJbrVqdJC46T0GOF2yzlGx18q+Mm+eta45+y85E..fcH7e............vkuC4tG2wz2Rxekl2YzVlpvL8Xtb6eGCq282to34+Qp1o392UGiY2wbJ8UXtbJ6imh6YtIU6njqsds04tuBq0...9j6OO0E.............vA29Fzq2NnUwv7RR96TsKcsNjQ0Csy0oZGG6uN9k1VlxcRt80MoZGYas2RUnr9VKm+43tW3kzZ080gtOdLumYdRtu1i+U1c2GD...lHB+G............WhJCEy7Fdtux96ScArGdIUgJ5eSUfltMaBzzUqd7X2swdIaG3sqV8bC0UEs04jYY6PYsNPXmigTrKWhqUGqopONE2yTpbWD7exkym05+NA..vEu+3TW.............vdnL.GiYGMaV+mxEmxfocNtCuMT+JUAVpLHaWumsUciYb4pr8Zkysv+cS1t992bYD7uOSqUaywtOdHumotay1Af8+Rx2+fs4wT4+chqZ7rZ1mw+6D...WfD9O............tD8ihGOlv07QCDy4nOiAp5kj7sZOdLA2YsxfJMl49xy8bK7eyKdb48DkNWByzmw0pkNU8wCw8LqsL6tyR9Q2EAO1JumXn2+OOerwN...NXD9O............tD8R1dWc55L7.1bygubN49U1Nna2jcCG1knO5NY2aY6..cUFV.flmsWm7VN+1wyFy76rbbC8ZWAM7y5Z05Nk8wCwt+3rj7Pwy8OGn19Xpo+6DCITeeFCHN..vEJg+C...........fKUk6BUOl92cydHed2QmpuieMKUiGmygpZH6Dc0CgSe6rcsobcReqAVO1Uu9NG2wydq3wcEp06yzuVnLjkcc8tzVqtOlh93w5dlGx105+lyuc9xgpo6+6ZbrbGOD...XGKRxuqc.vT3tr4yY94IsR.XbVDeWI........fMdJa+yP78TEBpxvcrr3ber1e+oVZ6eOfyYLmWa07PLz2y8Y2wiaS6gNZ8NB2sczlis+Mz580zdP7lmsmi9cZNbaCs1tMMOtTtN45U0U8ysbGPaeqg51m0.kVlc6Sk69kMMN120beqsx0dOmsW2UtF7bYs5PsOs8gtOdLtmo7dk9V+2mo5yQSF9Z0xy60r6t62rrce+8A11...vWPKh+AC.Su6hv+AbYZQ7ck.........1XVpBYTSga5oUGkg33lrcHO9LE9ujpv5zz3wqYyXRSiKsYJBkyUEu960pqxv2cHliRZeboswigF7oSU3+ZpcpOOWebbcnylxv+MugZouwxyg0pC0911Gp93w3dlqZnNdtnN66XLWu847panqUa6+NQ84fx0pGp6QA..fOgVD+CF.ld2kMeNyOOoUB.iyh36JA........rsYo8c2rxvxrd2d5yb3+RZdGrquil1MwRFe+aH06MinttO6tC8su010o4P90zZkt1g49H0PxgKXQyZnsZJfSWs5bq+7ss6y8QpstlWaar4TuVcn9Hs8gnOdLtmoLfn6ywXtd6y4U2XVqNj6UVO1M11F..fIyedpK.............3C5WI4+kpvxb8p+b4pW6sj7RR9QR9VKu+1BIykruu535TMVLOaFSRpFWVerd74siX88sUWy0yWyylvNstt9Qp5CGx5560ttqGWVeceo359qC30cp7qj72oJXXKylwxgrte84cH8sUs455Y88VqqklbtuV8P3PzGOU2y7Yw56UVlsmGR19dklF6d4XTf...vkiEw+uEBvz6tr4yY94IsR.XbVDeWI..........foyyY51EIA..Xv9iScA...............mIlkM6phIsuqUB..vjS3+..............fJ2T7Xg+C..3jQ3+..............3ypYi3bWlj6q83ejjWNrkC...Cmv+A.............vmUKSxqI41jbUKmy7TE5umJd9+cBqK...50edpK...............XhrLaB22Z+n1e+pr6tC3uRx+D65e...mXB+G..............ekrriW6GoJ3eucjpE...Zkv+A.............vmU+SR9uTE3uqR0t.X8v+8Rp1o+9QR9dD5O..fyHB+G..............el8VR91otH...Xr9iScA..................v1D9O.................fyLB+G.................vYFg+C.................3Liv+A.................blQ3+..................NyH7e..................mYD9O.................fyLB+G.................vYFg+C.................3Liv+A.................blQ3+..................NyH7e.............WBtOIumjWSxUm3ZA....lbB+G............v4taRxsIYVRlmjGOskC....L89yScA.............POlU734C38bURVt5u+eG1x4f6RpV6ymo9B....riEI420N.XJbW174L+7jVI.LNKhuqD.........e0LOIumM+rhuumyu949zzVZeXWR0Ze9L0W....N4ry+A............bt6sj7WI45j7qj7sdN+xcJvyYWR0Ze9L0W....N4D9O............fKAukj+6TWD....vwxebpK...................1lv+A.................blQ3+............3yj4I41j7XRdMI+d0w6I4ojbeRVNf145j7vp2SYab6pqyPLq16+2EW64qtFOW60W29y5ocq+d98.N+5du1664NNuaRyiiOt50ZyrFpugLleaw641hWu9q8TCu+5udcKKds5mSYcd0.pyjcmW6ZbrI6Ss1l8cdpIKS08H0W2+Z5dc+gru.....m8VD+CcAld2kMeNyOOoUB.iyh36JA........rq0AoqovF0zQagkaY1NDUccbeGsScMEBt66oseOcGDsxfxMzPdccw6qLfcY00sLTbMc7bG03UEm6q8TWyKN+9B2Weu9PNRpF2JmSGhx22XCY29TqkNDySqMKUgEbH0RY..OD8E....3hwh3enKvz6tH7e.WlVDeWI........fssLaua1UO.cOs5ndHodrk1oLPW0CZ1SsbMdN8G.vxv+MzPJ1U..KCKWa8oRkW6xZ+pra+74z9Xv6o8cAw91I+pqbGVrucXtlB+2S0NZacP8ijp9+6Em6PTFTtwryKtu0ZcGx4ojlCQ351pdXXaJDmez9B....bQYQ7KzNvz6tH7e.WlVDeWI........fMJ2g4VGDtlBM2rTEvuqa30JC926o4vpsL6FTp9BzTYss9u+Ps5bcsUtqC9bGs69D.s5gBqLvfyKd8mylcpv5ts375p+WNV0z7xPCI39Nl224VFHxlVeT2rhy+gdN+9LlZM4vOOUt1+1r6Zo4qd9tBvYx36K....vEmEwuP6.Su6hv+AbYZQ7ck.........pTtqs86TEjowpLLUcsi6s95VFpstBEUY3D6pNmkcC.XagQqLzV802utm1s9N2Ve6ngksUaW6xvYVFlwx4vtBL1TE9uxZrucQwxw8lBd2XL1.ycnmmpuV9iFXOg+C...fO8VD+BsCL8tKB+GvkoEw2UB........nx8Y3AvqKicmeKY2Pq8dZODVkA+qu5rLbY2OvZnuPqUue9dwqsr3Z1U3GWqdHz55Z20N6WYMMui1YpB+Wxtg4rq.0Uue+5.Z69LlZcJlmND2C0TaI7e....7ozh3Wncfo2cQ3+.tLsH9tR.........6F7s8MDVyx1+LHK2Y55RYn1Za2uqL7ecEvslpotBQUYvE6JzZ0GuJCT3i0ds9BQ3Zk6pbccsqGtt0AkrLHa8syENkg+qLvksEBt4C77FiwTqSw7zgLvdB+G...vAzebpK.............XOrLaGhousmsS4t72XZmuW73grKr8RRdqmy4WqNugzt+n3wssqEdc1d7pr1q+9Jay17Rwi6pN+mZ+8YoJ7g0CN22y9OGdH78TMtuVWiikuuiooXdpdeXYpBTZWA4D...fiDg+C...........fKQk6ddCMHTkJC4TYPo5xaY6.i02N5WJN+gddcEDqumsCS3xVNu5O+KY69Y46YnikkgXrqv+8RR92ZO9lZW2eksCG3ovux1gO7pz77YY365KHmGRS07z+U73aR0No48YXqoA...XhH7e............bIpL.SiIzd0UFnpw1NcEhtik56bak6ve0e9lN+jcC30qI42C7XL9uz736+jgGJxoT4NO3MEOdd1dc2wdW+aplmdI6F9xYoZmY70j7TNcqsA...9RS3+............3RTW6Fde0TFBsqa3w0GuJC41wbrro.ysuA27P6sr8toWSiiqUtSAdLLkySeKI+UZd2DbYpB.3iSbM....Pg+7TW.............vmDmpcutWVcrdWoaY1NXZ02019d5uNaJ.XCwa875Wkj6a34eHI+8ddMOz9d1LdMOUA9acfE6Z2S7T3POO8RplGtJU65gkgF85TMl7W640E....9TXQR9csC.lB2kMeNyOOoUB.iyh36JA........TEhr5+rCup6SexZm2q8depky42C3bJ8TF2OazaKN+5g1pdMVta10z6cp7bsqwqEWyaGv6eLii6yX9Z0GudX0yMOer0IcYn05wZdZsYqtl0GO5at5iLtC...Pg+3TW.............vdnb2qaYim0z1NWksCY2K6YMbHTtSzccs+bcM9qFNujcq68crrK2lMAl6WoZGl6khWe9Dbc2G020Dut3OS1rSKdrcLlmp6WI4+R0bU86SZJ.o....LAD9O............tD8ihGeyd1NsEZtgn7bOkg+6srceYYwelrcn1papCU1UoZGVbs+KU06+V64lkM6xdmZ0Gmlkp4456zeMEfxigic3+pecqOlbH20CA...fKNKxls89eeZKEfOwtKa9bledRqD.FmEw2UB........nxyY6e9g2tmsySEsyPB.37j7ds2yqcbt0a6m1yZZHto14+9pm60ZOWWg15wh26gbW3q97zqY6cKwGxvmCGy3X8y848nlqO9WViy538sOFSsNkySc41Lr0iezwc....3r2h3Wncfo2cQ3+.tLsH9tR......++Xu6uqZcjr9Fv6udMIfSAdCAl.vW3ID3MDXBgSeIWRGBzg.mPf9hS..g.DBbBA9tPVutbY8mRxRVB34Ys7pwFY4s1UIYyb7uo...prKN9e+vOhwsB.luedO5NnbahSCdXWutWpv+sINNPhoA1pufXk2CdNllfkkGZr7fUlWycEnsgzGy6eC8XIMHko2liUmvgTqyw3TIgYLc9dW89ysuC....qdaCeg1Ale2EB+GvmSaCeVI........fCxWU1pCnUSg2aSTEpqlVc4xCo166er7fQcSb7poWIAB6RE9uHNtejGDv9bezbOns.bsIp5GssuuNJ6XOOncO1x1Mj9X9wRdH4JITZo8u5a6J34MTCsVm5woWi1Om4p33Uav9B55Tz2A...fUssguP6.yu6Bg+C3yosgOqD........vwZJ.f0gh5o82RCrWaAGqs8S89novfUxJA2kL7e2zPM9QT1p6VDs2CdMNzGZpWzjzUKttVQ+h3zi27UHvHFVe7pVNNFx3VdP1dsfmyXLlZcpFmxCnYamybI66....vp11vWncf42cgv+A74z1vmUB........3T2FMGNu1t0laJb+TuZqUhKY3+h3zPa01JoWaZZ0Mrua4qZb4qjh80qxCM16woAVbn8w7UTvg972k8b5ZEu6bMlZcJFm550M+18QYgH8b66....vp11vWncf42cgv+A74z1vmUB........nc2FUqtXoq5b0gN5wnJDZcsBzEQU.mtc+1mtedd+icaT9JoWzPcThyI7e4qXcMsJ5UhahpdYdsTu5x8PT0Kx6m4qlbkth4kGXv7PKNl93t86mz.c9bTVvMSWc8duvWuywXq0wNNU6p8uF4y2qe9kbNyTcr.....qdaCeg1Ale2EB+GvmSaCeVI.........XdkuRDJzZ....bw8GKcA.............vJyCI+7uiH96kpP....36Kg+C............fCdHhXWx8+ynJ.f....vEkv+A............PkGhHtM49+SXU+C...fEhv+A............7c2tHhmiiC92uiH9eWlxA....h3eszE..............Kn7U6uHpB92+Y++E....VDV4+.............9N6sr6+RDw+d++E....VLB+G............v2Y+y9+6uiH9ynJ3e4ABD....t39WKcA.............vB5kHh+2HhetzEB....jxJ+G............v2cB9G....qNB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A............7UwGI2dZgqkgnz59y5wG....ifv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G............ekbUDwOhHdLh30HhO1e68HhmhHtOhXWA6mahHdX+yIee7i8uNkXSxy+irW6q1+Z7bxuud+uom8a5y4iB19Tum77dtis61n493i6+csYSC0WI87ej8b9QAOmRsY+9Kc7rzdcszZ6oBeNoudeLf58RYSTMVVOWudtQ5b8R5O4yyuN42cabbenKicNWS0yTbbA....mXart+i8A9Z3t3v0Y90hVI.LLaCeVI........fSUGjtOJ7VaA+YWbbvi5518creR0TH3tum886wwAnJWdP4JMXT2j87ZJfcWGmFdult8bG030Ya6q8TWWks8kFttbMsOtMNNviCsW209tOkF9uR22SQOJhp4s8MGLs+Tx7qllm2z4jMYJlyMWGW....vQ1F9BsCL+tKD9OfOm1F9rR.........GaWzb3tpWkudJNNXQO1x941F1GejrOZ5034n+..lGJpRCoXWgRKOrbscLkK+0Nu1uNN8374n8dv6Q6qBhCYk7KeEVrzUVwb4iasMlNl..9UK7eMMWtq452zy9LeddagvK2TNmaNNt....firM7EZGX9cWH7e.eNsM7Yk.........NHeElqNHbMEjqMQUXvZJrO4gD68n4vpsKNcEJquPXkWa0+7CI0YcskupC9bG62Gy11RVEBSC+TdfAuJ62+bbXEbK0Ox1ttN9y6UMMtLjPB1mz8SZu7b60466O6g+Khpw+5.R1zbm7w4WaY6Zp1xGSeX+ikO1NGy4l5iK....3HaCeg1Ale2EB+GvmSaCeVI........fJahSWIutcD6m7.H02p.2l3zPs0Uf0ZZ0Oqs5bSbZnzZakIKOvh8creSO62zfp02JZX99psW67vYlGvt7wvyMPaCsWmO+oofm0z99qP3+JY0ULODecMGqofW9bOuNywbto93B....Nx1vWncf42cgv+A74z1vmUB........nx8wzrhw8P19osv1kJO3XuGsGbo7vn0WclGpu6KrFxWI+xkdb9d1uaW1qYWgerVZvs550tqU1u7Zpjfa0k4pWmuu+JD9uRkFF0tFmy68ccNQDy6btRT5wE....bjsguP6.yu6Bg+C3yosgOqD........voAe60yX+z0JSWWJc0CKOTT8Evs7ZpqPdkGbwtBaUZ+JOjaOFCOHT4qDac8ZmtRIVGJr7veMEq9Z485tpoHFVu96Z3+Rmaz04GCM3ky8bt9T5wE...vh4OV5B.............FgcwwA+4uG49IeU9aH6melc+RV4xdIh3sd1leue6JY+9OY2usUsvahi6W40d5yKee1lWxteW04+M4m2DUgOLMbX+LF+XXa9mnpW1kgzq+tZr8m9FOm64bCYeYbG...Vk9WKcA.............iP9pmWogGJW9JGVd3h5xaQU3wp2G8sh9EQ+gQqosqqU2retuNpes2EMG5pcI+7KwwGm6x11R6k4gX75NdtuDQ7mwgUbvzU4ueGGGNvKsR60ekUuRLd89aahyOXccMW+RLmKho+3B...3hR3+............3yn7.7LjP6kJODRCc+7Rx9Heeco7y3vpnW8J7WdvqtIa6SkGZwWmtR6H+095Her6+FkGJRlVWEUyctsuMbf5a7btmyMWGW....WTB+G............eF8ccEZqIog+Khp.182Y2Osekux.dI6k+Lltfax441HhGZ3w+m33UtucwzGr04bN2RdbA...LoD9O............XZrTqdcur+Vcn51EGGvuz.N8yn+57eFYc7VO+9qiHtugG+gHh+yHeMYbxCH2aQ0JyXdvPqM2gjaplys1Nt....NKB+G............eF8RbbvctNF2JH24teRWE6VxUvtzUTu5U5uemb+zsqOyUP7xCk0U6+4cQ0JW3eMSutbrMwwgv7knZLeoBuZDSybt03wE...vY4OV5B.............Fg7.8L1UvqyY+bcTE3nZKc3+RcSx+stF+cCaWDmV2ywpg1OhCgS72QUnrdI62eU9SZkIctxlV2p0uaiiq++Lt7AjaNlysFNt....lTB+G............eF8OY2+1QteZKzbkHeaWxv+8Vb7wxtr+aDQ72s7bm6v+ccb7Jx1eEU06el7XahiWY.WiR6S4A+rIah4IHkmq7PVletTt4Hniywbt0vwE...vjR3+............3ynWhiCPzUQ0pG2P8VbbHgtNJK.fWEGG3v7v2sDRONZJ7esUe4qHf2FS6pvWZn9dKNDBw+INNPh6hwMFdo7V186adxXCj5baHisahgEH1RMGy4VCGW....7Mv1HhORtAvb3t3v0Y90hVI.LLaCeVI........fJ6hi+2O7iXbAtJe+7dTEBv1rIh34A75ltcOUXM8TL7+sQ2DU0d8y4GI+7y87by6AOGSS..SqgOhSCbUdM+9Y95Nm85ax1tWi1W83tMaa6aeWZcOliubOjse5Zta91NEGC0l54by0wE....bjsg+fRf42cgv+A74z1vmUB........3flBwyCQyg2aSTEHnlVc4xCo166er7vccSTE5q7WutboB+WDG2OxCBXetOZtGzVfrpW8zZaeecT1wddP4drfZsMycuNer+033.Mdcb7XviEtuujg+qovttKaatJNs1m5v+EwzNmatNt....firM7GTBL+tKD9OfOm1F9rR.........Gqo..VG9mm1eKMzVsELo11O06i2a320Wv+hF1WkXrg+Ke0oq9VaqPc4ZqG7ZbnOzTunIoqNh8sh9ke7lulnulMJ...B.IQTPTAAVp4tW2zpMYa2dngs+bq6oH7eQb5wb5Xb54J0gwatB+WDS6bt433B....Nx1vePIv76tP3+.9bZa3yJA........bpailCmWa2ZyMEtepCOTItjg+KhSWc5F5JoWSqtg8cKekVLOXU80qtJNs+VZfEScI50kLW698a6ZM7eahlCJWdn4td+1l93sEhyyo1lh4by0wE....bjsguP6.yu6Bg+C3yosgOqD........P6tMpVIwRW04pCiziQUHz5KjOa1uedLa+779G61XXAS6RG9u6ydticUz6lnpWlWK0qjZODU8h7940Mr8kHOvfCMzhQb450WEU8474G2GG2OxC+Wayatzg+qV8775f28ZbXNdaut6lwZary4xMkGW....vQ1F9BsCL+tKD9OfOm1F9rR..............7E2erzE...................GS3+..................VYD9O.................fUFg+C.................XkQ3+..................VYD9O.................fUFg+C.................XkQ3+..................VYD9O.................fUFg+C.................XkQ3+..................VYD9O.................fUFg+C.................XkQ3+..................VYD9O.................fUFg+C.................XkQ3+..................VYD9O.................fUFg+C.................XkQ3+............fu29H41SKbs7cxsQDOFQ7ZT06eOp5+2tjEE.izm02Koz59y5wG..exI7e.............b4bcDwyQDODQbSDwU6e7MQD61+e+p69nJriuFU8CNl9C...DQDw+ZoK..............9l3pnZEiJMfe+Nh3k8+70QDucoKpKraiH9w9edSTs5G9+rbkypi9C...7+Q3+.............3x3g33f+8mQD+U117Uek+K+36pF2pKmqipUbwHNcrXIr15O...vB5OV5B.............fuAtJNDxrHh3mQygM62WlxYw7y33iwkLvcuGQ7bDw8wwiMKo0T+A...VXV4+.............X9cS18+4hTEKu2hH92QU+32QD+8BVKqwUYw0T+A...VXB+G.............WdeWC+WDUAbyJZW6ze...fHhH9ikt..............3afcKcA....vmKB+G.................vJiv+A...........vmUahH9H4V5Jq1UQDODQ7bxu+oHher+4Uhz88SE9bdJ64Mz59lHhGiHde+u608GGW0x9poiymigcb1lM62OOkTOuu+92Nx8+sQ0w2qI0666eraKrlR6cWmsuS6+Sgahp9a59stG7in8wkZ+HZdbNhiONFxbrZcMOpswtR6yM4b6EoJ43dtN+tsyO2EmNlz07ncQD2GG2OdMFW+nqZ7R2eNGWs+0noyweJp5WkrBXNUy0lqdT5y4iB19T0mOVes51L1qUtog5qjdd50p9X+8mJoWOZs89w...LJaCeXSf42cwgqy7qEsR.XX1F9rR.........GzT.GtO6wyu8dbbnwJYeO0gMHut2DUg5nq5NOvGkbbdSA0bSGm2FGGRklt8ZTVnRhnpemGHklt8bz+XSSi4Ozv95brKNNzMcc69n8.rjGnlttMzv+EQy8heDkM1Ux4.QLc8h1p6tNtmiyuKc7ns4QkbtZ8swF.vkr+LF0AoqzdZayQl64ZSUOJ+75RCT6MYOulBX2Tbsxqy11W6ottJa6Gy0hhV1G88dIqs2Otzy2FaOB..3KhsQYeXS.NG2EGtNyuVzJAfgYa3yJA........bPdvNJM.JkD3fKUXC10vyqsacE1s1tMziyaydrm2+3sEJm9B9x0wog+nde9TC+t2itCMUd+nsf7LV4G+o8llp25imlBhzsc77dJ618inV6a9eeic8EdyorWzVcOjvsMEmem1yyeN4iIMUaMELq5sMsO2Wfq5xR1eFpcQyyCR6mo8rGaY+bIlqMU8n7vx01wTt7W67ZeJuV4PVI+xWgEmpPq11X5XlOV54DoD9O..fYy1nrOrI.mi6hCWm4WKZk.vvrM7Yk.........NHO.F0+7CwgvDrIpBgPd.ndd.664LrAo08OhCAB45F1euFGGpiGiiCMwMwoGm8EBo7sMcemGBjlpotBKxUwwAV44n4.mkuZ0UZ.LxC3xC6ertB5RWxCqx6sru1EmFBr9liT5bigH+XeLicsEdp4rWLlv1L0meOj5nVdOI870ZWEm2bvgTWyc+oO4qvbMcMoZ00QSqFoWp4ZSYOJe0erjUgvzqwkGXv43Zk48plFWFRHA6SauWxmo2OV3+...Jx1X5+C7AH2cwgqy7qEsR.XX1F9rR.........GjG7jOh1WI51DmF3flBhRS664LrAcELiHZdkFatNNKM.H4qfUssxWk1O5aU55lnriulBXxyw3WsppkG9l9VMp1DmN1T5pq0T8u28TL18PCayb2KFSXal548CoNpkdLNmg+Ysze5xl3zUht9VEPaxkbt1T1ixCrXeG64WeKe+NGWqLObl4ArKeL7bmSOzdc97mtVIRuTuerv+A..Tjswz+G3CPt6hCWm4WKZk.vvrM7Yk.........NXnAeJOvF2W39dtC+WW0cdPO9HZOrc0F6wYoGqMEbi7v2sK622Ufdpk1+Z6XLud6Z0qaHxCEWIAiJuOzUsbIB+2TM1M28hwD1lo976gTGMs8myJj1PdcVx9SWtefu1s4RNWaJ6Q40PeWSN8378re2bcsxH5dk8KulN2.T+U38iE9O..fhrMl9+.e.xcWb35L+ZQqD.FlsgOqD........vA4gMnuvKrIl2un+iM7e8Eds7suu.xL1iyOhtW8kR0UnRhnJPJkFLlZ4Acro9xPCXRIx6W4qPVcIuOz1Jc0kH7ekDZnH5dr6RzKF6byo776gTGic6Gq0R+oq8SZv2d8L1OWx4ZScOJO3hccc7z9UdH2lqqUVKckRrNnj4ANbLqZi4F56qsFe+Xg+C..nHaio+OvGfb2EGtNyuVzJAfgYa3yJA........bvXBNRdPHJYeOmgMnj5dLAGaLGmCIDOWEc2iFSvRx2mMEDwgFvjRjuBTMjfvjWyOzx1M2g+aHic4gtIMvQWhdwXBayTe98PpiZogzp93aJl+M15Zt6OsIO3YiM.tW54ZScOJuOzV8muc4gzcttVYsqiS6UktxANDi48LWauerv+A.vpyerzE.............LQ98H1t4H3NCUo084reK837sAr+eKa6SeMxChx+LxW+9VI6dIll9Wd+4kA7beKqF5akEatLjwtems8o07ZsWrFN+9uxt+sQUnKuOVtw8ZWx9S9wZomem6ROWap6Q+LN97n1BfW5i+Rb7w4k3ZkuDQ7mI2+1jW2eGQ7eK70bNr1d+X..X0Q3+.............Fqz.njF9j7f37Zb5J1Wa2FhoJ3j4AvYHgPJe66ZE3ZMoswtui8hR8RbZPo1DUq7cuFUqFXe0NlaRdPyF5bjZeElq8yje9ln4.rcSKaeDWtqU9WQy82+aLeAPG..XBH7e.............SMqfS7U0eGQ7uilWg11EUA.7w3q84.ekO1Fp7v7cSC2Ose82Y+9KYuLuViX7A2D..3B4eszE.............vWBcs5Q0TPoJwa8uIqNeFWEslqZ9yXunDuDQ7ehpU.uaiSC30MQ0J51+9xWZeasTy0dY+s5UCwcwwA7KcEI7mQ+04bcsxqiHtugG+gnZtL..vJkv+A............LVWk7ycsBRs1CWxKwwgz45XXqHVWm7yeVVIsZql+N1KFqWhH9uQD+YTEBveDGBA306u+esLk1r5bmiLU6m0xbseFGpk5ff96j6mtc8YttV4CI+7awgqcuK95NOE..9R3OV5B.............VoRWgl1z5V880l33v+ktxSkGDmcw5V9pw0Pp2qiime7YHvaWEGWyoice25ESgeGUgm5+DG2+to4M+SuyYNxTseVSy0xC02MI+25Z72MrcQbYtV4OhCgS72Q07zWx98Wk+jVY79w..7skv+A............MKMbD4AMoIah0eH25ytn7Pfba18yW83x2uqYsEdmRjusKUHj1EkGJltp4uB8hkxKQD+cx8utsM7St+I694WKnTeUlq8Vb7wxtr+aDGOuH0besxqiHtO49+UTUu+YxisINdkAbM5636GC..QDB+G............zl2xteeASYrAfYsojiiMQ0pEUs7U0p76eartWYodKNNPSWGkEDoqhi6W4g.5RaJF69pzKFpoZ0DKe0r6qnWhiCi0UwwyoJ0Wo4ZoGGME9u1pu49Zkog56s3PHD+m33.ItKF2X3kx202OF..XkZaDwGI2.XNbWb35L+ZQqD.FlsgOqD........vAo+6G9TgOmmhx92c7lrs60n8.Bca11129dn0co07XdNMU28EbhGx19lBMxtrs44XZB0xXFyKQd89dz8J21ln5Xpz91XFC6ykZrap6EkNFNmme2z1127yRBHXZeXryOWK8mtjOGoj4dkreVp4ZoFSOZSTU6omWkdsutLWWqLsF9HNMvb4076m4q6W82OdtduG..fOg1FS+efO.4tKNbclesnUB.Cy1vmUB........3f4NXGuFmF3fz.TbcbbXpdrv88Pq6KU3+ReN+HNMbEW2v9sqfsbe119998aaALYST0e6ZEnZNCfQdXYpq279vMwoyMdH51kJ7eS0X2b1KVKgaKe9Ydnqxmm9ZTcr0T3ztJN87+wt5isV5O8IOHo0i8M0e1DU8ilN2dMLWK0X6Qo8i7f.1mo9ZkWGkcrmGTtGKnVayW82OdNeuG..fOY1FS+efO.4tKNbclesnUB.Cy1vmUB........3f4NrAMs5V01sGZX6mp59RE9ucwoqpVOueekG7h5eWeqFZMEPn5fa7Txs2i4o2MTsUusUmkD.oHl+v+8Tb4F6N2dwbF1lgzmuJZ93qoik7vT8dbnOzT+8blatV5Okns4Hs0eZqNW54ZoFaOJe0oq9VIqXjQLsWqL8ZA8sh9ke7luBAVp4tWuzue7b+dO...ehrMl9+.e.xcWb35L+ZQqD.FlsgOqD........vAWhfcbazbvSRuc+9s8qP3+1zvysoaOFkGpklVwt56VSqdX406bE.iah9GyqCUSIqpWQbYB+2l3zU6poXrap6EyYXaFy42scL8TgaWSWOnz9aSVS8mRTx0HK40bImqk5b5Q4WmanqjdSw0JyWIE6qWkGB12iwM+8Rc95R89wi43C..3Kpswz+GVAPt6hCWm4WKZk.vvrM7Yk.........N3REriqhp.EjtZJ879GKcEUJOrAsEfhgV2yU3+1zw1rKpV8jxOleHZOXd84l8O+7Zqdks5gnJbGcsJUcoBfwl80xiwo8fG2+6FR.YtDg+qVSicOEUyWGyX2T2KVagaaWTcbjFpnmiSCM0U6er79P872eDcO2sTqs9SotMNcdWcs8XTV+Yolqk5b5Q2m8bG6pn2XuVY9JT4qE95kGXvgFZwHtb85k58iE9O..f+OaCeg1Ale2EB+GvmSaCeVI.........fHDFE...fuz9ikt...................3XB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qL+qkt..............fQ4+2RW.....Lerx+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G............781GI2dZgqkuStMh3wHhWipd+6QU++1Kvq8ZYLeI6A.qOqkqMMTkV2eVO9..XAI7e.............b4bcDwyQDODQbSDwU6e7MQD61+e+pSOX9ceTElxWip9M...7Iz+ZoK..............9l3pnZ0dJMba+Nh3k8+70QDucoKpKL8f42sQD+X+OuIpVcE+eVtxA...FKg+C............fKiGhiC81eFQ7WYayW8U8tuh8fqipUrvHN8XYIj2+tpwsB...V89ikt..............3afqhCADKhH9YzbPw98kobVDeE6AuGQ7bDw8wwGaKoeFG2CWCARD...FAq7e.............L+tI69+bQphk0WwdvZbUJ7sHh+cT0u+cDweurkC...LVB+G.............WdeEB914ROX97VXE+C..fO89ikt..............3afcKcArBnG....L.B+G.................vJiv+A...........vmUahH9H4V5pJ1UQDODQ7bxu+oHher+4Uhz88SE9bdJ64Mz59lHhGiHde+u608GGW0x9poiymigcb1lM62OOkTOuu+92Nx8+sQ0w2qI0666eraKrlR6cWmsuS6+Sgahp9a59stG7in8wkZ+HZdbNhiONFxbr1zz3U8989Bp09L1wtorGbtyeZxU6qwl1u08ttp6T6hSOl5Zt3t86+z4WuFkO+pKkzWm6qgNFiY7nIm64t0lidT51+QOaatzysetmscrmurogZrjdd545er+9Skzqus1dOc..fug1F9fh.yu6hCWm4WKZk.vvrM7Yk.........NnovIbe1ime6833PiUx9dpCJPdcuIpBjQW0cdXMJ437lBp4lNNuMNNjIMc60nr.gDQU+NOLIMc64n+wllFyeng804XWbbfY5518Q6gOIOLLcc6bB+2Oh9Gupq0Xfutm6X2TzClx4O0pCtUo0V5XboOm1lKVx4602Fa..KcLtoymlpqgNDmy3Qpo5b2TScOJ+bhRCt5MYOu1BW2Tb9x0Ya6q8TaWks8i85YMsO568iVaumdomuctA9F..XAsMJ6CJBv43t3v0Y90hVI.LLaCeVI........fCxCkQogGojvBboBJvtFddscqqvt01sgdbda1i879Gus.0zWvUtNNM3F06y7Uot5wltB7Td+nsP3LV4G+o8llp25imlBQzsc77dJ618M77KQayEp2u4ia4aeWysmhwtysGL0yehnZdSSii0qLbOEGGdpGyd9o0baO+za4ZJXVMMd0Wfq5Roiwy40PK04NdTaJO2M0T2ixCJWaGO4xecaptmxyWFxJ4W9Jr3TEZ01FSGy7wROmHkv+A..znsQYePQ.NG2EGtNyuVzJAfgYa3yJA........bPd.Jp+4GhCAAXSTEff7PP87.12yYPARq6eDGBzw0Mr+dMNNPFOFGG3gahSON6K.Q4aa59NO.GMUScEziqhiCaxyQyqVf4qbckFdh7vo7v9GqqPpzk7fl7dK6qcwoA3pu4HkN2XHxC9Xc8lGJnqZ30uu5dNF6FZOXNpg7UzrlNOpV80N5ZEzbnWmHeNVaiWmy73gTWy40PKwTMdLmm6NG8n7U9wRVABSmi2TfAmiyWx6Ukr5dNUyaS6keldOcg+C..9FXaL8+A9.j6t3v0Y90hVI.LLaCeVI........fCZJLSssRzsINMr.SYndhXbAEnqPUDQyqRXy0wYog2HeEnpsUtpz9QeqvV2Dkc70T3PdNF+JMUs7fyz2JI0l3zwlRWYrlh+8t2ks+JYkupoUrr1laOGicCsGL00vl3zU9r9V4J6yPuNQ5bl4L7OiILRS80V5yTMdL2m6NG8n7vJ12wc976l1myw4r4gyLOfc4igm6b5g1qym+zTXGaZeK7e...mkswz9G3CPStKNbclesnUB.Cy1vmUB........3fgFZs7.Wbeg664N7ecU24gz3in8v1UarGmkdr1TnKxCeWd3z5KXZQbb+qsiw7588nrUMq9jGLtRB0TdenqZYpC+W9JGVogvJuNZZ7dtF6FROXNpg7UJwyYEJq1PO2Ype8O25ZNuFZelpwi49b24nGk+5220zSOFeuge+bcNaDcux9kWWmaHr+J7d5B+G..7Mv1XZ+C7AnI2EGtNyuVzJAfgYa3yJA........bPdPA5K3Aah48Ko+XC+WegWKe66KbKi837in6UNoTcEHjHNNbZ8ErkZ4Acro9xPCGRIx6W4qtUcIuOLUq5cc4bp27dbSyMlqwtgzCl5ZHOrUuV39rOC85DWpv+L1y+mxqg129YJFOtDm6NW8n7PK106Cj1qZJfay04r0RWoDqCJYdfCO2UQyHNsW226MtFeOcg+C.fI0erzE.............LQdIh3sd1leue6pUxpizb6knpt5x+jc+e1y1O1iy2Z30pM40PdnASCnXo6yWxteI08eW39tK4gobH6y79vkXNUd8127gTkLVboF6tj0vt33fDMEyaFizwpcQU.vlhUtxovk7ZnS03wk9b2orGkOutsPceSbbupoy2m6yY+uI+7lnJ.hoAu9mwzeN0+D8+diqw2SG..lTB+G............eUzWHAZZ6VCgtoz59b1ukdb1WnVx21zsO80HOHfkFFk7W+9BxQIAmrD48m7Pwzk2xpg9VUvlB40ao82H5uecoF6tz0P93xP5YSo+J692FUq5c2GWl4Nc4RdMzoZ73Ret6T1i9Yb7b11V0USe7WhSOFuDmy9RDwelb+aSdc+cbb3.uzVaumN..LoD9O............fwJM7HcEzpWiH9nvaCwTEbx7vyLj.Dku8sEfmoz4Vuc4RM1coqg7fMMk8rg3k3zfRsIpVE0dMh3o3xLGZoMUiGe1N2MW5p3W9J7W5i2z1W6RcN6eEM2e+uw7Ehc..3aOg+C............XpY0W5yq0vX2bTCqgiqZ+cDw+NZdEZaWTE.vGi0UMO09JerMD4g46lFteZu5uaXebI6kME9vkJHs..v2B+qkt..............9RnqU9olB4TIdq+MY04q1Jf0ZXraMTCSsWhH9OQ0Jf2swog75lnZEc6ee4KsusVhyceY+s5UBwcwwA7Kc0H7mQY03bc9x0QD22vi+PTMWF..XFH7e.............i0UI+bWq9Sq8fg7RbbHatNF1pY00I+7kXUvJOjNW0viMUVCicSQMbtiwykWhH9uQD+YTEBveDGBA306u+esLk1rZpFO9rctaS9YRcTGBzemb+zsqDy04rOj7yuEGt9+t3q67T..Xw8GKcA.............qToqvRaZcq99ZSbb3+RCeVdHZ1Eqa4qlVCoduNNd9wRD9ugTu8MWdML1MG0v4LFeI76nJ7T+m33Z8ll27O8lpwiOam61j7P8cSx+st99cCaWsKw4r+HNDPweGUySeI62eU9SZkw6oC.vmRB+G............zrzfMjGRjlrIVeAJZn1EkGfiayt+Ks7y0620r1BeSIx21KQ.h9mr6Oj9aeGaqgwt4nFx6Y4yeWKdIh3uSt+0ssgexMUiGe1N2sIuEGebrK6+FwwyIxM2mydcDw8I2+uhpZ9OSdrMwwqLfqQeGeOc..9BP3+............flku5p0WnRVqgIZnJ43XSTsROUKeUoJ+92Fq6UEp2hiCiz0QYgH5p339UdHdlKuDGO+7ln7Ppz236ZXraNpgWhiC+yUwwygmBS0pIV9pY2WQS03wmsycaS5wPSg+qqZatOmMMTeuEGBh3+DGGJwcwzeN0T5656oC..LC1FQ7QxM.lC2EGtNyuVzJAfgYa3yJA........bP5+9gOU3y4onr+cGuIa6dMZObO2lss8suGZcWZMOlmSS0cegd3grsuo.erKaadNll.oLlw7RjWuuGcupqsIpNlJsuMlwvtjOm68n+vmkOt0VObtF6FROXNpg78YIy06S9wTe0XIADLcd0XmiW54Iy40P6yTMdL2m6dI5Qahp5N8Zpoy86ybcNaZc7QbZf4xq62OyW2u5um9b89W...WXaio8OvGflbWb35L+ZQqD.FlsgOqD........vAycnLdMNMr.oge3533.U8Xg66gV2Wpv+k9b9QbZvHttg8aWAS49rs888621BGxlnp+10pG0bFdh7ftTWu48gahSma7PzsoN7eMsOeOpBsRd8tKaaSmm1VObNF6FZOXNpglB.4CQygEaST0O6Z+kWi4gtJuVesiWuqhSuFxXCm3bFFoobt7TMdLmm6do5Qo8h7f.Vho97kqixN1yCJ2iEVuM4q96oOmu+E..vEz1X5+C7AH2cwgqy7qEsR.XX1F9rR.........GL2AEnoUlp1t8PCa+TU2Wpv+sKNcEw5486q7PST+6FypMWcnKdJ416w7z6Fp1p21pyRBOTDyS3+ZZELqu5sN7TkzCm5wtyMPTSQMz0978j8W578t5QW0x9po4F4gopsWuoX98bFFoodt7TMdLWm6do5Q4qLc02JY0hr1Td9R50V5aE8K+3MeEBrTycudoeO8o57a..fE11X5+C7AH2cwgqy7qEsR.XX1F9rR.........GbIBkwsQygFI818621uBg+aSCO2lt8XTdnAXStkC..f.PRDEDUTZZ01puaMsxekWuyU3ItI5eLuNPLktpbMGg+Khpwf7Ump1p05.4TZ3+hXZG6FaOXJqgZkbdco0Z9JeVayQ6Z6Z5ZJCIzW4J87jKw0PKwTMdLGm6dI6Q4yyGypn2Tb9R9JoXe8p7Pv9dLt4uWhd8R9d5i43C..XEZaL8+QQ.j6t3v0Y90hVI.LLaCeVI........fCtTgx3pnJL.oqDROu+wRWMjxCJPageXn08bE9uMcrM6hpU9n7i4Gh9CVUatY+yOu1pWUpdHpBlQWqvTWpvSrYes7XbZO3w8+tgDtk4J7e0tNplOl957ZbnVSkFrmmKb+OEicmaOXJpgb2FmNOudt0iQUupj82t8aeZnhdNNMzTWs+wxmWUeLT5qWelyvHMmykmhwio9b2KYO59rm2XWA8hX7mujuBU9Zgud4AFbLAW7q96oK7e..vWDaCeg1Ale2EB+GvmSaCeVI..............9h6OV5B..................fiI7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e..................qLB+G.................vJiv+A.................rxH7e.............WZ2FQ7XDwqQDeDQ7dDwS6e741GI2d5B750lkrG7U0ZYrEf0rOqWqrz59y5wG.PiD9O............fKkqiHdNh3gHhahHtZ+iuIhX29+6Wc5AKq6ipfV9ZTMV.mCym...lU+qkt..............9V3pnZE3IMba+Nh3k8+70QDucoKpKL8fk0sQD+X+OuIpV4E+eVtxgO4LeB..X1I7e.............WBODGG5s+Lh3ux1lu5q5ceE6AWGUqXgQb5wxZSdu8pF2po0mo9CCyRLeB...VA1FQ7QxM.lC2EGtNyuVzJAfgYa3yJA........vmMWEG+u06iKXsjVGOcAecWS8fox6wxzKaSeisWEGWy2Oy0yZq+vz5ROeBlJK06CdtJst+rd7A.zHq7e.............ysaxt+OWjpXY8UrG7YaUJ7sHh+cTMV76Hh+dle89r0eXXtzym...9FR3+.............tz9JD7sykdvx3sHh+ZoKB9xv7I..fY0erzE.............vWd6V5BXEPO....fAQ3+..................VYD9O............9JXWDw8QDOEQ7w9aut+9+Hh3pVddejb6oBesReM9nksYS11jtpucSDwiQDumTmOzQMd09e+yI6umipiqMEVyiwM6ecSOdeO5umV6GQyG+QbbuYH891rY+q2Swg9Z8989Bp09baTMl8Zbbu3w8+t1Lk8fwVCc4p80XS625dWW0cpcwoGSsc9wPL0isCcd2Pu1xTze1DUio0m+Uebmd9WIm6200gZ55JCYe2jwLepMS478w99Cknj4SW5wgRLUiUm66STat5QoOmOJX6Skd8lm6X6F6b0MMTekzySeekO1e+oR50aG67w45yUA..qJaCe.Ff42cwgqy7qEsR.XX1F9rR.........GrIp9B12TnZxu0THDlyuj54eg9KoVyCJv88r8uGUguXJsKNNDCcc69n8.AjGPgttcNg+6GwwgznqZMF3q60wogynoaOueaap1N2dv4VCMoNLMkVaoiwk9blh+c8miw1RG+G60VNm9yln+y4SO2ujPvk9bpCVTIWWoz4RQbdymxMky2O22enDkNe5RLNThoZrZpdehTyQOJ+ZvkFbzaxddMEvtoXt50Ya6q8TWWks8i88NaZebaz80aKc93Xpuw74pJ87sy8+yE...Zz1nrO.C.mi6hCWm4WKZk.vvrM7Yk.........Nnou38Os+VZvDZ6KT+k5Ko9tFddscqNzCCIfFSU.Qtsk8ecOsofA7bzbvNtsim2SY2tugmeIZqG0zbfOZX66ZL+5Fp6m63X583z.Dct8fonFxsqgmW8ysd+ldd0iYO+zZtsme5swZtFaKc7erWa4b5O4q9Y8Md+Qze3eyu1RoWWozf9btymRM0y2O22enDkNeZtGGJwTMVMkuOQp4nGkGVttl+kJ+0Nu1mx4pCYk7KeEVbpBsZaioiY9XomSjR3+..3SmsQYe.F.NG2EGtNyuVzJAfgYa3yJA........TI+Kq9OhS+B5e09GusuL8Wpuj5oq9To040Mr+dMNNL.OFG+ks+l3zfOcNgWoVd+78n491t3zP0zWuqzd1PjuhPUWuMMGnsfW1VceUbb3MdNNDJyT4qLcc0GFZOXNpg7UYplleUaSTMmnqvkMWArXNGaKYalhqsT5qUtGiCgwoovRkOd+ZKaWS0P50gdHNLtWOVmeckm6oVmx4SS878oZLrOiILRS83PIlpwp478IlqdT9p+XIqBgoywxCL3bbs47dUIqjrS071zd4TLebLW2S3+..3Smswv9C7AXLtKNbclesnUB.Cy1vmUB........nR5WV9w9k69R8kTuquP+Qz7JT0GQ0W79lrIN8Kjeeq.XcIOLC8s59rogZtzUqno3eq2cY6uRVMhZZUjpsw7z5suUrpahxFyFZOXpqgMwoqFUsUqkZNBXwbO1Vx1LEWaozWqbkrRdkGBntFGmqqqL0yml546S0XXeFSXjtzWeepFql62mXt5Q4AVrui874W462438GxCmYd.6xGCO24zCsWmO+oovN1z9V3+..3Kqswz9+HG.zj6hCWm4WKZk.vvrM7Yk.........pTZfBJceL2g+qqZLOf.eDmtZCkKOPC2WPs2l7vSURPSxCDv6Q6gfXpC+W9J4ToAiIuNZZLOO7Y8E7r78aaiaCoGLG0P9po24rpQUaNBXwbN1FiXatDqJbiQZvm55ZEC45PQT90Ulx4Syw78odtdaFSXjlxwgRLUiUy86SLW8n7Znu2aM8378re2b89CQz8J6WdMURHg6xbNebLW2S3+..3Smswz9+HG.zj6hCWm4WKZk.vvrM7Yk.........pLEe4tuTeI0+H5d0AposuufUrIlldP99IeEGpKktBjMkg+6bp27PV1TOKM7Y8ERj11uMMVOjdvTWC4ge40B2m8YpCXwbO1FS31Th4L.JoyQ5pOkeck9BMTIWWYpmOMGmycoB+yXBizTMNThoZr5R79DyYOJO3hc89wo8q7PtMWu+PszUJw5fRlG3vycEaMhS60884SFRudLyaE9O.fN7GKcA.............izOS94cQ0Wt+99BruTdIh328rM+S18+Yia0A+d+9sVIq.QMIOjg+8.dt403XqggHud6qOkJuG229ujsOhiGGh376CScMrKN9bigLFeIM2isk5yv0VFy49uDQ7VOaSIWWYpmOMGmyslGCmpwgRLUiUW52mXp6Q4yqZKb82DG2uxq8498G9uI+7lnJ7goqJe+Ll9qe+OQ+e9joZ9H..ifv+A...........vmU+U18uMpVUitO5eEC5RquuX8Sw9crAaI+4kGTgt7VVMbI56406PB8UeiC6F49NOjJmSvHliZHebYJCJ2TZNGaGh0x0V1DUgM59nZ0qJcUAKeEIqDk1i565JS47o45bt0xXXSlpwgRLUiUW52mXp6Q+LNdNS97tld7WhiON++yd2eW01X8uOru+NqoAnE3WIvT.9.dJAdKAlRf4PNjTBjRfTBjCRA.k.oDHkPdOvVKKusjkjsjkfbcsVdkXirzm8ez19YB2O6ywmO7ZR9uZO+1ZW2ekcCG341XLeD.fifv+A...........vGUul8+Eg+hrdWx4srNrLs8K3OaU1GMjPcTd7mi96SsdOjxPo7V1F1ptdrjqgxvlLl8YioobrcHl60VtLq2o5dOIOs45dcVN61Vi47oo5dt4dLboXrFq9n84DMo9t3W4N7W8WuoiO4784CeIM2+9uY59+HA..XAS3+............3irulj+IMuC7bcVGvimhcoF5mkv7jonFVBsqOZlq0Vp1g5ts30+dVGJn+ayi4b2abLayS4bSe9vm611PUFluaZ3406u9ZwO+b1WVVqIK2PaC.vD6um6B.............NQulj+WVuCGca1+Wf+ax5crm+47WZ+w4y1tRzwFvpe9IqF9S04dskay5c7uJ+LqC7WYHjp7Ybmqarmu6yGVdlqOm30MOp1MDuN6duU86m9V5tNmp0luJIOzvq+XVOWF.f+vH7e............7YwqI4ey5cEqaSxcYaHOtZyy+x7TZKZulcC8vUYX6vPWU6ueN1YhJCNwkM7ZikkPPKFiZ3TGiOWNmisCw4XskKxtA9oJzZKw.0Nkymlp649S8yGFqwpOZeNQa9V1VKUAA8W0dd8iqKS0b0x..e4l+904y67T..Nf+ZtK.............Xj8qr9WN9xfybSKGakKZ3m+mfxvEMjcSrqxt8ayQ3+FR810XbY8OG6rZSQMbJiwmSS4X6XXHqsLT2lcaC+WVlA+KYbmOctumaJGCWhFqwpOZeNQaJC02M09ypZ7WMbbImm4p2ksgS7WY87zWK94WV9lVX78p..FYB+G............eV8ZR9ZsmeUKGS8edW+hpeQVtAm5X0VXH5ixi8bDpiuW77gLdzUa6yZ3+J6ytcDNmSgobrcL0m0VFpx.8T1WTZNCUyXNeZttmaJFCWhFqwpOZeNQa9Y1ssbcwelr67h5l54pWkc28O+RVWu+WsW6hr6NC3RjuWE.vHS3+............3yrt14rJ2ow5JPCK0PScJ9Y1MfHWk9EriKyt8GkgpXp7Z1cb6lz+fCz03W4N9zs47uKKME0vqY2.YbYVuCRMlFivnMkisisgtq70U+yPFiuHy6NU2XNeZNumaotyJNlFqwpOZeNwgTuczT3+Zq9l54p0C02Oy1PH98rafDuNi+52iIeuJ..9ivpj76ZO.XJbe1tNyOl0JAfgYU7ck.........VqOgM5kr8eewma3meS18eCx2Nv481hisq+cKqeLMcsK8bOOum56oIWWbddOGdmv5hrae6uyg+E3erpyJkiEumtmO7X1erqowkx9hWx3DvigzGLE0P44rqwr9nrMMF8SS4Xa54wLFqsjLr9mx1vgFaZp81lgtNTS0cSFy4SSw78wZLrK8s+cpFG5iwZrZp+bhyUezEYcsW8dtK6N26PlpOendM76ref4Jq42Owq6T1WuD9dUGS6C..FjUYb+OxA.M49rccleLqUB.Cyp36JA........r1aYcHXZJ7AWljmR+BcvaY+eQ0q+Kd+UY2v1TddayP+kOeNC+Wx9gO38MuV4uz92j86ydLG1XG9ulNmum0iwk060EGa8wu1FWdngy8co8vVTsSrcnciog1GLE0PSgFqs6gtHq6OOz4qrFKCBywFNkobrsO2WNVqsLj9mlBVU4tdXSW6wdcnj9OWcLmOM1y2GqwvtLkgQZLW2brFqlxOm3b1GUu+nLHfcYrmqdU5WauLnbO0iZsMSce8b+8pNl1G..LHqx3+ejC.Jce1tNyOl0JAfgYU7ck.........1+WV92y5eAueN6+KcdW+xe2zthTaOdrgiuMC8W974N7eIMGPjp5+4raHI5afNlh5Lo4cUptp2p.szmwk15Kdq14uoqQaNl9fwtFNz4rs6gNTezksbtFxbilLkiscce4Xt1xP6eJmiTert90tJrQSw5PMUGGxXNeZrluOligcoummodbnOFqwpo5yINm8Qk6NcUO5yNFYx3t1b8055ZG8qr8VtCA1WSce8b+8pFq6uA.fVsJi6WVGflbe1tNyOl0JAfgYU7ck.........1eGv4POdHc+Kz+so4.KTddR9bG9uj0gInq9hpPJzmcIoopNSVOt11NgVYsVERh9F9ujl28p55QS6jVImVHUFqZnRelu22Z8P2KdJgtXpFa6p9lh0V5a+yEo4..V+waY836EEudaAF5XFOF5b0wb9zXLeerGCOj91+dNFG5iwZrZJ9bhyceT47rgtS5MFyUKCwaW8UkAJ98bbyeWJqKLUeupio8A..CxpL9eYc.Jce1tNyOl0JAfgYU7ck.........V6xr9WT9mxt6bNU67N2kCuC5zz46ghy0Kads5mmxeI0a6W79g9Ke9RI7eIqaS2l86aeYyqcaFVfClp5rxUY83T8qyaYasVW8vV7ROO+2j06NQksip4ZOt45LjcrogZLpgR2t48UtK68bV22026gtdywWOnGuj9G5mCYrGa6y8ki8ZKCs+o5dupfE0V6sda45VNWmy.UMVymRN846i8XXalxvHMkqaNFiUi8mSbt6idn38dr6hdG6b0xcnx2540qLvfCMzhImu95456UI7e..L4VE+BsCL8tOB+GvGSqhuqD..............ex8WycA..................vtD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O............fktaSxSI4sj76j7dRddyqC.KO+t1imm4ZA..9vR3+............f4wCYcH1dKIWMy0xR0UI4kj7XRtIIWt40uHIWu4O4zsDlKtDpA....nSqxt++1E.LEtOaWm4GyZk.vvrJ9tR.........e7ca18e6y2l2xYQ5xrNLX06mp1w+ddye+lYq597XILWbITC.iK67e..vH3um6B.............9CT4NV2kMdTmGWk06hdIIeYFqiROlc6m9ure8Ym+6zsDlKtDpAnIK00GA..fYzpX2rAX5cery+A7wzp36JA........7wW4tZ2CyTcTuFVR6LSWlc+2F9o4sb9TaILWbITCPok55ieTXm+C..FA14+............fyuelj+II2jjekjuNS0wRcmy6lhm+sYoJ9yvRXt3RnFfRK00GA..9Chv+A............yieljuL2EwGDB+2zZILWbITC....KJ+0bW..............T354t.....f4lv+A.................rvH7e............7Q0EI420dbcwO6tj7bRdeyO+8j7TRt8Dtl2jjG2bdqttuu442kjKGv4pds+bC+7C09tbSc7Rw43tMuu9dcq65heVSGS4w+P1su3sbb8EYy6oo1ZYM2V+Uci03T4XvU09Y2Vb9GhCM1dSVOOsZd6aaZKsUyMMW3kzu4BU5Se6TMebrpgyc+1PlOVo97k1lyrjZi8wXcOxsYca6sZG+otl8kYcasoy6yY85WGZsl5Fx5iWrolqVCp9mAMj6Kl564JuV84yLK6GFq4QUlh4A...L5Vk98e3D.NE2msqy7iYsR.XXVEeWI........fsZJXD2ksgWnsGukcCoRWtN6FFgC83gLdgGpo12Ccb8eui1VeZCG5eW1Kx5fXzm26PB.X8v+00i15ul5wopwfGa37MTkm29zuVF9k9LW3lAVKGJHaSw7wSsFlq9s9Vu00mv+Udtm64F8wobOxUY2.r01iWR+WytJXb8c8j5qCz22SSsoKR28606+6SX1lx64pzmOyrp+uL7e8s165djoXd....SlUo+ewX.NV2msqy7iYsR.XXVEeWI........fsJCFQYfOdIqCcPaABqbWepI21x684r6tjT40cH6.e8M7e8MPKGJ7GOW6Q4644FdTpo.ZTcr06meqi1eopcIrl5SKqoGZ48O0iSU61gcEBn9n77VNdz1iCEtp1dzUXY5aHclh4imZMLW8a8sdq6XC+2bN2nON16QtJ6eeY0Z1McO66o6.EecCuup2a04s9ZXOU79Ok0GK2o95p876LrPlN12ykCb9ZqO3lhWqu09gtGYJlG...vjZU5+WLFfi08Y65L+XVqD.FlUw2UB........Xq5+6GVODCOk8CGvUo4vLbnveUFnr2y5cIoRWm8CEWWABpOGa8io9N+0iYavNtXScVFvwW53522Zntx9i6x98eWt40apepu5aHoZqtlpwoxcmvGyw2VaarsdeZSyYeqnNdJ6Fxmax9yE5JHl8s+XJmOdp0v4tean26jFpo9btm64F8wwbOxkY2Pc8RZNL1k6JccEhrem86+ZJDbUySOT36Nlw3m1br2ll+rkx1yasbbMUCi88bkiUssaDVulKuFGRe5+lh4A...L4Vkg8ezB.NF2msqy7iYsR.XXVEeWI........fsJC5QU3SNjxc5nGa43JCkPW6jRWj8CV1gpk9DLhlZeMENipqeYvLFxtJUeBSQ812TF9hgD9uy43TU+6K4z24oZZrss5tocawwbtPemGrTqg4ne6XBF1wD9u4dtQebL2iTuunqcfyxcatlZaWj82g3ZqOnuNlw39rtPYn6NTcNUisWVbbcstYSAqrq0l6S+2XOO...fyhUo+ewX.NV2msqy7iYsR.XXVEeWI........fsJChPeBnQSgDoo.aTFRv9DPlxy8g1YA6ScW195JXik6.dOzwwOz9tgTKmhgD9uy43TWG6PLjw1xPu76rdW.6PFxbg9NOXJmONE0vT1ucLAC6XC+2bN2nOF58HWWb7GJzYUp220T66gz+9r95XFi6q5gz6PiWS08bkqa1ztsWoxPK10Zyc0+MEyC...3rXU5+WLFfi08Y65L+XVqD.FlUw2UB........XqxfHzmvCjreHFJCTwEE+7WFPM02c0o9Drjx1WW6pTk0cWAVYngaYJCCSc8MjTm6wowJTQMcd6JPgkGeWgbbHyENliarmOdr0vb0ucL2Kbrg+aNmazGC8djmpcr8M.WkgbrdeRYXdequEdGlx06p2Gbn0slh64N1w+x2WW+d6z00XrmG...eJ8WycA.............ijeljW64w90hmWFZvxvyTd7Gx253berdMqaiGxuxt8Ai00tR8110Y8tG0bF9h4XbZHWi950rdr6P9dwyKq+RS8bgkv7wOh8aC0Gw1XW2iT+91xZuMkqsWuluN6tNzTbO5X6X5+Gq64J2k+5Z9R8yceGu5iwdd...7ojv+A...........vmEcEJh59UwwWtaJUFns9Fpvp5ndXc5ZmZpu5J.PMcbicv79RwyuMq2ksdHiW6bHN2iS8IHVGio3bVddG64BKg4ieD62FpOZswttGoL3Y8MzWkquWOzWk26NlAT6TbQVGvsGx5c9tWx1crtGNhy2XcOWY+0PV2brLEyC..fOkD9O............9SU8PDTFffxfILzvQT+3KOWej8ZR92hW6hjbWVGBvmy4s8dtGmlpfXAeVz08HkAO6srMPbc8nMkqeOGgYqtKy5cE02SxSY85iWmkSP0VB8WSw7...3So+dtK.............fOT9ZVGVjGx9Al65MO9VVGRPgkCntoXmTbt2cFq61rN3ek9d1cWQrZsx4vRn+ZITC..vGBB+G............LsgT6yX.3dMI+urdGj51jbS1MLG2j06rS+y4uzNZeFGmfktuejuue18gb1UF7ueljuj0AltIel1UXOUellG...iJg+C...........f+TcUs+9qE+rWytAy3pFNli8b+YxqY8N72+k0Ae4trMDfWs44eYhu9FmfOt9eiv43TWGXLbQVuanVoJfzKwPEWFXtKa30N2Fi4A..vmR+0bW.............vL3xr6NUWYvGJCrwP1gltp3b+mPnx9UVGxuxvtbyY35VmwINWpO26hVOJJUde1Xr62cJqCLVtM6NO3+xxL3eI6+4cW03Q0rwZt9TLO...9TR3+............3yhqS+ClPYnzJChv2533Oky8mYuljuV64CITIGCiSLWpOeoLHoM4hHfSISSnu9dwyucDNmC0kEOurlJMmAFsr1565lWlwaMcg+C..5Ig+C...........fOS5SnOtHI2U64+J6GhrelcCHwUoeAj3xhZ3mMbtWpFqvnbN2sq9SbbhkgxcOstl2MGARaIpb81ay9AmandM6FlrKytqwOF5Z8wgzFtHS+th5g7Z1c96Moeg5aLq4oXd...7ojv+A...........vmIOjtCYyCY2fb7kzbf09RwyeLGNfDWjjmZ3bujUFbttBeQeBHX8.hz0te0X3OgwIVdJmaeWZ+9iay50cXs56NnU2OdpA+5+Jdde9rftLj0GKCC5gt1Ozw45bno0MOz56WmweN7TLO...fyhUI420d.vT39rccleLqUB.Cyp36JA........r0ua4QSAw4pj7bww8RGm+6JN92a4beSRdq3HezI5i...H.jDQAQUeb.09ymvwTprMdHOj86OpG9hxfX7VZObcWl0g2n946XCeyPZCIy+3zwXnm2g1mLj2Seqkob93TUCSY+V4bo2xtge8prd9U0Ou79i1rjZi8wwLunbsmp6YaK7WU6VdGZG8qdec86uaZ8pKx50mNz4aHqOdcCsmqKNeMsF4XOWHo+iskGW472js6Tt0aW8cdSep8oXd....StUY79ePE.s49rccleLqUB.Cyp36JA........rUY3Bdo30dYyqWFRmpeVe1I6ZJPIUWumy9ggnOAJqoZ+XOlRCITOWllaaM0Ntp3m8d11GzT+6oDTtiIXRy43zwXIEvq9VKS47wopFlx9sx.e008RkGeaVRsw93XuGos6YeKauuso6cOlyYaqWcn5cHqOlreeZ81R8qYU.2lh4BMUGs4hr+mYV1+W1dGx7l9V6Sw7....lTqhubJvz69rccleLqUB.Cyp36JA........rUY3BtHsuyJU+wSoeA+qxMo4vi0T.S56NRTeBFwTF7iJ2l1aOO2yiq7wCYX8umZanxbMNcLF54U3+NtZXpCF2so64bOr4XE9u80ztwYWOZZm7qt9LlLjw29r9Xx507ZJ.f0e71l5+hhWusc5to9y.5SMWeN7TD9ujoYd...7oveO2E.............Lh9UR9+KqCYyMYc3.pBHv2SxqI4aa9yg3aad+2r4beYsy6qI4ma94eaSM7QxWy55+1rtsUEZuWy51T8iqpO3praevOyt8A+bxq5l8Ydbhkop6Kpt+o97sums2e0jKh4geayi52ydcse9Oq8npOsq0W95lG2lseFP8fh88rteu5yC55b0m0Gyly4+K6NW3xhZ+qsbcpNtyspZt5yLqFCR5dN7P+bzCYJlG...vjYUFu+eSE.Zy8Y65L+XVqD.FlUw2UB........XqSYGmB.f96k3ybA.fyp+ZtK...............fEsKx96fh...SLg+C..............3Pts34B+G..bFH7e..............veVtX.G60I4gZO+6I40wsb...Zhv+A..............+Y45j7VRtKIW0xwbYVG5umKd8+aBqK..fZ964t................NqtNaC2WkuW6ueU1e2A7WI4eic8O..3rQ3+...............t9.+rum0A+6mmoZA..HB+G..............7ml+MIeIqC72UY8t.X8v+8ZVuS+88j7sHze..vrP3+............3ir+u4t...9f5mI4qycQ...zt+ZtK...................1kv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e.............Kc2ljmRxaI42I48j77lWG9r320d77LWKCQeq6OpsO...lMB+G............LOdHqCw1aI4pYtVVptJIujjGSxMI4xMu9EI45M+I....7ozeO2E.............7GnaSxca96Wj06pc++luxYQ5xrd2Aqd.+9URdcye+pj7yycQA....mKB+G............b9Uti0cYiG04wUY8tnWRxWlw5nziY29o+K6We14+....3Sq+ZtK.............3OPeKq2E6pLWgt68j7RRdHaC.3RvkY254ao49ne0vqA....eJXm+C............N+9YR9mjbSVGfsuNS0wRcmy6lhm+sYoJ....fYjv+A............yiel4aG+6iFg+C...f+37WycA.............Pgqm6B.....laB+G.................vBiv+A...........vGUWjjeW6w0E+r6RxyI48M+72SxSI41S3ZdSRdby4s5599lmeWRtb.mq509yM7yOT66xM0wKEmi6179560stqK9YMcLkG+CY29h2xw0WjMumlZqk0ba8W0MViSkiAWU6mcaw4+Tc4lZ6orterrteH8eGQbpZ+iwbv5G+u63XKUcu7u2bdNjaSy8kcsFvEMTi8oeu972eu44ik5qmMz62qLj6epT+5MFywA...9TXU7+XIfo28Y65L+XVqD.FlUw2UB........XqlBnycY2PB0zi2xtA4pKWmcCQzgd7P5Wfb5SXbZp88PGW+26ns0m1vg92k8hrN.U848Nj..VFdpC8ns9qodbpZL3wFNeGqpPz0219gp4yU6+TlCVNN22v3dSw6qsv0cU1O7dM83kCTiWUbru0QscYww22v0Upoyws4vqm0086G5b2k9F9u9dtGi9H...fY2pLN+GD.fC49rccleLqUB.Cyp36JA........rUYvjJCQ0KYcHSZKPT8YG851VduOmc2YAKutCYG3qug+qugD6PAB54ZOJeOO2viRMErppisd+bWAlpT0NoWS8ok0zCs79m5wopc6vltNGiqaotpOVTu+9oCbtNWs+ScNXYP4NTaptxqaS08UY+1Y0Z.M0G7dZOfpCYm7qbGVbn65kUJG2ZaLcH2u214tOD9O...fFrJm9+AA.nK2msqy7iYsR.XXVEeWI........fsp+ueX8vA8T1O.NWklC71gB+TY3adOMGBnqy9ghqqvszmisLjT0aqUg84hM0YY.Geoiqeeqg5J6OtK62+c4lW+PgkpK8MzQsUWS03TYfvdLGeasb2kqZLtoPbUMFeSKmqyU6erlCVtyQ1mcfv5A2qo.CdYww7RZNbuk6LnGp8W1W0zXyPBIXWpedp2WNF2uK7e....ijUwuP6.Su6iv+A7wzp36JA........rUY3o5S3aJ2AwdrkiqLLQcs6ZcQ1OrPGpVFZ3+pdb6At9kABpsvhMjZnt5suoL7NCI7emywop92Wxwu6tUUCk6BcsMt1kyY6erlCVFVwtZ62ziyY84LcsiFVd9Z65WFPyx.1UNNdp2SLz95x4PGZmLU3+....FIqheg1Ald2Gg+C3ioUw2UB........Xqxfxzm.kzTnYZJHWkgDrqfz0z49P6rfGS3+5JXikgp5gNN9g12MjZ4TLjv+cNGm55X6qGx30Wdta+iwbvxqeS6je0UuM9dC+7qKtlGJ7iUpOG6PW+Csy9UVWmRfPSll95lN2B+G...vIXU7KzNvz69H7e.eLsJ9tR.........aUFVl9D5mjCGnmj0gSp9OubG+ZHm6114tNlv+0U3hJq6tBXyoD9ukvN+24dbZLB8XYv2d6DOWm61+XMGrLzhGJPk06uZJfaOU6m2UPBqTt6+cnqe8cJwpfRVF3vicmartx95tBY5PteW3+...3Cn+ZtK.............Xj7yj7ZOO1uV77xPCVt6oUd7Gx253berdMqaiGxuxt8Ai00tR8110Yc.tN0cAuSwbLNMjqQStN61mcJmuyc6eLmC98hm21NV3MY29qx5t78VddaS4ZEGp8+u096Wj0APrdHP+VN84Ek9dV2WdHS886...vLS3+............3yhtBkTc+p33K2MyJCzVeCUXUcTOzNcsSo0WcEDnlNtwNXdeo342l06bcOjwqcNDm6woWS+GGZS40ougUqIm61+XNG7aY26Autkiq9q+Z1uMV995a+Y45EGJ3bulj+q1yus108WY2vAdtMk2uC...yLg+C...........f+TUO7OkA+oLPQCITUkGeagZ5inWy9Ac5hrdWP6sj7bNus2y83zoF7uj8mqMzZttO5ySquK9UtC+U+0a53qTFZw2Rxu64ig3Ko492+Miy7B...f8H7e.............CwWSx+jl2g0tNqC.3SwtPVazurUYX9togmWu+5qMbNNm8mME9vSI7l....GzeO2E.............r.Lk6bWeF2UvdMI+urdWr61reHstIq2Q19myeocz9LNNMDyQ6+0MOp1MDuN6Fvu56FgeK8qFaJTp8wO63meURdngW+wr9dA...fQmc9O............9S0U096k6dWkO+pLLG5b+YxqI4eSx+uj7eY2vYcURt6Lb8q6iv3zoVyi44ZILOs9toWSgHsoi6P9eG4itN+OV6uWOnfWmoedN...7GJg+C...........f+DcY1MjQk65Wk6vXWm96phy8m4v+U4WI4KYcHpp22cSyG9ndcq6iv3zoTyi44ZoLOsLzc2T6Oqpue0vwUortOk9y1bW1FTxek0yyes3me4DbcGS0mqbQqGE...rnH7e............7Yw0o+gZoLTZkAHps.IMFm6OydMIes1yOkc0t93i33z2Kd9smv45iX6uzOytsiqK9yjcmSUZpC+2UI4gZO+KYcM+e0dsKxt6LfKQ06mJC9YStHSSPJA...9vaUR9csG.LEtOaWm4GyZk.vvrJ9tR.........a86hG20i2yEI48Zum2SyAg44hyceBV0kEm625Ys+7IbLkJq6Co9w8ROO+c4tAb8ayPZCKgwog5khyael21lkX6eHieIqC.Y86GylZp505JDoOU79Gycgu5iUukcWq3wLdiiISaecYs1UnSKuO9Pm69V2Sw8R....mcqheg1Ald2Gg+C3ioUw2UB........XqxvozmPsz2.6bcww8dNbHjtH6GpqCUKKgv+UdrcEZp9ryJVuO3XC3yPZCKgwogprl6y719dtVBs+gF9ux.4VO3Y8ITpk8AujwI.fkAfqLXkMEj3S45Nk802TbbkAYrtaKNVg+C...nlUwuP6.Su6iv+A7wzp36JA........rUSAToJ7PkAa4prePY5JXQkg+48VN22jc2ox9cVGxv9V6yU3+dH62eTO7RkAY5srtc0T3xtL6tCrcJAZangGatGmNFkgPspVZpu8hrtursfptzZ+Cc7KY29ixf.1Gkykq5CZKLdWj08Gsc9uJ8qsWFTtm5Y81jotutbr+srafFuJ6NNTd+7oV2B+G...7ovp3Wncfo28Q3+.9XZU7ck.........1pLLIk6nYur40KC8R0OqO6jcMERqpq2yY2fJ02.U0TserGSogDFnKSysslZGkgg58rsOno92SIbOmZ3wN2iSGq1p415aOz0eI09OlwuxcltpG84dzJs0G7V11OzTeQSpuVRW6neks2xcHv9Zp6qaZGm7P26Wd7mZcOk2KA...b1rJ9EZGX5ce1tNyOl0JAfgYU7ck.........1pLLIWj82spZ5wSYXgJ5lzb3oZJzV8cmJqOAg4bD7pxctr1tlG53Je7PFV+6o1FpLWiSmhaS+p49zWrTZ+G63WYHROlcQul1cC65Q4tsX4NoXW8Ukgn88bby+OW2u20bjG1brB+G...PCVE+BsCL8tOaWm4GyZk.vvrJ9tR.........a0VXRtNq24pdo3m+P1OnO80EYcvYdp379xlW61Lr.+rTB+Wx59qmxtgB5krenmtbyqU1GTsypcWN7NjVecrgGKYdFmFC2l8myVcMeJ8uucIz9O1wuGJdeG6NnW17dergZoZt5iYceQYeZ4Nb4a875UFXviI3hmq95Ky595x4GOjc6OJC+WayaD9O...3OJqheg1Ald2Gg+C3ioUw2UB........XKgIA....3So+ZtK...................1kv+A.................rvH7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vByeO2E.............bB9+l6B.....fofc9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+.............V5tMIOkj2RxuSx6I44MuN7Ywuq834YtVFh9V2yc6atu90YMM..fdQ3+............f4wCYcfOdKIWMy0xR0UI4kj7XRtIIWt40uHIWu4OA3iBqoA..LH+8bW.............veftMI2s4ueQVuCP8+a9JmEoKy5cBq5gg4WI40M+8qRxOO2EE.GIqoA..LXB+G............b9Ut6NcYiG04wUY8NNURxWlw5nziY29o+K6We1kr.9n3y1ZZK0O6...fI2pj76ZO.XJbe1tNyOl0JAfgYU7ck.........936xj7d19u84CyTcTuFddlpglbY18ea3ml2xANKpOmeIc+XW5acO2su475+YaMsk5mc...e5Xm+C............N+9YR9mjbSR9UR95LUGK0cYpaJd92lkp.fwwms0zVpe1A..7oiv+A............yieljuL2EwGDezCJC.0YMM..fd4ul6B.............fBWO2E..iHqoA..bTD9O.................fEFg+C...........fOptHI+t1iqK9Y2kjmSx6a94umjmRxsmv07lj73lya0088MO+tjb4.NW0q8ma3men12kapiWJNG2s4802qacWW7yZ5XJO9Gxt8EukiquHadOM0VKq415uparFmJGCtp1O61hy+o5xM01SYc+XYc+P5+tG1T09Gi4f0O9e2wwVp5d4eu47bH2ll6K6ZMfKZnF6S+d84u+dyyGK0WOan2uWYH2+To90aLliOEZZs9p13CY3qC0jictzXsl1wd8OjiY8lk5mc...vY2pr7+erDvGe2msqy7iYsR.XXVEeWI........fsZJfN2kcCARSOdK6Fjqtbc1MfDG5wCoeAxoOA+no12Ccb8eui1VeZCG5eW1Kx5.izm26PBwQY3oNzi15ul5wopwfGa37crpBQWea6GplOWs+SYNX43beCuzMEuu1BW2UY+v60ziWNPMdUww9VG01kEGeeCWWolNG2lCudVW2uenycW5a3+564dL5ipqOq0WMW+Xt9m5boScMswXtboSY8l99dZa9xT8YG...b1sJ86+wR.bJtOaWm4GyZk.vvrJ9tR.........aUFLoxPM7RVGph1BDUe1Qutsk26yY+cap5W2grC702v+02Pabn.A8bsGkumma3QolBiR0wVuetq.SUpZmzqo9zxZ5gVd+S83T0NVUeB5RebcK0U8wh582Ocfy04p8epyAKCJ2gZS0UdcaptuJ62NqVCno9f2S6gLZH6jek6vhGavkJG2ZaLcH2u214tOVxg+qs4gMsVzua33655OFykNk0zFy4xUN00aVpe1A...mcqxo+eP..5x8Y65L+XVqD.FlUw2UB........Xq1B2wSY+fPbUZNzBGJ7Skgu48zbHftN6GrgtBWReN1xPRUusVE1mK1Tmkgc4kNt98sFpqr+3tre+2kad8CEVptz2PG0VcMUiSkAB6wb7s0xcWtpw3lBwU0X7MsbtNWs+wZNX4t+Ue1ABqGZolBL3kEGyKo4v8Vtawcn1eYeUe1c2Nk480OO06KGi62G585IK2v+UF.2p46MsVTYanOW+oXtzPVSaJt9i45MICer7b8YG...bVrJC6+nE.bLtOaWm4GyZk.vvrJ9tR.........a0TnN5J3.k6.TO1xwUF.it1cstH6GVnCUK8I7DM09t8.W+x.Acnvaz2Znt5suScm65PNkfxLkiSU8uujie2cqpFJ2AtZabsKmy1+XMGrLHPc01uoGmy5yY5ZGMr77010uLvTkArqbb7TumXn80kygNzNY5wD7tkX3+tt37zmc8vl1k.6aP8Fq4RCYMsw95Olq2TYo9YG...bVrJ9EZGX5ce1tNyOl0JAfgYU7ck.........1ZHA5nRSAgnofbUFXjtBRWSm6CsyBdLg+qqfMVFppG533GZe2PpkSwPBJy4bbpqisuJ24xNk9xyc6eLlCVd8aZm7qt5sw2a3mWFHrtBCVxtywNz0+P6rek00oDHzjooutoy8G4v+UtqQ1m46I62VZ65OUyk5ae4Tb8Gy0aprT+rC...NKVE+BsCL8tOB+GvGSqhuqD........vVkgkoOAkH4vA5IYc3jp+yK2wuFx4tscXoiI7ecEtnx5tqPYbJA3XIry+ctGmFifqTF7s2Nwy04t8OVyAKCs3gBTY89qlB3V8.g0UPBqTtiocnqe8csrpfRVFRqScmTKY+95tBY5Pte+yP3+Nk46ki2sc8mp4R8subru9i45M0sT+rC..3Sm+ZtK.............Xj7yj7ZOO1uV77xPCVtaRUd7Gx253berdMqaiGxuxt8Ai00tR8110Yc.tN0cAuSwbLNMjqQStN61mcJmuyc6eLmC98hm21N31MY29qx5t78VddaS4ZEGp8+u096Wj0APrdHP+VN84Ek9dV2WdHS886KMkyQZZtPa567hodtz495Olq2bJVZe1A..7ggv+A...........vmEcEJo59UwwWtalUFJg9Fpvp5ndnc5ZmRqu5JHPMcbic3J9RwyuMq2IodHiW6bHN2iSul9ONzlxqSeC3SSN2s+wbN32xt2CdcKGW8W+0rear78029yx0KNTfsdMI+Wsmeasq6uxtgC7baJueeoor8Mj6c5yb2ywboy80eLWu4Trz9rC..3CCg+C...........f+TUOvDkg0nLDFCITUkGeagZ5inWy9Ac5hrdWP6sj7bNus2y83zoF7uj8mqMzZttO5ySquafUtC+U+0a53qTFbn2Rxu64ig3Ko492+Miy7B51oNeuKmq4Rmyq+XtdyoXo8YG..vGFB+G............vP70j7Oo4cPpqy5Pb7T97uKjcrzurUYX9togmWu+5qMbNNm8mME9v4JLUL9l66Mmhq+b2lpymc...Gg+dtK.............XAXJ24t9Ltqf8ZR9eY8tJ0sY+PZcSVuKV8Om+R6n8YbbZHli1+qadTs6jcc1Mfe02Iv9V5WM1Tvh5ie1wO+pj7PCu9iY88B74yTMW5ix0eJ7Y7yN..fIkv+A...........veptp1eub2650ravitpgi4XO2el7ZR92j7eYcPNtKaCxwUad9Wl3q+GswoSslGyy0RXd52pUGUAA5W0dd8iqOlpf38Xs+9Oy5.Jkrt+epmmyZkgZ6xFdswzbGpyw35Olq2Lll6O6...9v3ul6B.............lAWlc2sgJCPR4NL10o+tp3buDBZwT6WYcPM9eY29taZ9vG0qaceDFmNkZdLOWKk4okg56lZ+YU88qFNtJk08oze1l6x1.J9qrdd9qE+7KKeSKL0mqbQqG0xV45zCYrtOs4ywboy80eLWuYJLWe1A..7ggv+A...........vmEWm9GpkxfETF5h1BjzXbt+L60j70ZO+p1NvQxGwwouW77aOgy0Gw1eoelcaGWW7mI6NmpzTGXqqRxC0d9Wx5Z9+p8ZWjc2Y.Whp2OUF7ylbQVdAEq7dmgTe84diOig+aLWuYJct+rC...NIqRxuq8.fov8Y65L+XVqD.FlUw2UB........XqeW73td7dtHIuW687dZNHLOWbt6S3Qtr3b+VOq8mOgioTYceH0OtW544uK2MfqeaFRaXILNMTuTbd6y711rDa+CY7KYcfjpe+X1TSUuVWAA5oh2+XtK7Uer5sr6ZEOlwabLYZ6qKq0tBAV48wG5b225dLtWp97hem9GPtx64Z65OUyk563zTb8Gy0aprT+rC...NKVEe4Ufo28Q3+.9XZU7ck.........1pLbJ8ITK8MvNWWbbumCGBoKx9gr3P0xRH7ekGaWAMoO6rh06CN1.9Lj1vRXbZnJq49LusumqkP6eng+qLPt0CATeBVTYevKYbBMUYXjJCVYSAI9TttSYe8MEGWYPFq61hicIE9uxZqsvaWW4Z9G55OUyk563zTb8Gy0aprT+rC...NKVE+BsCL8tOB+GvGSqhuqD........vVMEPkpvCUF1fqx9AVnqfEUF9m2a4beS1eGo5wAT6yU3+dH62eTODGkA53srtc0T3xtL6tqUcJALYngGatGmNFMEHo15auHq6KaKnpKs1+PG+R1s+nLHf8Q4b4p9f1BkzEYc+Qam+qR+Z6kgQ6odVuMYp6qKG6eK6FnwqxtiCk2Oep08XcuTYa98rdbnb990EGa81ygt9i8bolp4CYJt9i45MMUiKkO6...fyhUwuP6.Su6iv+A7wzp36JA........rUYXRJ2QydYyqWF5kpeVe1MhZJzDUWumytAUpuAppoZ+XOlRCIjIWllaaM0NJCC06YaePS8uiY3d5i4bb5X0VM2Ve6gt9Ko1+wL9UtyzU8nO2iVos9f2x19gl5KZR80R5ZG8qr8VtCA1WScecS6.bG5d+xi+Tq6w5dol18J6Z9dUX1560eLmKkL76IF6q+gNmGy5MK0O6...fyhUY3+O5Efg59rccleLqUB.Cyp36JA........rUYfAtH6uCB0zimxvBUzMo4vS0THJ56NUVeB6vTGFnj824xZ6Zdniq7wCYX8umZanxbMNcJtM8ql6SewRo8eriekAA5X1E8ZZ2MrqGk6FYk6jhc0WUFDp2ywM++bc+dWyQdXywtTC+WR+Wq+8rMLlCI7eIiyboJGabf+awM...B.IQTPTgXGqqekwb8lk3mc...vYwpbb+O5Efg39rccleLqUB.Cyp36JA........rUagM35rdmG5khe9Co6vQzlKx5PL7Tw48kMu1sYXgVnOAg4bE7pqy51P8Pg7R1OzSWt40J6Cp1MptKGdGRquN1vikLOiSigay9yYqtlOk922tDZ+G632CEuuicGzKaduO1PsTMW8wrtunrOsbWJ6sdd8JCL3wDbwyUe8kYcec47iGxt8Gkg+qs4M8stmh6ktJqq658Cuksy0qq9XzKC3Zbrykp6TVSaLt9kFq0aVZe1A...mEqheg1Ald2Gg+C3ioUw2UB........XqyUvr.....3r5ul6B..................fcI7e..................KLB+G.................vBiv+A.................rvH7e..................KLB+G.................vBiv+A.................rv72ycA.............mf+u4t......XJXm+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+..................VXD9O.................fEFg+C.................XgQ3+.................9+u8t60MN5ROP.+5AS9ZNWACnu.VCvIeY.m7MgNcwlvI0YZxrB4WlS4G1.uoRINWBvx4RX8dAPg4JfZ1q.sAMK2m9v5mSU84zU0jOO.MjHY0Uepy+D58UGfMFI+G.................vFij+C.................XiQx+A.................rwH4+..................1Xj7e..................aLR9O.................fMFI+G.................vFij+C.................XiQx+A.................rwH4+..................1Xj7e..................aLR9O.................fMFI+G.................vFij+C.................XiQx+A.................rwH4+..................1Xj7e..................aLR9O.................fMFI+G.................vFij+C.................XiQx+A.................rwH4+..................1Xj7e..............v56mIu9TCt+2FQb+y26mR9r95yeu2EQbUC9boL2EQ7gHhGicsKOE6ZWtaMKTmgZ43nVOFsENGKyul7Vo9+b64rkk2Khcqm9gmu2ceNOF6Wq8xUtL9Vh0VoYtNNbfJ.sv6i8yy7kUsj.v7bcXuR..........sx6hHdH1ETr4IHTdhBcerKYhpkae9y+SO+Yj9Y1Evze34q4lJ7bjd+JIHrKwC874bQkt2Ls6ics0OFmmIwVqBz+ah8A8dIudnhe1uVcQredkGiWNNeN8EuJd4bdoudW0J0uMH4+NzPk4Kh8yKzWeXpiyw9LKw41yYqJuuK5eOm88Zp8ddtUmdpL05ucr1JM20g.ZGn8deH4+.NOccXuR..........sRoIGT5qmhkG.sWF6SRl494dekeN9Pb7IAXeOGNYQNMtKdYBidtoEA5ed8R2X1tDisu.iWRFLsOD6quxSF44zW7x3kyaj197TT2jr9s.I+2gFqLeSxO6Cm3x0aEmi8YVhysmyVTd66+.H59OuhOEGlD9k7YdtUmdpL15ucr1JmDWGBncf168gj+C37z0g8JA........b96pXWxR4DGfsl9RJtOk8ZnjmatmVXy4zQouWiEztikrS4Afc90szSLtaG3dJgJVt4LW46hWV2eto1A5eZh8zkDB8En7WzfO6WyRqW6adu4zWLeN095q6DYadj7eGZpxbZBKM0opKy24Xelk3b64r1k2748+Zz+3oKe9ZKIwylaY7svue4Tq+1wZqbRbcbd+Kd.bd38gj+C37z0g8JA........bdKMYmNGBNVdaoz.M9l3vSdiwBt1bWD8mDgOE6Bj2aiWl.dW77m46h8mTYG6ywEwtSnq7DA7wXYADbZBTjeZpI.imu4NWY9o7xXmLjaU0NYDR6a+TLd+vysD2XMkVu1WcZo8EuLNrdWhBWGR9uCMUYNse343Il5V24Xelk3b64rlk2KhCmyeo6iL2bJiuU98KmZ82Hr1JmPWGBncf168gj+C37z0g8JA........bd6bK3X4sk41+7tr2yTIXzEwKSLtmh4eJkLUPUOmmi9JSK4TSIMvqyOw0taA2u25VxbkcmnNmq020b8g7Shxo5SasoxjNm2Xm5PkzWL+jhpjSBJllj+6PkTlSSd8y04O2pNG6yrDmaOmsb81ZMFZNkwys5+knz0eeUt15uYsK..............vYqeMh3iIe8Ew3AY6CwgmpeeKh3ODQ7Ky7y8Gy75m5d8my9d4m7fS413vDR7yO+pyMKnbw788XWeoecsKHa.Wl80er2qh4Jc9swl2ZI8E0FwZIsurj+Clm70a+buWEGqRW+M2qh0Vk7e.............vwHO.byCB5N2EGF3teKh3OF6RRl01miCKGyMY8Ru9Om8mQ7xjCDZs79vagwYm6tL1WulOmwRHofYq36w90rtJleBvCukY811aNq+9pbsUI+G.............bL9V1W2WRCbQDw8Ie8OhH9Gh5dB9crRCj34lndoI0XeI+W90.b9IcL7qhSRHHQZeZqWArk7le8WI+G............uVbQDw6hH9TDwSQD+74+7CwtSbrN277Oq6UoI4ycOeudL48128uOoedoxKK8cMywEOWVdHdY8vmhc0Oi8790XY0MQxm0Oe99LliotLdtbkVNSS1r6hcOqCUWdr0QiUlZY+uHN95s0zcwgOq+RrsOYTlSY6p3vmstj96awgI23ZeRjbarueeZ+mt98CchMlKe72MY+rRFGLjictxze1mJ5oYmKetb223qOE6Rb0gZ+Z0bJKw6h9aWh3k0cyo9YLGS+pKyJSOT3m2bmCMsrM05SS8Y2IO4dyMTc8otMp1q2lVluL10lkt2gkzm+TMFZn4m9T7x0npsZu9ceOKc0+2GkOedp7Sq1SkZ09eJ5ql9YU65+RcyyeFoyq8XL+0xind6KXLsXb2VX+vyYt7wdcLyyWye+x072MqDSs9aMWasU6Wt10IrAbcT9fL.Vp2G6mm4KqZIAf445vdk.........do2EGF7s885qwtftKOfHmxUwKSJtwt+8YNAA5R92Bs6TUqj68SwvAw46xt1RCf17jw3cCbc0ntrSeA38C8bu5Tq5n9zx9eQT25sorj.RNO3V6q8Os7+Tz9jgZtOG4OCkjDRcR6W8T1OKuO4oJIvRcSbXvbO1q6KrL123uRFG7XLdezictx41t2kPHk94kV2zh4TVx3uT4ygO1q76+b+rqU+pz4FdrfO271qopWyGae+3WdQ2mRRfvgpOOl1n4n0q2NUe+mJ391p0k6qN7tnr4mlJIsma6SKV+tj4ZS6qOmxbZYskIvVDseNzZ1WMUKq+GyEwtDwpj5qoZ6Z89Bp83tNsZdsVud6XuF6ydpqateV8YM+cyJUIq+Vi0VOU6WtF0IrQbcngDn8deredlurpkD.lmqC6UB........3PCk3FeJN7+Q8+YrK.TySTswbU7xfV8qI267e1SQ+Ab6mhgKOepmWyUdxMLU47mQ+mpK4mBSenvO+RRvoZUW1IOXJGJ3t6Tq5nod1qY+uHpe81TJI3XycWLd81RNcuNVy84HOngmyozWZfBm+rk2depOgFyaax6e1W+9uFSGPy40U4iC55iNTPTOT86wNW4bZ2uI5+4O8yJMf3ymOrEyorjweo5NIY56yOutKOI3lymcM6WkO1ap4ux6SM05T4iAWZBRmdeJYNrgpOOl1nR050aKMgYmJopZ05x40o48WmZ9owlmdNiSZw52Ssmi7mo7qepxb5025S+uVOGZM6q1o00+iouDzpuO2oRh5Sw9Bp83tHZ67Zsd817Wk9YO00cr6YZs+cyJUIq+drqsdp1ubspSXi35PCIP689X+7LeYUKI.LOWG1qD........vd4IMvPmLHomRG4Ac5PtLNLP+9ZzeBqjeBfLU.jVqf.N2Gh8Aa6PIXQZ47wAtt7SUjRNUCRuu8kHFsntLsLl2O3gm+d4m.c0pNJ85aU+uHZWevwL29mWDSGz44IeSqSnfHl2yQd.+NmjS7pX5msoFezJ4OWOE8epLdS7xjJXNyiklbCeHdYfgeUzefoO2DInDk9dxa25J68k7GWD6pK6qss1yoTy0GxqymRoe10teUdawXI.Resa4m1l4RCz9RNYAGR578Cc51lpj5y41FUhVuda5dDdH1OloabR9ZbScJIV6wP4k2zxybleZnDbozwIsncHOoQ5F6kWebYOOSkNuxb6merZ4bn0tu5on9eH4y6Nzmae68cr6Sq1WPsG205401pq2tz5+Rdd1J+tYkXtyKM21iS03hZVmvFw0Q82HG.4deredlurpkD.lmqC6UB........Xm7SSroN0N5KoAF6e2wz.Gbp+m8eNmtW0LXSSUxo8VdPG1W4LO.Hm5j3njD6pE0k8EjweMFudnV0Qc2qV1+Kh10GbLyo+4EwKCB19Z+yqSW5Iu0bL0ywEwtxZd.BO2jyKMY.FJIjJ4jwr1xCp6RNAtxaKGKXj6qu7TAubd8vTIY4Rlqrj2yEwKOAWV53kZNmRDK6YdHsHYDZU+pz64X8KRGuklXOikPwicxbNGo8eK4jAsj5yVj7esd81ot17DBep1mZOFZnx6bmeZn0BJcLZsaGtI6ZJ4jpquSotolWI8y4Tjr5sbNzZ1W8TU+Ojz4QW583bXeAC0mq0yqsEWuctkw497rU9cyJwbW+cNsGmxwE0rNgMhqi5uQN.x89X+7LeYUKI.LOWG1qD........vN4ALZIACXd.DOz+ti4A4aIIqTZfFNV.SWyfMcIxOMNxkmXLSE72osC8k7SsptLucrjSRrRMUcTDss+WDssO3XJo+4MwKOIPFKXfyOMIOE5KHzG60iwxN4MJIwhpUhYNG48OK4zVLer+Xioxq+J8ThLuOyXA+7Rlqrj2S9o2zo3DWoj4ThXYOyCoEIiPq5WkdeG6z46qIWSZhpe+.WedRZeLm5no0ma0j+6Tsd6TiYx+OQfgZeliRGCEwKKu0b9oRWir1sC4qiVZe479XyI4+Vi8nNjkLGZM6qdpp+GRMVy5bceAmh401hq2N2x3RGm2x0Jp0ua1bW+cNsGm5wE072WkMfqi5tQN.5y6i8yy7kUsj.v7bcXuR.........6BZtkDzl4uug92cLMHeKMIpxSvmRBBv0HvpSe195.WybNoxRC9w9BZ5VUWN2.7dNlpNp08+xKC0tO3XxKek75wX7fkcoI3x8O+dG60bNopF60Gl3YnO4mliC89ya2a8ooT9m2Piy6SomvR40ekdZNle+K8zRoVI+Wd.aOVhlUSkLuaDK6YdH0NYDZY+p7DvoujtJMQ99P1WOT6X58cnSlyRkdR+ThRZKqcx+cpVucpSrnktF4XJcLTDur7VRxhDQYyOUxyUsaGNlwd422RZKN0yOVhkLGZs5qdpq+6ywdOVi8ETqwcmh401Zq2tjx3bt1yse2r4t9aosGqw3hSw+gSvIz0Qc2HG.848w94Y9xpVR.XdtNrWI........fi6jzpj.BbI267SXngB50ZGP7yUdvJ1mRqeyut9R.nVUWlGLk07TTXp5nV2+KV38uz9fiIudcpWkzGdoI3R96quWCEDsoWySwKSZvGigedJsuT5IH2TIVT9oFTKO0OxSjp4z+LuOzPmlgoWybRPj4jHjKYtxodO4icOUAgcIy6FwxdlGRsSFgV1uJueQe26z5vt1szww8kjOKIAGFxbmCqj1xZm7emh0aKM4HRSViiMwKin7wPQ10Mm4mxqK5qcqj10Z2NjO1aNyasjDwrl8IqkkLGZs5qdpq+6S9dHdHl29H1x6KXpwcmh401Zq2tjx3Ru1yge2r4NmTosGm5wEGUcxuYouQ............XEkGj+eqh267fY7yE999d1WW5IgUKbQrKIW5N4zRCr49Nc9x8w3vmmgRhrzu+2hW1NbppK+VDwOJ7d24XpiZY+uH1N8A+wye1oux+LtI1U2M1m0baapsuEQ7Gyd82EQ76hH9GhCqeuI1Ez5kDbtomzeS0Fk+ym6oL3bjW1mS+yuGG1dM0olT26oT+H65K49WS4edkN1pDG67tacsre0Oxte8MeR57he74+Ls8quwToumZ1VuEcpV2nz4ySutRS1gVLFZNyO88rqeIIoQKZGxKGyou7Zu96bT61+Z0WcKT++KYe8cwt8pbeT15na48EL13tsx9geMYK+6lcpcpGWbT0I+1k9FA...........fUTd.GVyjuJO38lyoWwZ6xX2IRxbN4BFxGi8mtI2F6BPx7.V71rquuxSpVUWNm.orF0Qsr+WDam9fcIMWtKicAbdW6+UwtSkl+Pzeaw2hC6qbSTVvF22mcD06zH5Gwt9sc806RtfKhcOOC84Gwtm4Ky95wNoUxCv3ahH904TXmg7.6dt8O+Vx8XImdjS46w95tSc.42hwt0bd2srV2u5iw91m7e9EIeuzDE4yw958ahCSPlqhCG202ZTulrUV2XI1RigN14mZQ6vwN1aqaK092msP8+2hH9SwgmtXWD6p2dWratveIFduUmq6K3bddssps3ua1Z4TOt3npSj7e............bNZImFKag6cKcWbXPA24ywgmz.2DkEfhoI+WD6RdqeM6qSqq5KQl1Z0k0pNp0OWas5sbeO1ch48PrOX8u74+d9oSSDuLXWuJ1dmBW+Rrqb0kjh277WOTf.meJicYLuSwtgRnVZqZO1p1y69VV5bBcim5RxugRz77SsyzwT4mTfu1Gqs0W2XHu1FCct1NrVds092R+ZrqN493k0Ec0OeL1kjfuVluy3o5Sc5YJI+G............LtkljRee5KoZxCd5uG6RlogNYwJI.p+1yuROIlRueKIwJVy5xVTGcprU6C9mic0ScI816hc0m48ExK+4mPWaE+R7xSnvRS9ukHOgZ2hZcBDbNmfBmyyor1F5DBM8zeJcMmqxttz6ymiCO4c9Xxeuu2yR8i37JoI1pqajZqOFpFyOcNzNLjVWF15s+aQcmHyWE6p+x+Ohiaicyg9GZXYXM2Wv473ospyg5zyg0ea99Yk7e............bNJOfCurmuWs7Gaz8sVtH1cJfzoKvfqQPH9wXeRWjeRkMzIwzXVq5xZWGcJ6+Ew1sO3OhcAoeWc6EwgIeSmuGuLodZcc1RjmfPCkjhWEGdJ+8KwtDgbJWEQ70r6eKR9uuEGljDicBF1mgRzpZo02+wbr0McZ47taUmh9UeN1eZhld8cq27i3kyuTRx+U5ZTiI84+lX6c5klaqttQms5Xnz41qw7S0nc3TtmizwMsbM5sZ6eeN064qDeK1cB+8micyY9tXexQc0ye8ujc8a48ET53ts97ZmiNGpSa05ua8wEG32z5O.............nAxC51q58p52Tmb.8k.PaY2EG9L8mi5E7z4ILwsI+Y2mYeIiQmsRcYsqiZY+uH1N0akHO.bGptHOI2dn2q57P9o9WoIVT2IaV58oEmjI48smS+mqhCKS0NXluL69epSfhiotIUKm2cq5TzuJc9jqR9yt2aei0R+d2j8mceV0ne1Vu88bZciH1ligtHNLIjVR+lVzNjWNly87XVioksGaw1+grV0+k3Gwtj7KOwIy2mxVdeAiMt6badsyAmi0osZtgs73hWPx+A...........v4n7DNJOHWGxkwzIp04VPQdY1WO0ogvbBD4uGSmXEicxksUpKqccTK6+Ew1odqDeKNL3YGpr9q8bcuqUEpEJusYn.4Ms896ibc8YnDpslNlOi7qsjmsahxmWYI2+ZJer6c8dUSqky6tUcJ5Wkm7ecmln88y6jNF7x3kyyViS8uHNrLOmD99T4bZciHNcig5NoYKQ97AKY9oVzNjW2Lm64bWi4TcRVcNMG5or9eo9Vb39wymiZM1WPMF2ctMu14fyw5zVs96odbAuBccDwOSdAPK79X+7LeYUKI.LOWG1qD........vNOFG9ueXIAC36xdOC8u63GR94OEkG.qkH8y9qU398on7+cTuHdY81TtKNrtHxtGSUu2p5xzmgOMw01h5nV1+Kh11GbLyodsSZY8mwvAoeeO+KIA.K48Wimi9BB3qxtl6KtT2+6+CE7dVRROj2muj.Z9xXWest2yiibsKoc7hr6+Sw3OaKYtxRZ2+ZL+xdtVMu6R52VixXoe1steU9mwMIe8Si7dtO48bWb3X4Zkn.2lbOK4jKcI0mGqsv5scl5Yqk6cIe9oRlmtz4mJotnEsC4O+klvN4y2MU6WZYuzDgoFqQM08ukygVRY4TU+eLx2iUtS89Bp03tsz7ZCoEq2N2x3b1yz4PcZp4t96bZONkiKZ43eVIWG0cib.zm2G6mm4KqZIAf445vdk.........1IMoz5BzwwB.4axt9w92cL+Z+ZTu.iLOHCO166CY2uwNIqxu1R92cMOvbSCt3RRHmVUWNmforE0Qsr+WeWeM6CNlkDjp4Ab9XANae0ueJlWB5j9dqUx+k+LLTf7de10sjDKJOIBx62bQrqL2ccKIIgy6+7zDk0KhWljBiMNou9xScJ5k21OUR2sj4JKocuuwhy8D.rUy6VyfDuEIiPq6WEwgiEeWre8mwB3+zjp8gjOyoRzv43xjOiRtukTeV6j+aKrdamod1Z4dWZ47SKYbRMZGx2ywTIOcDCud6XRWeZn6eMViZKMGZIiCOU0+CojDrLct199bNW2WvVZdsgrER9u4rmoyg5zTyc824zdbJGWH4+dE55ntajCf979X+7LeYUKI.LOWG1qD........vd4A22iwKS7nKhCSlfmhx92cLOIed546yPAG4EO+YOUBsjeeyC3x4F7k8Ezh4mHIWFu7TMaN+6tlFbt4IBXIZQc4bBlxVUG0x9eQzt9fiYIAo5bOM7Fpd9SwtxdemnNW972OuN4XRPit5q71weNPYHhCSLhklXQ4OC48Yx6utz1y7DZrq+SdRDba7xDRbpSVk9Z+5Jq42+qhWVGWRxhrj4JKs+aeIkwCQ+A78Ewt.6NscnUyoTyfDuUIiPK6WEwgymj99m5z3o6ZSeOy8j4bJo26oVqtj5yZm7eQr9q21YpmsVt2k7xaMmepz5hVzNjWNeJ1M2T9yzMYWaZc3Xk4zDrYr5fZrF0VZNzRGG155+w7XL7ZT8UOMTxHcp1WPsG2sUlWaHagj+at6YZqWmlaNq+N21iS43Bdk45n9ajCfbuO1OOyWV0RB.yy0g8JA........rWe+uu+OicAl2mhWF7eOzy2aL8kfH42+OEyKgttL5+dVZPD1m9RdotxXZPJ1ELiy8e20aGnrVxIQRmZWWN2forE0Qst+WDsoO3XVZPpl94WRRwkdhdcLuJI4+5dVRekG7touFJn4maRNNj76S9X979eK4zEryP8eFpeSoyAkeuxGG70X354oNkL6rj4JmS+2gpadJ5ueR98qEyorzwe8oUIiPDsqeUm79MOUv6ouxzTIL3bklrDSkvSkTe1hj+Kh0e81HJ6YqU6cI85tIp67S0XbxRaGFZOGiM1qKwkKoLmdcis9VsViZqLGZoiCac8+Px2yvPqQs1ye2xwciUtOkyqMjsPx+sj8LskqSyMm0eWxZqmp8KyqLWGyuyF.y06i8yy7kUsj.v7bcXuR.........G5hn+.HN+UWfLO2.Bru+W9epWSEHz2Mx6cIAFXI0AO9b45hrueomzf40AeXAkyZVWN25rVUG059eQzl9fCYo8EyCZ1R5Wc4yuuklDfeMF9D5aI2uOLQ4tlIkWdhMjJstbomtfotMJqNtKAKJQd+jKhgOglxqimSRCO24Jma+26h40+KUKlSYoi+5SKS9uHZS+pN4ymTR.1mmj5kjvfyUZR3L0oWYI0msJ4+hXcWuMhxd1Z05xoW2ME94T57SKYbRMW+tz4ZeJ1m7qkl7YoIq0X0u0ZMpsxbnyYbXKq+GxXqCl+59nr0Xa89Bp83tzx8ZNu1P1BI+WDK62ubqVmlaNq+tz0VOE6WlWYtNVVmM.li2G6mm4KqZIAf445vdk.........52Mwt.RNM.F+ZrKPXSCR3OEkG7fotM5+jaq6zQ3gXWPWVZxzcSrKfWSCxvuFyOIIRc2y2yt5fGe9qyOIyxCP2RjdhK7y33NQkpQc4RClxVUG059eQT+9f8Yo0q4Idyb5Gewyu+6i9OE45JKe5466swzAJ9Tmvec+76ic0YkD34oamiQR...YXdRDEDUkqiMwhFa7TZY9XlOH0Ew999oOGeM12+eNIk2P8S5FG70re98wxSVx4LW4wLuPd4t6d7gm+rFZbUMmSolAIdqS9uHpe+pN4ymT55Mo8QVxonaIJMAoJo9rkI+Wm0Z8147rUywP4IIVp9le5qO+8Jc9oiYMxZt98Uw90LSuW8Uukl7YCsuizDqYpmqZuF0ZOG5RFGV65+ob4y2m74Z65+L1ZTColye25wc4VyeOh9rUR9uHV9ue4VqNsOkt96wr15oZ+x7Jw0Q62HG.uO1OOyWV0RB.yy0g8JA........bbxSJE3TR+OFykwgwEwwjHmsjfYl2pROYkZUBFBmZomle4IuVpyk0n.d8w5ur4bcHf1AZu2GR9OfySWG1qD........vxkexTTqSUKnD5+wTRCr4OrxkkwH4+3srzS9LI+Dm6RSnuolO+bYMJfWmdyt96uYsK.............vIT9oYxmWkRAuUo+GS4pj+9GWsRAvX9SI+86WsRATGo+GQvuLw0ZMJf0j0eYS45voYCP689vI+Gv4oqC6UB........XuKlw0dS3zph5R+Opsmhc8OdbsKHSPeYdq6Cw9w.2rxkEXoR2axCEb8mKqQA75k0eYy35P.sCzduOj7e.mmtNrWI........f8tM1E.xuKN7zHI0kwtSFfel8ZnqGJk9eTSWE66ejeJQt0H4+3stKhCSDp4jL3vVvEwt9tk1G9bZMJfWudSt96ucsK.............vQ3lXexU04yI+8qhWFPf+Hh3OEQ7s1Vz3M.8+nl9QDweHz2.NG7iHhe2ZWHfivOhH96l40aMJf01ax0ek7e............7ZyMi7y9brKwq99IprvaO5+wRoeA.rUYMJ.VIR9O............Nm8mhH9kXWBWcUr6TXKM4q9Vr6zA3yQDeLD3xTW5+A...PyH4+............3b22iH900tPvaV5+waQ+MqcA...f2B9MqcA..................fCI4+..................1Xj7e..................aLR9O.................fMFI+G.................vFij+C.................XiQx+A.................rwH4+............d65ebsK......P+j7e............ucccDw+RDwe65VL.....fbR9O...........f2t9WhH9eDQ7kHh+9Usj......GPx+A...........710+ZDw+uHh+qQD+ehHd+pVZ.....f+SR9O...........f219WS96+SQD+GQDWuNEkp3tHhODQ7XDwOiHdJh3SO+8A.FxOSd8oUtrv1f9Dusn8F.1jj7e............us8uj80+WiH92d96+2dpKLGgqhH9ZDwCQD2FQb4ye+KhHt44+D.F1Ew9Dm9wv7lr8cerKI+eL1sOfyImykc.VSl+DXS353v+mC.fV38w94Y9xpVR.XdtNrWI........n19Kwg+6v085uF6hwfsdR.dYrK.PSK6cm3ee54+9sqVoCfyG2D6mG8CqbY4Tyo904k6hCaydrAeFspOwonry7YN.X6y7m7ljS9O............9WG36+eIh3eJ1kbf+imrRy78Pb3IT0eNh32EQ7Ge90uKh3yqP4BfshqhHd2yuFymiH90m+62F6RFPXKJ+jo7xdupCU53fVaIkc3sjsxXU1dL+Ivlw0gSyFf168gS9OfySWG1qD........Ta+9n+S9u7W+kX6cR.dYbXY7s1IUE.SI8jQsjSypz4UeKch53T+57R9o968Sb8ycbPDsqOwbK6bZXNfsgkLVk2NL+Ivlw0g.ZGn8deH4+.NOccXuR........PK7eDkk.f+Lh3uF6h8fe+JTNy8t3vx1sqawAfMmkjPKOj7dtqQkqsFI9y4mKic6Cnj9nKo8sk8IlSYmSCyArMncfoX9Sdy42t1E.JhfZGn09uElqA37k4u........fSu+KQD+SO+5+cDw+Rrc9Oe3Ot1E..dE3Wh8AU+cQD+5JVVfg78XWe0yQmykc.VSl+j2b9MqcAfd8WiH92e9OA...........1x9eDQ7uE6N4.+8qvm+MqvmI.u188HhO+7e+pmeA...mXR9uso+iHhqiH9+txkC...........fo7uGQ7+Lh3uOh3urtEE.nhROIUuc0JE...7F1ucsK.Lp+wHh+10tP............uI7+Jh3uaFW++6Hh2GqSB+8tHh6G3m8yru9yQD+wQtW2F6N8.uL1eJB9iHhu8768iwtS.q45xmu2cmXVWlcu6t+etm2a5yvTk+NeJN7TP7uYhq+lmecUx666w9S6qk9beQDwSIe8eL1+Ldaru99hjOqeYfOqKics0om5Xe64x1uF6pKmq6h8O2osIcsE+Zg2mKh8suW97edQbXem4VFOl1jV0mIu87OD6d9hXWcYW64Pu+H4ZOl58sb+pV9r0WYM89NVYMetvN2LvOqu1uz4mtMh3OOxm2X9Zb3IG3uKJud9oXWcTD6Zm9CY+7VLVbLmh4m6Tq4qhnMy4eYDwiIe8uFQ7ml38baDwGR95R5KjV+k2GXp1iZLNnOWD6ae5JakN1rux1P8kZ07CGis75ncNl8fMTY8XauWhZ9bTq86tkWypSM2a+Ve+Us79Vy0fRGCkNVO+dcSrq9qyPqQrj1kH19iC.............XP+9XWPTN0q+ZrKg+V6+SM+cQYk2eFGF.ootI1kzBkbOtO1m7IS4xHhGlQ4qu6aIk+beJ68MjKhcIdQIksKG3dLkz6QWBYM0m4cY2i6m35eJl2IQ1UwtDPZpm47jTJ2EET1RKi4OWCcOO11jV1mIu8Lh96i2mZUu2W4Xs6W0xmsRKqiceKcNnoZ+SeFW5bB4yYWx3hH10Vj99dWxOqEiEKYbTKGq0ol8sZ8b9okyGm3Zi3kycLU6xEYWedh+OU6wwNNnu6+cwt9TKcrYok89ttZM+vRrkWGsywtGrV1dOG0XujcZw9caQexicr5o3YcKs+pwbr22ZtFTD6V6drwPo2qah4W2UR6x4x3..............Fz6iwCTwsRR+04tXWfd9o3kAS5mxd02ID3cQ+OmCcO6BJ0oBDzaF389Tx8NMXZ+P+2llFnw8ELuckszfhsjj3XH4ACadYanWiEfxC8pj.n8p3ksKeMFt89oX3jfIOQTl5d8yX5jIqFsIsrOSdazPA1btZVu2W4XM6W05msRKqiED4oyCNz7QouFRZYYNIbapKyJCCM22Xe1+LNbN3VLVrjwQsbrVD0uuUqmyOOwNmJAByS9ho5Kjm.n482mp83XGGje+GZ+CyYrYok89ttZM+vbs0WGMh5rGrV1dWpZsWxXjx+wte2Vzm7XGqdJdV2J6uZJGy8s1qAMTeigZqymyujmwoZWNmFG.............vf9KwvAn3+brcR5u9L2STo7..8o3vSSpN2DuLoIFK3RuJdYc2Gh9CtyKdtbLTvr2p.MN+Y+cwKCr0Ke962WcRoxqC56y6pdJyOFGlHI40e2FuLwQlJgUtLNLnd+ZrOYvRkepjLV89Gh8IEPeAFb985wAttHpWaxoJ3zySzmGFnr0h58sR+pS4y1CIk0t4MxKqecj6ae2+R6ej9bjVWuT4m9bkbp5jV+0WBtTywhQTV8TKGqU69Vmh47yW6arSos9Vm7oIt+oIsReiKmS6wRZ6xmWnliMKs7z54GlxVeczHp2dvZY6cIp4dIa09cidJeq8ZVmpm0sv9qJwRuu0drd9m8Pmjmo2u79Kk7LNV6x473..............9O82GuLPi+YDwWhH98qVopbyI4+xCp0oN4EtHdYff1W.idQ7xSMhwR.hozp.MN8YYtI.zbzW+ogpm66ToZr5uKhWF.sich.kVuL0o3Q9oMxPkgoNYqh3kA77P2qZ0lbpBN8t59uFiWOzh58sR+pS0yVsFCje+ma+raRdukdh80m7.vep4Hyq656YrliEinr5oVNVq18sNUy4mt92CibcoIxWZhRLV+27DvJ2bZOVRa2bGaluWf9Rbl4VdZ87CSYquNZM2CVKaumRMeNZ09c6rkVy5T9rtE1eUIV58sli0yOwempcouDesz5tgZWN2GG.............v+o+43v.Q7uDQb8JVdlq4j7eODyOnKyCF6mhWFLroIzvTAJZIZUfFWyx3XxCD1w9rxCd3eFSmfQ4IQz8Cbc2jcciEvucRqGOlDcJhCCx2gtW0pM4TEb5CMFHUqp22B8q1BOakVVG59eLI+2wj.Y4ykNU6Q570Sc5vMkRFKFQY0SsZrVK5acplyOssZrSMyulbMo8gGp+adxiL0I01oH4+p4XyRKOsd9gwbNrNZM2C1ZVWWymiVse2Nao0rNkOqq89qJ0Rtu0drdd6RIIFadB+VZc2PsKm6iC.............3+zeM1GDh+yQD+sqawY1JM.auH6595L9LF6zmIOHQGKwGJUqBz3kbeWh7fgcp.NN+5mJ3byaKG5YI8jkpzDPHOowNlfvN8yen9a0pM4TFb5SEbyspdeKzu5T8rM0oySoiA569uj9Y0Z9s7.wer1vz4UO1.jujwhQTV8TqFq0h9Vmp47ySng95+llHeeH6qGpeU58cnD.s0iCl67NyYr4RttVL+vX15qiV68f0x16otO054nU62M0VYMqS8y5Zu+pRsj6aMGquzwE4uuRq6569+ZXb..............QDQ7eO1E7g+0375z9KUoAXadxILTfb1m7SenGR9Y4A9ZMBb2VEnweHd4yQMNgQxM2fscNmdic5NAo9YTVRgTZ6cdacImTICIO3g6SsZSNkAm9bR5tZVuuE5WsUd1JorNz8+XR9uRqGGR97kCUGleckbBDMlRFKFQY0SsZrVK5acplyOOgF5q7m1FzsNY5o5VeIMQIIixbZOVRa2RdOkN1rz6cqmeXLa80Qq8dvZY68Xp4yQq1uapsxZVm5m00d+UkZI22ZNVuz056yRp65qc40v3.3.+l0t.............vp4+dDw+dDwuOh3KqZIo8xC70uMi262iH9QxWe4.+8Hh3yyoPch8KYe8cwtju39X5Sqhk5GSeIG88sufZNOYCJsc46Ye8TIczEwtfb99XWvGmFTukbZksFsIGiuEi2ldpp2Wi9UasmsoFCrE8w3v5igRJnzu+2hxlu9XGKtlZUeqS07K+HNrMpu93oOie74+L84ruSlyz2yVds0bsbr4ob9gyg0Q2B6AqF00074nU62cHq4ZVm5m0VZp8W0x6asGqmWWNm1kZ4sz3.diPx+A...........71U2I92eckKGmB4A15bCD0zqO8dkGT6qQ.tVpuEQ7mx9dWD6NgYdL1Ez8GyIzyVRdf5ldBSM0qRu+OD6N0N9PrqN7lX9mPYmasISEbystdeM8Z9Y6T5iI+8ai9C98zDA6i87ySUqwhqoV025TN+RZ6T987hju22i8ILRZBlj+dtJNruwT8Cn9NGVG8bZOXiolOGsZ+taQuldVOE+mZvPp8X8sv3xWS8MfHBI+G...........vaY+iqcA3UfysSsgeMh3OD8epdbSrKYP9Pb98bkqkk+tSOq6x99eN1cRa8me9UombJulZSNGJiK0q4msSo7j3J+DeKOg.+0QtW0dr3Zok8sNUyujd+uLNLYRFJYNyS9uKx95z2SqRLFF14v5nuVlW90xyAmmpc+O8mgF32t1E.............3Ly4dRH7sHh+Xr6j43t3kIayswtD23Ob5KZMyRS9mum802E6NohR+4+RLbBJU5oExq01jZUuuE8Z9YaH0nr+sme0cx.cSb33mRS5qVMVbKn18sNEyu7sm+76R5uz10qxttN+H18rdSx64iI+89dOrd15qiR8ctue243szy5TdKt+lwnuAaBR9O............dK3awgAP9Uw7RnfgRdgi89tl9VDweJ1c55bWDw6h8IDxUO+0+x5Tzpt+XEtGWDQbexW2kPM0Lnfes0lTi58spWyOaoRmeqVA1+Gi8yo1kHZ+H4qSut9bJFKtlZUeqVO+xmi8mjaoqY10l9i3ksokj7eC0OfSqs35nmy6AKUMeNZ09c2hdK8rdJcri0y2qvk878ZM8M3UmeyZW.............fSf7.KeNmjLWEGdJIkexEsz66PRumWL3UUO+H1kvG4Af+s8e4mExCT2ZztbWbX6weNZWxFM21jScelgzh58shWyOakpV82ySlqaS9yt9u8knXcNkiEy0hwZm59VsZN+zSKpqR9yt5o9ZOS+d2j8mQr+DEjSuyg0QawdvVC074nU62cK5T7rtU1eUKU6w54yYeUuWU+pUc7aowA7Fgj+C...........f2BFJYSJQ90lFDneN6mcWb7Ru+4AfZetHpS.u+sHheM6y9bUKRZgKy95719b0H.lKsMYs5yLV4HZzmwZ407y1XZwoey2ioS5qz984ViwhcZwXs0puUsmyOO4+xe16qc56w9m+Ke9UZ4vo9254bXczVrGr0PMeNZ09c2hNEOqak8W0R0drdd+4RaWxm++X7VZb.uQH4+............3sfuGuLwDJIPPuLNLHrySZkuEGFTnWFQ7tEVFS+LRMU4rlA69o5zyp0xO0vtKdYRGLWy48eQTuSNwRZSVy9LoZQ89Vwqkms4lHboAheMOA1RmOtuj+arj9ZsFKFQaFqsl8sp4b9+Hd45r2j7yFpMMuuvUC7ypoWqmfW0z4v5nsXOXqgZ9bzp86tVFar5o3Ycqr+pVp1i0yOwVuMJKo9p8Z0ulFG.............vYsOEQ7yjWi4lrq8oX7fQ8hHhul8d5KndyuuCcck51r60iwvA+7c87YOT8PII6P5y6mJuHefzxQI2i4zFNm2Sd6xWiiKXleHJuMN+ZacaRq5yDw7aOqc89RKGsne0V4YKh487kesyoL+Xx6qlIL0Ewt4f6t2uKNrdcLsXrXDk0NzpwZsnu0oZN+TosiuK12F+vHumqRdOOjTldrfOu4L1YIiCZ4XyRu2sd9gwbNrNZM2C1Vpt9XdNZ09c6rkVyp0Oqao8WUpkbeq8X875huFiulTe8+O15ty8wA.............7pwbChxzDSnKPPeW7x.R813vjdYpjWnufT+gn+fL8hXWvjN1o5R9m8iwgmXEWk8Y9gX55gGGoLcYO2iSUvy2pj+KhHtO5u8dn.Zt6jFpu1l9Bh3axtl9pGOUsIsnOSDyu8Lh5VuuzxQq5WsEd1JsrNTYNOn9GpreY16o1R6OlmHfioEiEin71gVMVq18sNUy4mJMQ9Rqml5DWp6ZSeO2Wvm2bF6rjwAsbrYo26VO+vT15qiFQ81C1ZWWWy8R1p86FQ6qml6X0V9rF87dVy8WUhkdeq8ZP4s440ac2iz1umh5V2cNON.............fWMVRPT1WvU2E3leJdYfmVZvAOz88oj6cZfkNVfhNzIfQeudnmqO2UQYkoZDDxy89zxj+KhgaWdL1WGzW6dIeto2mz5wtfK9T1lT69LcVZ+hZVuujxQK6Ws1OayorFwgIw2P8G5SZe3RRDq4J+DUp6UImXc0brXmRaGZ0XsHpWeqS4b94xu+OUv6oum6oRXvHl2yvRFGzxwlkdua87CkXqtNZIkw4rGrsbc8R1KYq1uaqqmVxX0V8rFw1a+US4Xtu0brdemjd42q75tZO+4XOSa8wA.............7pwRChxai9C1y9B15oNEpRcWg22RJukbu5RHmoBz36lQY59nrjuYHyMXXacx+EQ+mnGS8ZnSZm9Rbg7fZ9pmu1zue9ImRKZSpYelNKI3l6Tq58kTNZc+p07Yatk0HFu+1PeloAs+Pm7OGq75vOT36qliE6Lm1gVLVqSM5acJmyOWdhVTRRTjmHnkjvfQ16ojwNycbPKGaV589TL+PI1hqil6X2C1Vottl6krE628TTOsj0rZ0d66JOao8WMli89Vy82Tx38z5tVj7ecOSmiiC.............3UgiIHJuH1ELueHNLIW95yeu6hkmPD2E6R3g7S7hO8789cQYISykwt.hMu7ce16OOPi6qbe4yet4Oucm.GkVllxbCF1SQx+041n+SVjt5fGhcsckjfAeH1GbzOF66yjJ8y3ldtOsnMol8YxeFVZvoWi58sZ+p03Yaok0ahc80RC.9uF8Gn6ombb0LoDxceb3yQIm1aop0Xw7qojm4ZOVK2w125TMmeek6kzll1urzSjqkL1YNiCZ4XyRu2asDLYqsN5P26krGrsVccs1KYs2u6VbMqNsbu8aw8W0x6asFqGwt5jGhCSpv9p69T1OeHK4Y7bcb................uP5o2Vdx3...0VZR40x+iG...............fyVWFB9d..NctHN7TwarS3Q...............dyJ8T+6lUtr..vqeuKNL4+tZcKN...............r8bSrOv6eXkKK..bd5hYbso68voNL...............83hHhGicAd+iw7Bbe..nyswt8R7tX3SwuKiHtONLw+bp+A.................zHODuLo99Txqm54m+TrKoAA.................nA5K4+F60mhcmDf.83uYsK..................uZbYDwMQDWk7267sHheDQ74HhOFQ78SdoC.......................................................fV3+OPydQNlhzUezB....PRE4DQtJDXBB" ],
									"embed" : 1,
									"id" : "obj-3",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 18.0, 12.0, 980.071838, 666.054932 ],
									"pic" : "/Users/r/Documents/_____research/cv.jit.contours-info.png"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 346.0, 258.0, 118.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"process diagram\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 533.0, 316.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-25",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 533.0, 346.0, 176.0, 34.0 ],
					"style" : "",
					"text" : "window size 100 100 1112 821, window exec"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "cv.jit.contours-info.png",
				"bootpath" : "~/Documents/_____research",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "cv.jit.contours.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0,
		"bgfillcolor_type" : "gradient",
		"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
		"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_angle" : 270.0,
		"bgfillcolor_proportion" : 0.39
	}

}

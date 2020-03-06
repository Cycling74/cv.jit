{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 6,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 362.0, 159.0, 1404.0, 860.0 ],
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
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 590.75, 393.0, 29.5, 22.0 ],
					"text" : "1 -1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 556.25, 393.0, 29.5, 22.0 ],
					"text" : "1 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 490.0, 429.0, 86.0, 22.0 ],
					"text" : "vexpr $f1 * $f2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 692.0, 410.0, 79.0, 22.0 ],
					"text" : "$1 $2 0 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 407.0, 557.0, 198.0, 22.0 ],
					"text" : "jit.op @op + + pass pass pass pass"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "bang", "bang" ],
					"patching_rect" : [ 407.0, 184.333333333333343, 186.0, 22.0 ],
					"text" : "t l b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 490.5, 332.25, 29.5, 22.0 ],
					"text" : "1 1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 531.0, 301.5, 140.0, 22.0 ],
					"text" : "pv #0background_dim"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 490.5, 270.75, 100.0, 22.0 ],
					"text" : "sel 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 732.5, 354.25, 86.0, 22.0 ],
					"text" : "vexpr $f1 * 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 692.0, 363.0, 29.5, 22.0 ],
					"text" : "0 0"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 732.5, 323.5, 140.0, 22.0 ],
					"text" : "pv #0background_dim"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 692.0, 270.75, 100.0, 22.0 ],
					"text" : "sel 0 1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 692.0, 240.0, 139.0, 22.0 ],
					"text" : "pv #0glcoords_coords"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 490.5, 240.0, 146.0, 22.0 ],
					"text" : "pv #0normalize_coords"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 187.099999999999994, 155.0, 149.0, 22.0 ],
					"text" : "pv #0glcoords_coords 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 108.0, 14.0, 150.0, 20.0 ],
					"text" : "Features"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 943.0, 61.0, 150.0, 34.0 ],
					"text" : "Background image or \"clear\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1099.0, 131.0, 150.0, 62.0 ],
					"text" : "Display the output of cv.jit.keypoints, cv.jit.keypoints.match or cv.jit.features."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 490.5, 469.0, 85.0, 22.0 ],
					"text" : "$1 $2 $1 1 1 1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 998.75, 232.0, 187.0, 22.0 ],
					"text" : "pv #0background_dim 320 240"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 713.25, 663.25, 123.0, 22.0 ],
					"text" : "pv #0keypoint_frgb"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1068.5, 812.5, 77.0, 22.0 ],
					"text" : "prepend frgb"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1068.5, 770.5, 123.0, 22.0 ],
					"text" : "pv #0keypoint_frgb"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 962.0, 734.75, 106.0, 22.0 ],
					"text" : "pv #0pen_width"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 6,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 58.0, 106.0, 640.0, 480.0 ],
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
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 0,
											"revision" : 6,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 58.0, 106.0, 640.0, 480.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-22",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 50.0, 268.0, 22.0, 22.0 ],
													"text" : "t b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-21",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 355.5, 38.0, 22.0 ],
													"text" : "zl.reg"
												}

											}
, 											{
												"box" : 												{
													"coll_data" : 													{
														"count" : 360,
														"data" : [ 															{
																"key" : 0,
																"value" : [ 255, 0, 0 ]
															}
, 															{
																"key" : 1,
																"value" : [ 255, 4, 0 ]
															}
, 															{
																"key" : 2,
																"value" : [ 255, 7, 0 ]
															}
, 															{
																"key" : 3,
																"value" : [ 255, 12, 0 ]
															}
, 															{
																"key" : 4,
																"value" : [ 255, 17, 0 ]
															}
, 															{
																"key" : 5,
																"value" : [ 255, 20, 0 ]
															}
, 															{
																"key" : 6,
																"value" : [ 255, 24, 0 ]
															}
, 															{
																"key" : 7,
																"value" : [ 255, 30, 0 ]
															}
, 															{
																"key" : 8,
																"value" : [ 255, 33, 0 ]
															}
, 															{
																"key" : 9,
																"value" : [ 255, 37, 0 ]
															}
, 															{
																"key" : 10,
																"value" : [ 255, 42, 0 ]
															}
, 															{
																"key" : 11,
																"value" : [ 255, 47, 0 ]
															}
, 															{
																"key" : 12,
																"value" : [ 255, 50, 0 ]
															}
, 															{
																"key" : 13,
																"value" : [ 255, 54, 0 ]
															}
, 															{
																"key" : 14,
																"value" : [ 255, 60, 0 ]
															}
, 															{
																"key" : 15,
																"value" : [ 255, 63, 0 ]
															}
, 															{
																"key" : 16,
																"value" : [ 255, 67, 0 ]
															}
, 															{
																"key" : 17,
																"value" : [ 255, 72, 0 ]
															}
, 															{
																"key" : 18,
																"value" : [ 255, 76, 0 ]
															}
, 															{
																"key" : 19,
																"value" : [ 255, 80, 0 ]
															}
, 															{
																"key" : 20,
																"value" : [ 255, 84, 0 ]
															}
, 															{
																"key" : 21,
																"value" : [ 255, 89, 0 ]
															}
, 															{
																"key" : 22,
																"value" : [ 255, 93, 0 ]
															}
, 															{
																"key" : 23,
																"value" : [ 255, 97, 0 ]
															}
, 															{
																"key" : 24,
																"value" : [ 255, 102, 0 ]
															}
, 															{
																"key" : 25,
																"value" : [ 255, 106, 0 ]
															}
, 															{
																"key" : 26,
																"value" : [ 255, 110, 0 ]
															}
, 															{
																"key" : 27,
																"value" : [ 255, 114, 0 ]
															}
, 															{
																"key" : 28,
																"value" : [ 255, 119, 0 ]
															}
, 															{
																"key" : 29,
																"value" : [ 255, 123, 0 ]
															}
, 															{
																"key" : 30,
																"value" : [ 255, 126, 0 ]
															}
, 															{
																"key" : 31,
																"value" : [ 255, 131, 0 ]
															}
, 															{
																"key" : 32,
																"value" : [ 255, 135, 0 ]
															}
, 															{
																"key" : 33,
																"value" : [ 255, 139, 0 ]
															}
, 															{
																"key" : 34,
																"value" : [ 255, 143, 0 ]
															}
, 															{
																"key" : 35,
																"value" : [ 255, 148, 0 ]
															}
, 															{
																"key" : 36,
																"value" : [ 255, 152, 0 ]
															}
, 															{
																"key" : 37,
																"value" : [ 255, 155, 0 ]
															}
, 															{
																"key" : 38,
																"value" : [ 255, 161, 0 ]
															}
, 															{
																"key" : 39,
																"value" : [ 255, 165, 0 ]
															}
, 															{
																"key" : 40,
																"value" : [ 255, 168, 0 ]
															}
, 															{
																"key" : 41,
																"value" : [ 255, 173, 0 ]
															}
, 															{
																"key" : 42,
																"value" : [ 255, 178, 0 ]
															}
, 															{
																"key" : 43,
																"value" : [ 255, 181, 0 ]
															}
, 															{
																"key" : 44,
																"value" : [ 255, 185, 0 ]
															}
, 															{
																"key" : 45,
																"value" : [ 255, 191, 0 ]
															}
, 															{
																"key" : 46,
																"value" : [ 255, 195, 0 ]
															}
, 															{
																"key" : 47,
																"value" : [ 255, 198, 0 ]
															}
, 															{
																"key" : 48,
																"value" : [ 255, 203, 0 ]
															}
, 															{
																"key" : 49,
																"value" : [ 255, 208, 0 ]
															}
, 															{
																"key" : 50,
																"value" : [ 255, 211, 0 ]
															}
, 															{
																"key" : 51,
																"value" : [ 255, 215, 0 ]
															}
, 															{
																"key" : 52,
																"value" : [ 255, 221, 0 ]
															}
, 															{
																"key" : 53,
																"value" : [ 255, 224, 0 ]
															}
, 															{
																"key" : 54,
																"value" : [ 255, 228, 0 ]
															}
, 															{
																"key" : 55,
																"value" : [ 255, 233, 0 ]
															}
, 															{
																"key" : 56,
																"value" : [ 255, 238, 0 ]
															}
, 															{
																"key" : 57,
																"value" : [ 255, 241, 0 ]
															}
, 															{
																"key" : 58,
																"value" : [ 255, 245, 0 ]
															}
, 															{
																"key" : 59,
																"value" : [ 255, 251, 0 ]
															}
, 															{
																"key" : 60,
																"value" : [ 254, 253, 0 ]
															}
, 															{
																"key" : 61,
																"value" : [ 252, 255, 0 ]
															}
, 															{
																"key" : 62,
																"value" : [ 247, 255, 0 ]
															}
, 															{
																"key" : 63,
																"value" : [ 243, 255, 0 ]
															}
, 															{
																"key" : 64,
																"value" : [ 239, 255, 0 ]
															}
, 															{
																"key" : 65,
																"value" : [ 235, 255, 0 ]
															}
, 															{
																"key" : 66,
																"value" : [ 230, 255, 0 ]
															}
, 															{
																"key" : 67,
																"value" : [ 226, 255, 0 ]
															}
, 															{
																"key" : 68,
																"value" : [ 222, 255, 0 ]
															}
, 															{
																"key" : 69,
																"value" : [ 217, 255, 0 ]
															}
, 															{
																"key" : 70,
																"value" : [ 213, 255, 0 ]
															}
, 															{
																"key" : 71,
																"value" : [ 209, 255, 0 ]
															}
, 															{
																"key" : 72,
																"value" : [ 205, 255, 0 ]
															}
, 															{
																"key" : 73,
																"value" : [ 200, 255, 0 ]
															}
, 															{
																"key" : 74,
																"value" : [ 196, 255, 0 ]
															}
, 															{
																"key" : 75,
																"value" : [ 193, 255, 0 ]
															}
, 															{
																"key" : 76,
																"value" : [ 187, 255, 0 ]
															}
, 															{
																"key" : 77,
																"value" : [ 183, 255, 0 ]
															}
, 															{
																"key" : 78,
																"value" : [ 180, 255, 0 ]
															}
, 															{
																"key" : 79,
																"value" : [ 175, 255, 0 ]
															}
, 															{
																"key" : 80,
																"value" : [ 170, 255, 0 ]
															}
, 															{
																"key" : 81,
																"value" : [ 166, 255, 0 ]
															}
, 															{
																"key" : 82,
																"value" : [ 163, 255, 0 ]
															}
, 															{
																"key" : 83,
																"value" : [ 157, 255, 0 ]
															}
, 															{
																"key" : 84,
																"value" : [ 153, 255, 0 ]
															}
, 															{
																"key" : 85,
																"value" : [ 150, 255, 0 ]
															}
, 															{
																"key" : 86,
																"value" : [ 145, 255, 0 ]
															}
, 															{
																"key" : 87,
																"value" : [ 140, 255, 0 ]
															}
, 															{
																"key" : 88,
																"value" : [ 137, 255, 0 ]
															}
, 															{
																"key" : 89,
																"value" : [ 133, 255, 0 ]
															}
, 															{
																"key" : 90,
																"value" : [ 128, 255, 0 ]
															}
, 															{
																"key" : 91,
																"value" : [ 124, 255, 0 ]
															}
, 															{
																"key" : 92,
																"value" : [ 121, 255, 0 ]
															}
, 															{
																"key" : 93,
																"value" : [ 116, 255, 0 ]
															}
, 															{
																"key" : 94,
																"value" : [ 111, 255, 0 ]
															}
, 															{
																"key" : 95,
																"value" : [ 108, 255, 0 ]
															}
, 															{
																"key" : 96,
																"value" : [ 104, 255, 0 ]
															}
, 															{
																"key" : 97,
																"value" : [ 98, 255, 0 ]
															}
, 															{
																"key" : 98,
																"value" : [ 95, 255, 0 ]
															}
, 															{
																"key" : 99,
																"value" : [ 91, 255, 0 ]
															}
, 															{
																"key" : 100,
																"value" : [ 86, 255, 0 ]
															}
, 															{
																"key" : 101,
																"value" : [ 82, 255, 0 ]
															}
, 															{
																"key" : 102,
																"value" : [ 78, 255, 0 ]
															}
, 															{
																"key" : 103,
																"value" : [ 74, 255, 0 ]
															}
, 															{
																"key" : 104,
																"value" : [ 68, 255, 0 ]
															}
, 															{
																"key" : 105,
																"value" : [ 65, 255, 0 ]
															}
, 															{
																"key" : 106,
																"value" : [ 61, 255, 0 ]
															}
, 															{
																"key" : 107,
																"value" : [ 56, 255, 0 ]
															}
, 															{
																"key" : 108,
																"value" : [ 52, 255, 0 ]
															}
, 															{
																"key" : 109,
																"value" : [ 48, 255, 0 ]
															}
, 															{
																"key" : 110,
																"value" : [ 44, 255, 0 ]
															}
, 															{
																"key" : 111,
																"value" : [ 39, 255, 0 ]
															}
, 															{
																"key" : 112,
																"value" : [ 35, 255, 0 ]
															}
, 															{
																"key" : 113,
																"value" : [ 31, 255, 0 ]
															}
, 															{
																"key" : 114,
																"value" : [ 26, 255, 0 ]
															}
, 															{
																"key" : 115,
																"value" : [ 22, 255, 0 ]
															}
, 															{
																"key" : 116,
																"value" : [ 18, 255, 0 ]
															}
, 															{
																"key" : 117,
																"value" : [ 14, 255, 0 ]
															}
, 															{
																"key" : 118,
																"value" : [ 9, 255, 0 ]
															}
, 															{
																"key" : 119,
																"value" : [ 5, 255, 0 ]
															}
, 															{
																"key" : 120,
																"value" : [ 2, 255, 0 ]
															}
, 															{
																"key" : 121,
																"value" : [ 0, 255, 4 ]
															}
, 															{
																"key" : 122,
																"value" : [ 0, 255, 8 ]
															}
, 															{
																"key" : 123,
																"value" : [ 0, 255, 12 ]
															}
, 															{
																"key" : 124,
																"value" : [ 0, 255, 16 ]
															}
, 															{
																"key" : 125,
																"value" : [ 0, 255, 21 ]
															}
, 															{
																"key" : 126,
																"value" : [ 0, 255, 25 ]
															}
, 															{
																"key" : 127,
																"value" : [ 0, 255, 28 ]
															}
, 															{
																"key" : 128,
																"value" : [ 0, 255, 34 ]
															}
, 															{
																"key" : 129,
																"value" : [ 0, 255, 38 ]
															}
, 															{
																"key" : 130,
																"value" : [ 0, 255, 41 ]
															}
, 															{
																"key" : 131,
																"value" : [ 0, 255, 46 ]
															}
, 															{
																"key" : 132,
																"value" : [ 0, 255, 51 ]
															}
, 															{
																"key" : 133,
																"value" : [ 0, 255, 54 ]
															}
, 															{
																"key" : 134,
																"value" : [ 0, 255, 58 ]
															}
, 															{
																"key" : 135,
																"value" : [ 0, 255, 64 ]
															}
, 															{
																"key" : 136,
																"value" : [ 0, 255, 68 ]
															}
, 															{
																"key" : 137,
																"value" : [ 0, 255, 71 ]
															}
, 															{
																"key" : 138,
																"value" : [ 0, 255, 76 ]
															}
, 															{
																"key" : 139,
																"value" : [ 0, 255, 81 ]
															}
, 															{
																"key" : 140,
																"value" : [ 0, 255, 84 ]
															}
, 															{
																"key" : 141,
																"value" : [ 0, 255, 88 ]
															}
, 															{
																"key" : 142,
																"value" : [ 0, 255, 94 ]
															}
, 															{
																"key" : 143,
																"value" : [ 0, 255, 97 ]
															}
, 															{
																"key" : 144,
																"value" : [ 0, 255, 101 ]
															}
, 															{
																"key" : 145,
																"value" : [ 0, 255, 106 ]
															}
, 															{
																"key" : 146,
																"value" : [ 0, 255, 111 ]
															}
, 															{
																"key" : 147,
																"value" : [ 0, 255, 114 ]
															}
, 															{
																"key" : 148,
																"value" : [ 0, 255, 118 ]
															}
, 															{
																"key" : 149,
																"value" : [ 0, 255, 124 ]
															}
, 															{
																"key" : 150,
																"value" : [ 0, 255, 127 ]
															}
, 															{
																"key" : 151,
																"value" : [ 0, 255, 130 ]
															}
, 															{
																"key" : 152,
																"value" : [ 0, 255, 135 ]
															}
, 															{
																"key" : 153,
																"value" : [ 0, 255, 139 ]
															}
, 															{
																"key" : 154,
																"value" : [ 0, 255, 143 ]
															}
, 															{
																"key" : 155,
																"value" : [ 0, 255, 147 ]
															}
, 															{
																"key" : 156,
																"value" : [ 0, 255, 152 ]
															}
, 															{
																"key" : 157,
																"value" : [ 0, 255, 156 ]
															}
, 															{
																"key" : 158,
																"value" : [ 0, 255, 160 ]
															}
, 															{
																"key" : 159,
																"value" : [ 0, 255, 165 ]
															}
, 															{
																"key" : 160,
																"value" : [ 0, 255, 169 ]
															}
, 															{
																"key" : 161,
																"value" : [ 0, 255, 173 ]
															}
, 															{
																"key" : 162,
																"value" : [ 0, 255, 177 ]
															}
, 															{
																"key" : 163,
																"value" : [ 0, 255, 182 ]
															}
, 															{
																"key" : 164,
																"value" : [ 0, 255, 186 ]
															}
, 															{
																"key" : 165,
																"value" : [ 0, 255, 189 ]
															}
, 															{
																"key" : 166,
																"value" : [ 0, 255, 195 ]
															}
, 															{
																"key" : 167,
																"value" : [ 0, 255, 199 ]
															}
, 															{
																"key" : 168,
																"value" : [ 0, 255, 203 ]
															}
, 															{
																"key" : 169,
																"value" : [ 0, 255, 207 ]
															}
, 															{
																"key" : 170,
																"value" : [ 0, 255, 212 ]
															}
, 															{
																"key" : 171,
																"value" : [ 0, 255, 216 ]
															}
, 															{
																"key" : 172,
																"value" : [ 0, 255, 219 ]
															}
, 															{
																"key" : 173,
																"value" : [ 0, 255, 225 ]
															}
, 															{
																"key" : 174,
																"value" : [ 0, 255, 229 ]
															}
, 															{
																"key" : 175,
																"value" : [ 0, 255, 232 ]
															}
, 															{
																"key" : 176,
																"value" : [ 0, 255, 237 ]
															}
, 															{
																"key" : 177,
																"value" : [ 0, 255, 242 ]
															}
, 															{
																"key" : 178,
																"value" : [ 0, 255, 245 ]
															}
, 															{
																"key" : 179,
																"value" : [ 0, 255, 249 ]
															}
, 															{
																"key" : 180,
																"value" : [ 0, 255, 255 ]
															}
, 															{
																"key" : 181,
																"value" : [ 0, 251, 255 ]
															}
, 															{
																"key" : 182,
																"value" : [ 0, 248, 255 ]
															}
, 															{
																"key" : 183,
																"value" : [ 0, 243, 255 ]
															}
, 															{
																"key" : 184,
																"value" : [ 0, 238, 255 ]
															}
, 															{
																"key" : 185,
																"value" : [ 0, 235, 255 ]
															}
, 															{
																"key" : 186,
																"value" : [ 0, 231, 255 ]
															}
, 															{
																"key" : 187,
																"value" : [ 0, 225, 255 ]
															}
, 															{
																"key" : 188,
																"value" : [ 0, 222, 255 ]
															}
, 															{
																"key" : 189,
																"value" : [ 0, 218, 255 ]
															}
, 															{
																"key" : 190,
																"value" : [ 0, 213, 255 ]
															}
, 															{
																"key" : 191,
																"value" : [ 0, 209, 255 ]
															}
, 															{
																"key" : 192,
																"value" : [ 0, 205, 255 ]
															}
, 															{
																"key" : 193,
																"value" : [ 0, 201, 255 ]
															}
, 															{
																"key" : 194,
																"value" : [ 0, 195, 255 ]
															}
, 															{
																"key" : 195,
																"value" : [ 0, 192, 255 ]
															}
, 															{
																"key" : 196,
																"value" : [ 0, 188, 255 ]
															}
, 															{
																"key" : 197,
																"value" : [ 0, 183, 255 ]
															}
, 															{
																"key" : 198,
																"value" : [ 0, 179, 255 ]
															}
, 															{
																"key" : 199,
																"value" : [ 0, 175, 255 ]
															}
, 															{
																"key" : 200,
																"value" : [ 0, 171, 255 ]
															}
, 															{
																"key" : 201,
																"value" : [ 0, 166, 255 ]
															}
, 															{
																"key" : 202,
																"value" : [ 0, 162, 255 ]
															}
, 															{
																"key" : 203,
																"value" : [ 0, 158, 255 ]
															}
, 															{
																"key" : 204,
																"value" : [ 0, 153, 255 ]
															}
, 															{
																"key" : 205,
																"value" : [ 0, 149, 255 ]
															}
, 															{
																"key" : 206,
																"value" : [ 0, 145, 255 ]
															}
, 															{
																"key" : 207,
																"value" : [ 0, 141, 255 ]
															}
, 															{
																"key" : 208,
																"value" : [ 0, 136, 255 ]
															}
, 															{
																"key" : 209,
																"value" : [ 0, 132, 255 ]
															}
, 															{
																"key" : 210,
																"value" : [ 0, 129, 255 ]
															}
, 															{
																"key" : 211,
																"value" : [ 0, 124, 255 ]
															}
, 															{
																"key" : 212,
																"value" : [ 0, 120, 255 ]
															}
, 															{
																"key" : 213,
																"value" : [ 0, 117, 255 ]
															}
, 															{
																"key" : 214,
																"value" : [ 0, 112, 255 ]
															}
, 															{
																"key" : 215,
																"value" : [ 0, 107, 255 ]
															}
, 															{
																"key" : 216,
																"value" : [ 0, 103, 255 ]
															}
, 															{
																"key" : 217,
																"value" : [ 0, 100, 255 ]
															}
, 															{
																"key" : 218,
																"value" : [ 0, 94, 255 ]
															}
, 															{
																"key" : 219,
																"value" : [ 0, 90, 255 ]
															}
, 															{
																"key" : 220,
																"value" : [ 0, 87, 255 ]
															}
, 															{
																"key" : 221,
																"value" : [ 0, 82, 255 ]
															}
, 															{
																"key" : 222,
																"value" : [ 0, 77, 255 ]
															}
, 															{
																"key" : 223,
																"value" : [ 0, 74, 255 ]
															}
, 															{
																"key" : 224,
																"value" : [ 0, 70, 255 ]
															}
, 															{
																"key" : 225,
																"value" : [ 0, 64, 255 ]
															}
, 															{
																"key" : 226,
																"value" : [ 0, 60, 255 ]
															}
, 															{
																"key" : 227,
																"value" : [ 0, 57, 255 ]
															}
, 															{
																"key" : 228,
																"value" : [ 0, 52, 255 ]
															}
, 															{
																"key" : 229,
																"value" : [ 0, 47, 255 ]
															}
, 															{
																"key" : 230,
																"value" : [ 0, 44, 255 ]
															}
, 															{
																"key" : 231,
																"value" : [ 0, 40, 255 ]
															}
, 															{
																"key" : 232,
																"value" : [ 0, 34, 255 ]
															}
, 															{
																"key" : 233,
																"value" : [ 0, 31, 255 ]
															}
, 															{
																"key" : 234,
																"value" : [ 0, 27, 255 ]
															}
, 															{
																"key" : 235,
																"value" : [ 0, 22, 255 ]
															}
, 															{
																"key" : 236,
																"value" : [ 0, 18, 255 ]
															}
, 															{
																"key" : 237,
																"value" : [ 0, 14, 255 ]
															}
, 															{
																"key" : 238,
																"value" : [ 0, 10, 255 ]
															}
, 															{
																"key" : 239,
																"value" : [ 0, 4, 255 ]
															}
, 															{
																"key" : 240,
																"value" : [ 1, 2, 255 ]
															}
, 															{
																"key" : 241,
																"value" : [ 3, 0, 255 ]
															}
, 															{
																"key" : 242,
																"value" : [ 8, 0, 255 ]
															}
, 															{
																"key" : 243,
																"value" : [ 12, 0, 255 ]
															}
, 															{
																"key" : 244,
																"value" : [ 16, 0, 255 ]
															}
, 															{
																"key" : 245,
																"value" : [ 20, 0, 255 ]
															}
, 															{
																"key" : 246,
																"value" : [ 25, 0, 255 ]
															}
, 															{
																"key" : 247,
																"value" : [ 29, 0, 255 ]
															}
, 															{
																"key" : 248,
																"value" : [ 33, 0, 255 ]
															}
, 															{
																"key" : 249,
																"value" : [ 38, 0, 255 ]
															}
, 															{
																"key" : 250,
																"value" : [ 42, 0, 255 ]
															}
, 															{
																"key" : 251,
																"value" : [ 46, 0, 255 ]
															}
, 															{
																"key" : 252,
																"value" : [ 50, 0, 255 ]
															}
, 															{
																"key" : 253,
																"value" : [ 55, 0, 255 ]
															}
, 															{
																"key" : 254,
																"value" : [ 59, 0, 255 ]
															}
, 															{
																"key" : 255,
																"value" : [ 62, 0, 255 ]
															}
, 															{
																"key" : 256,
																"value" : [ 68, 0, 255 ]
															}
, 															{
																"key" : 257,
																"value" : [ 72, 0, 255 ]
															}
, 															{
																"key" : 258,
																"value" : [ 76, 0, 255 ]
															}
, 															{
																"key" : 259,
																"value" : [ 80, 0, 255 ]
															}
, 															{
																"key" : 260,
																"value" : [ 85, 0, 255 ]
															}
, 															{
																"key" : 261,
																"value" : [ 89, 0, 255 ]
															}
, 															{
																"key" : 262,
																"value" : [ 92, 0, 255 ]
															}
, 															{
																"key" : 263,
																"value" : [ 98, 0, 255 ]
															}
, 															{
																"key" : 264,
																"value" : [ 102, 0, 255 ]
															}
, 															{
																"key" : 265,
																"value" : [ 105, 0, 255 ]
															}
, 															{
																"key" : 266,
																"value" : [ 110, 0, 255 ]
															}
, 															{
																"key" : 267,
																"value" : [ 115, 0, 255 ]
															}
, 															{
																"key" : 268,
																"value" : [ 118, 0, 255 ]
															}
, 															{
																"key" : 269,
																"value" : [ 122, 0, 255 ]
															}
, 															{
																"key" : 270,
																"value" : [ 128, 0, 255 ]
															}
, 															{
																"key" : 271,
																"value" : [ 131, 0, 255 ]
															}
, 															{
																"key" : 272,
																"value" : [ 134, 0, 255 ]
															}
, 															{
																"key" : 273,
																"value" : [ 139, 0, 255 ]
															}
, 															{
																"key" : 274,
																"value" : [ 144, 0, 255 ]
															}
, 															{
																"key" : 275,
																"value" : [ 147, 0, 255 ]
															}
, 															{
																"key" : 276,
																"value" : [ 151, 0, 255 ]
															}
, 															{
																"key" : 277,
																"value" : [ 157, 0, 255 ]
															}
, 															{
																"key" : 278,
																"value" : [ 160, 0, 255 ]
															}
, 															{
																"key" : 279,
																"value" : [ 164, 0, 255 ]
															}
, 															{
																"key" : 280,
																"value" : [ 169, 0, 255 ]
															}
, 															{
																"key" : 281,
																"value" : [ 174, 0, 255 ]
															}
, 															{
																"key" : 282,
																"value" : [ 177, 0, 255 ]
															}
, 															{
																"key" : 283,
																"value" : [ 181, 0, 255 ]
															}
, 															{
																"key" : 284,
																"value" : [ 187, 0, 255 ]
															}
, 															{
																"key" : 285,
																"value" : [ 190, 0, 255 ]
															}
, 															{
																"key" : 286,
																"value" : [ 194, 0, 255 ]
															}
, 															{
																"key" : 287,
																"value" : [ 199, 0, 255 ]
															}
, 															{
																"key" : 288,
																"value" : [ 203, 0, 255 ]
															}
, 															{
																"key" : 289,
																"value" : [ 207, 0, 255 ]
															}
, 															{
																"key" : 290,
																"value" : [ 211, 0, 255 ]
															}
, 															{
																"key" : 291,
																"value" : [ 216, 0, 255 ]
															}
, 															{
																"key" : 292,
																"value" : [ 220, 0, 255 ]
															}
, 															{
																"key" : 293,
																"value" : [ 224, 0, 255 ]
															}
, 															{
																"key" : 294,
																"value" : [ 229, 0, 255 ]
															}
, 															{
																"key" : 295,
																"value" : [ 233, 0, 255 ]
															}
, 															{
																"key" : 296,
																"value" : [ 237, 0, 255 ]
															}
, 															{
																"key" : 297,
																"value" : [ 241, 0, 255 ]
															}
, 															{
																"key" : 298,
																"value" : [ 246, 0, 255 ]
															}
, 															{
																"key" : 299,
																"value" : [ 250, 0, 255 ]
															}
, 															{
																"key" : 300,
																"value" : [ 253, 0, 255 ]
															}
, 															{
																"key" : 301,
																"value" : [ 255, 0, 251 ]
															}
, 															{
																"key" : 302,
																"value" : [ 255, 0, 247 ]
															}
, 															{
																"key" : 303,
																"value" : [ 255, 0, 244 ]
															}
, 															{
																"key" : 304,
																"value" : [ 255, 0, 239 ]
															}
, 															{
																"key" : 305,
																"value" : [ 255, 0, 234 ]
															}
, 															{
																"key" : 306,
																"value" : [ 255, 0, 230 ]
															}
, 															{
																"key" : 307,
																"value" : [ 255, 0, 227 ]
															}
, 															{
																"key" : 308,
																"value" : [ 255, 0, 221 ]
															}
, 															{
																"key" : 309,
																"value" : [ 255, 0, 217 ]
															}
, 															{
																"key" : 310,
																"value" : [ 255, 0, 214 ]
															}
, 															{
																"key" : 311,
																"value" : [ 255, 0, 209 ]
															}
, 															{
																"key" : 312,
																"value" : [ 255, 0, 204 ]
															}
, 															{
																"key" : 313,
																"value" : [ 255, 0, 201 ]
															}
, 															{
																"key" : 314,
																"value" : [ 255, 0, 197 ]
															}
, 															{
																"key" : 315,
																"value" : [ 255, 0, 191 ]
															}
, 															{
																"key" : 316,
																"value" : [ 255, 0, 187 ]
															}
, 															{
																"key" : 317,
																"value" : [ 255, 0, 184 ]
															}
, 															{
																"key" : 318,
																"value" : [ 255, 0, 179 ]
															}
, 															{
																"key" : 319,
																"value" : [ 255, 0, 174 ]
															}
, 															{
																"key" : 320,
																"value" : [ 255, 0, 171 ]
															}
, 															{
																"key" : 321,
																"value" : [ 255, 0, 167 ]
															}
, 															{
																"key" : 322,
																"value" : [ 255, 0, 161 ]
															}
, 															{
																"key" : 323,
																"value" : [ 255, 0, 158 ]
															}
, 															{
																"key" : 324,
																"value" : [ 255, 0, 154 ]
															}
, 															{
																"key" : 325,
																"value" : [ 255, 0, 149 ]
															}
, 															{
																"key" : 326,
																"value" : [ 255, 0, 145 ]
															}
, 															{
																"key" : 327,
																"value" : [ 255, 0, 141 ]
															}
, 															{
																"key" : 328,
																"value" : [ 255, 0, 137 ]
															}
, 															{
																"key" : 329,
																"value" : [ 255, 0, 131 ]
															}
, 															{
																"key" : 330,
																"value" : [ 255, 0, 128 ]
															}
, 															{
																"key" : 331,
																"value" : [ 255, 0, 125 ]
															}
, 															{
																"key" : 332,
																"value" : [ 255, 0, 120 ]
															}
, 															{
																"key" : 333,
																"value" : [ 255, 0, 116 ]
															}
, 															{
																"key" : 334,
																"value" : [ 255, 0, 112 ]
															}
, 															{
																"key" : 335,
																"value" : [ 255, 0, 108 ]
															}
, 															{
																"key" : 336,
																"value" : [ 255, 0, 103 ]
															}
, 															{
																"key" : 337,
																"value" : [ 255, 0, 99 ]
															}
, 															{
																"key" : 338,
																"value" : [ 255, 0, 95 ]
															}
, 															{
																"key" : 339,
																"value" : [ 255, 0, 90 ]
															}
, 															{
																"key" : 340,
																"value" : [ 255, 0, 86 ]
															}
, 															{
																"key" : 341,
																"value" : [ 255, 0, 82 ]
															}
, 															{
																"key" : 342,
																"value" : [ 255, 0, 78 ]
															}
, 															{
																"key" : 343,
																"value" : [ 255, 0, 73 ]
															}
, 															{
																"key" : 344,
																"value" : [ 255, 0, 69 ]
															}
, 															{
																"key" : 345,
																"value" : [ 255, 0, 66 ]
															}
, 															{
																"key" : 346,
																"value" : [ 255, 0, 60 ]
															}
, 															{
																"key" : 347,
																"value" : [ 255, 0, 56 ]
															}
, 															{
																"key" : 348,
																"value" : [ 255, 0, 53 ]
															}
, 															{
																"key" : 349,
																"value" : [ 255, 0, 48 ]
															}
, 															{
																"key" : 350,
																"value" : [ 255, 0, 43 ]
															}
, 															{
																"key" : 351,
																"value" : [ 255, 0, 39 ]
															}
, 															{
																"key" : 352,
																"value" : [ 255, 0, 36 ]
															}
, 															{
																"key" : 353,
																"value" : [ 255, 0, 30 ]
															}
, 															{
																"key" : 354,
																"value" : [ 255, 0, 26 ]
															}
, 															{
																"key" : 355,
																"value" : [ 255, 0, 23 ]
															}
, 															{
																"key" : 356,
																"value" : [ 255, 0, 18 ]
															}
, 															{
																"key" : 357,
																"value" : [ 255, 0, 13 ]
															}
, 															{
																"key" : 358,
																"value" : [ 255, 0, 10 ]
															}
, 															{
																"key" : 359,
																"value" : [ 255, 0, 6 ]
															}
 ]
													}
,
													"id" : "obj-68",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "", "", "" ],
													"patching_rect" : [ 83.0, 311.5, 74.0, 22.0 ],
													"saved_object_attributes" : 													{
														"embed" : 1
													}
,
													"text" : "coll deg2rgb"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-66",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 83.0, 282.0, 29.5, 22.0 ],
													"text" : "$4"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-20",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 83.0, 100.0, 63.5, 22.0 ],
													"text" : "t l l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-19",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 127.5, 189.0, 29.5, 22.0 ],
													"text" : "+ 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 232.0, 52.0, 22.0 ],
													"text" : "gate 2 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 127.5, 160.0, 29.5, 22.0 ],
													"text" : "> 3"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 127.5, 130.0, 37.0, 22.0 ],
													"text" : "zl.len"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-23",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 242.0, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-24",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 104.0, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-25",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 60.5, 437.5, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"midpoints" : [ 137.0, 219.0, 59.5, 219.0 ],
													"source" : [ "obj-19", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-20", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 1 ],
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-22", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 1 ],
													"source" : [ "obj-23", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 0 ],
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 0 ],
													"source" : [ "obj-66", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-22", 0 ],
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-66", 0 ],
													"source" : [ "obj-7", 1 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 159.5, 141.0, 55.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p default"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-18",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 197.0, 35.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 0,
											"revision" : 6,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 58.0, 106.0, 640.0, 480.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 83.0, 297.0, 29.5, 22.0 ],
													"text" : "$3"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 50.0, 297.0, 22.0, 22.0 ],
													"text" : "t 6"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 83.0, 100.0, 29.5, 22.0 ],
													"text" : "t l l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 120.5, 204.0, 29.5, 22.0 ],
													"text" : "+ 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 260.0, 52.0, 22.0 ],
													"text" : "gate 2 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 120.5, 175.0, 29.5, 22.0 ],
													"text" : "> 2"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 120.5, 145.0, 37.0, 22.0 ],
													"text" : "zl.len"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-15",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 83.0, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-16",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 44.0, 379.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-11", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-13", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 1 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-15", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 100.75, 141.0, 55.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 41.0, 395.0, 141.0, 22.0 ],
									"text" : "zl join"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 163.0, 362.0, 116.0, 22.0 ],
									"text" : "vexpr $f1 + $f2 * 0.5"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 41.0, 362.0, 113.0, 22.0 ],
									"text" : "vexpr $f1 - $f2 * 0.5"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-72",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 41.0, 427.0, 109.0, 22.0 ],
									"text" : "prepend frameoval"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-67",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 159.5, 240.5, 77.0, 22.0 ],
									"text" : "prepend frgb"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-65",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 100.75, 240.0, 39.0, 22.0 ],
									"text" : "$1 $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 43.0, 240.0, 39.0, 22.0 ],
									"text" : "$1 $2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-60",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 43.0, 95.0, 135.5, 22.0 ],
									"text" : "t l l l"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-75",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 43.0, 35.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-76",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 39.75, 509.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 1 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"source" : [ "obj-60", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-60", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 0 ],
									"midpoints" : [ 52.5, 350.0, 172.5, 350.0 ],
									"order" : 0,
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"order" : 1,
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 1 ],
									"midpoints" : [ 110.25, 338.0, 269.5, 338.0 ],
									"order" : 0,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 1 ],
									"midpoints" : [ 110.25, 338.0, 144.5, 338.0 ],
									"order" : 1,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"midpoints" : [ 169.0, 331.0, 356.0, 331.0, 356.0, 496.0, 49.25, 496.0 ],
									"source" : [ "obj-67", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"source" : [ "obj-69", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 1 ],
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 0 ],
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"source" : [ "obj-75", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 469.0, 812.5, 142.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p make_draw_messages"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 829.0, 812.5, 75.0, 22.0 ],
					"text" : "prepend dim"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 829.25, 699.0, 140.0, 22.0 ],
					"text" : "pv #0background_dim"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 469.0, 627.5, 40.0, 22.0 ],
					"text" : "jit.iter"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 531.0, 627.5, 149.0, 22.0 ],
					"text" : "pv #0background_mess"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "", "bang", "bang" ],
					"patching_rect" : [ 407.0, 590.5, 205.000000000000114, 22.0 ],
					"text" : "t b l b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "clear" ],
					"patching_rect" : [ 906.0, 151.0, 41.0, 22.0 ],
					"text" : "t clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 906.0, 114.0, 65.0, 22.0 ],
					"text" : "route clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 407.0, 523.0, 173.0, 22.0 ],
					"text" : "jit.op @op * * * pass pass pass"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 145.900000000000006, 184.333333333333343, 167.0, 22.0 ],
					"text" : "pv #0keypoint_frgb 255 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 63.75, 214.0, 29.5, 22.0 ],
					"text" : "!= 0"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 63.5, 243.000000000000028, 156.0, 22.0 ],
					"text" : "pv #0normalize_coords 0"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 104.699999999999989, 213.666666666666686, 116.0, 22.0 ],
					"text" : "pv #0pen_width 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 920.5, 279.0, 150.0, 20.0 ],
					"text" : "By default, clear"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.11, 0.48, 0.54, 1.0 ],
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 906.0, 306.0, 179.0, 22.0 ],
					"text" : "pv #0background_mess clear"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-3",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "copyright-jmp.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 82.5, 415.0, 147.0, 67.0 ],
					"prototypename" : "Copyright jmp",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 401.0, 24.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 401.0, 58.0, 300.0, 22.0 ],
					"text" : "patcherargs @normalize 0 @glcoords 0 @frgb 0 255 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 998.75, 201.666666666666657, 59.0, 22.0 ],
					"text" : "route dim"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 998.75, 171.0, 73.0, 22.0 ],
					"text" : "jit.matrixinfo"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 6,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patching_rect" : [ 63.5, 112.0, 225.0, 22.0 ],
					"text" : "route normalize width frgb glcoords done"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 407.0, 870.5, 119.0, 22.0 ],
					"text" : "jit.lcd 4 char 320 240"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-84",
					"index" : 1,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 63.5, 14.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-86",
					"index" : 2,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 906.0, 61.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-87",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 407.0, 903.143920999999978, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 962.0, 812.5, 83.0, 22.0 ],
					"text" : "pensize $1 $1"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"midpoints" : [ 691.5, 94.0, 73.0, 94.0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"order" : 0,
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 701.5, 340.0, 565.75, 340.0 ],
					"order" : 1,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"order" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"order" : 1,
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"midpoints" : [ 742.0, 401.0, 701.5, 401.0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"midpoints" : [ 540.5, 359.0, 499.5, 359.0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-22", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-24", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"midpoints" : [ 583.5, 225.0, 701.5, 225.0 ],
					"source" : [ "obj-24", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"midpoints" : [ 279.0, 145.0, 416.5, 145.0 ],
					"source" : [ "obj-25", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-25", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-25", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-25", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 1 ],
					"midpoints" : [ 701.5, 542.0, 595.5, 542.0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"midpoints" : [ 961.5, 150.0, 1008.25, 150.0 ],
					"order" : 0,
					"source" : [ "obj-47", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"midpoints" : [ 961.5, 193.0, 915.5, 193.0 ],
					"order" : 1,
					"source" : [ "obj-47", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"source" : [ "obj-57", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-57", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"midpoints" : [ 602.500000000000114, 619.5, 838.75, 619.5 ],
					"order" : 2,
					"source" : [ "obj-57", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"midpoints" : [ 602.500000000000114, 619.5, 971.5, 619.5 ],
					"order" : 1,
					"source" : [ "obj-57", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"midpoints" : [ 602.500000000000114, 619.5, 1078.0, 619.5 ],
					"order" : 0,
					"source" : [ "obj-57", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"midpoints" : [ 602.500000000000114, 619.5, 722.75, 619.5 ],
					"order" : 3,
					"source" : [ "obj-57", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 540.5, 664.5, 669.0, 664.5, 669.0, 854.5, 416.5, 854.5 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 1 ],
					"midpoints" : [ 500.0, 504.0, 570.5, 504.0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 838.5, 853.5, 416.5, 853.5 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 971.5, 853.5, 416.5, 853.5 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 1078.0, 854.5, 416.5, 854.5 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 1 ],
					"midpoints" : [ 722.75, 729.5, 601.5, 729.5 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-86", 0 ]
				}

			}
 ]
	}

}

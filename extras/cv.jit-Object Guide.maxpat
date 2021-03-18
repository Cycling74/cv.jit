{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 2,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 79.0, 869.0, 577.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
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
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 118.0, 373.0, 41.0, 22.0 ],
					"text" : "t s 0 0"
				}

			}
, 			{
				"box" : 				{
					"handoff" : "",
					"id" : "obj-22",
					"maxclass" : "ubutton",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 727.0, 273.0, 33.0, 42.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 676.0, 472.0, 143.0, 47.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 2,
					"fontsize" : 27.993984794101571,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 727.0, 270.983606557377072, 132.0, 38.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 680.0, 478.0, 131.0, 38.0 ],
					"style" : "default",
					"text" : "CREDITS"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.858824, 0.878431, 0.862745, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-24",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 727.0, 273.0, 74.0, 31.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 676.0, 472.0, 143.0, 47.0 ],
					"proportion" : 0.39,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 727.0, 334.0, 35.0, 22.0 ],
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 727.0, 358.0, 51.0, 22.0 ],
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 132.0, 160.0, 1055.0, 269.0 ],
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
						"toolbarvisible" : 0,
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
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-3",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 21.0, 275.014590347923672, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 13.645689688590897,
									"id" : "obj-2",
									"linecount" : 13,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.0, 26.014590347923686, 1009.0, 205.0 ],
									"text" : "All externals, abstractions and help files in the cv.jit package by Jean-Marc Pelletier\rjmp@jmpelletier.com\rCopyright ©2003-2020 \n\nexcept:\n\n- `cv.jit.hough` by Christopher P. Baker <https://christopherbaker.net> and Mateusz Herczka 2004\n- `cv.jit.extrema` by Christopher P. Baker <https://christopherbaker.net> and Mateusz Herczka 2004, with modifications by Jean-Marc Pelletier 2006\n- `cv.jit.hough2lines` by Christopher P. Baker <https://christopherbaker.net>, Mateusz Herczka and Jean-Marc Pelletier 2006\n- `cv.jit.calibration`, `cv.jit.findchessboardcorners`, `cv.jit.findhomography`, `cv.jit.getperspective`, `cv.jit.perspective` by Antoine Villeret <antoine.villeret@gmail.com>\n\n\nadditional bug fixes and package support by Cycling '74"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 727.0, 382.0, 71.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p CREDITS"
				}

			}
, 			{
				"box" : 				{
					"handoff" : "",
					"id" : "obj-13",
					"maxclass" : "ubutton",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 565.0, 379.0, 33.0, 42.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 376.0, 472.0, 278.0, 47.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 2,
					"id" : "obj-10",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 565.0, 386.0, 141.0, 60.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 381.0, 480.0, 266.0, 33.0 ],
					"style" : "default",
					"text" : "Several help files make use of an input chooser abstraction, click here to view that abstraction."
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.858824, 0.878431, 0.862745, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-11",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 565.0, 379.0, 132.0, 55.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 376.0, 472.0, 278.0, 47.0 ],
					"proportion" : 0.39,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 565.0, 463.0, 121.0, 22.0 ],
					"text" : "load cv.input.chooser"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 565.0, 486.0, 51.0, 22.0 ],
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 735.0, 197.0, 54.0, 22.0 ],
					"text" : "onecopy"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ],
					"patching_rect" : [ 73.0, 373.0, 29.5, 22.0 ],
					"text" : "t 1 l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 73.0, 404.0, 32.0, 22.0 ],
					"text" : "gate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 415.0, 445.0, 139.0, 74.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 43.0, 480.0, 305.0, 33.0 ],
					"style" : "default",
					"text" : "Select a category and then click on a row to display the object's help file, or the abstraction if no help file exists"
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
					"patching_rect" : [ 408.0, 438.0, 132.0, 55.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 38.0, 472.0, 317.0, 47.0 ],
					"proportion" : 0.39,
					"rounded" : 0
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
					"patching_rect" : [ 52.0, 18.0, 453.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 35.0, 453.0, 33.0 ],
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
					"patching_rect" : [ 52.0, 47.0, 600.0, 4.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 63.0, 776.0, 5.0 ],
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
					"patching_rect" : [ 52.0, 46.0, 600.0, 5.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 62.0, 776.0, 5.0 ],
					"proportion" : 0.39,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 92.0, 70.0, 22.0 ],
					"text" : "loadmess 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 122.0, 79.0, 1082.0, 843.0 ],
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
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-58",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 116.0, 165.0, 60.0, 22.0 ],
									"text" : "select 0 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 32.0, 132.0, 22.0, 22.0 ],
									"text" : "t b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-85",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 871.0, 775.0, 143.5, 22.0 ],
									"text" : "&&"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-82",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 1037.0, 751.0, 22.0, 22.0 ],
									"text" : "t 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-83",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 995.5, 751.0, 22.0, 22.0 ],
									"text" : "t 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-84",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 996.0, 727.0, 60.0, 22.0 ],
									"text" : "sel TRUE"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 772.5, 213.0, 31.0, 22.0 ],
									"text" : "t b s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-78",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 772.5, 237.0, 58.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-79",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 772.5, 261.0, 77.0, 22.0 ],
									"text" : "route symbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-80",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 772.5, 189.0, 77.0, 22.0 ],
									"text" : "route symbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-81",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 772.5, 165.0, 136.000000000000057, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0,
										"precision" : 6
									}
,
									"text" : "coll"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 611.5, 424.0, 51.0, 22.0 ],
									"text" : "t b s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 611.5, 451.0, 83.0, 22.0 ],
									"text" : "pack store s s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-67",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 137.0, 85.0, 50.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-65",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 682.5, 775.0, 32.0, 22.0 ],
									"text" : "gate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 733.0, 775.0, 32.0, 22.0 ],
									"text" : "gate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-63",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 871.0, 751.0, 53.0, 22.0 ],
									"text" : ">= 2019"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 871.0, 727.0, 71.0, 22.0 ],
									"text" : "fromsymbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-61",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 746.0, 703.0, 269.0, 22.0 ],
									"text" : "dict.unpack subtitle: year: help:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-60",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 695.5, 669.0, 69.5, 22.0 ],
									"text" : "zl.slice 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 695.5, 645.0, 47.0, 22.0 ],
									"text" : "dict.iter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 645.0, 621.0, 69.5, 22.0 ],
									"text" : "zl.slice 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-55",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 645.0, 597.0, 47.0, 22.0 ],
									"text" : "dict.iter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 645.0, 573.0, 143.0, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict cvjit"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 524.5, 325.0, 122.0, 20.0 ],
									"text" : "put abstractions last"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 422.0, 564.0, 31.0, 22.0 ],
									"text" : "t b s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 422.0, 588.0, 58.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 422.0, 612.0, 77.0, 22.0 ],
									"text" : "route symbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 422.0, 540.0, 77.0, 22.0 ],
									"text" : "route symbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "dump" ],
									"patching_rect" : [ 231.0, 227.0, 45.0, 22.0 ],
									"text" : "t dump"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 76.0, 195.0, 55.0, 22.0 ],
									"text" : "zl.slice 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 422.0, 460.0, 29.5, 22.0 ],
									"text" : "join"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 422.0, 484.0, 83.0, 22.0 ],
									"text" : "prepend store"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 172.0, 424.0, 269.0, 22.0 ],
									"text" : "gate 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 503.5, 353.0, 22.0, 22.0 ],
									"text" : "t 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 452.5, 353.0, 22.0, 22.0 ],
									"text" : "t 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 452.5, 324.0, 70.0, 22.0 ],
									"text" : "sel external"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 422.0, 516.0, 136.000000000000057, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0,
										"precision" : 6
									}
,
									"text" : "coll"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 137.0, 61.0, 71.0, 22.0 ],
									"text" : "route new!"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 859.0, 409.0, 79.0, 22.0 ],
									"text" : "prepend load"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-52",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 772.5, 374.0, 105.5, 22.0 ],
									"text" : "gate 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 772.5, 409.0, 79.0, 22.0 ],
									"text" : "prepend help"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 897.5, 295.0, 22.0, 22.0 ],
									"text" : "t 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 856.5, 295.0, 22.0, 22.0 ],
									"text" : "t 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 772.5, 451.0, 51.0, 22.0 ],
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 856.5, 261.0, 60.0, 22.0 ],
									"text" : "sel TRUE"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 772.5, 132.0, 94.0, 22.0 ],
									"text" : "prepend symbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "int", "int", "", "" ],
									"patching_rect" : [ 733.166666666666629, 107.0, 78.0, 22.0 ],
									"text" : "unpack i i s s"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-3",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 733.0, 29.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 328.5, 324.0, 57.0, 22.0 ],
									"text" : "tosymbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 255.5, 608.0, 92.0, 22.0 ],
									"text" : "pack set 1 0 s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 328.5, 295.0, 267.0, 22.0 ],
									"text" : "dict.unpack subtitle: type: help:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 351.5, 608.0, 29.5, 22.0 ],
									"text" : "+ 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-34",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 55.0, 165.0, 56.0, 23.0 ],
									"text" : "clear all"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "int" ],
									"patching_rect" : [ 172.0, 518.0, 61.666666666666686, 22.0 ],
									"text" : "t b i"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 172.0, 460.0, 83.0, 22.0 ],
									"text" : "t b s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 172.0, 608.0, 83.0, 22.0 ],
									"text" : "pack set 0 0 s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 189.0, 141.0, 73.0, 22.0 ],
									"text" : "prepend get"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 189.0, 85.0, 53.0, 22.0 ],
									"text" : "t s b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 32.0, 165.0, 22.0, 22.0 ],
									"text" : "t 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 4,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 172.0, 489.0, 83.0, 22.0 ],
									"text" : "counter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 278.0, 251.0, 69.5, 22.0 ],
									"text" : "zl.slice 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 262.0, 693.5, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-21",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 262.0, 717.5, 88.0, 23.0 ],
									"text" : "col 1 width $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 172.0, 693.5, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-35",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 172.0, 717.5, 88.0, 23.0 ],
									"text" : "col 0 width $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.0, 227.0, 47.0, 22.0 ],
									"text" : "dict.iter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 242.0, 195.0, 55.0, 22.0 ],
									"text" : "zl.slice 1"
								}

							}
, 							{
								"box" : 								{
									"data" : 									{
										"drawing" : 										{
											"cv.jit.blobs.bounds.draw" : 											{
												"name" : "cv.jit.blobs.bounds.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.blobs.bounds.draw",
												"subtitle" : "Draw blob bounds",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.centroids.draw" : 											{
												"name" : "cv.jit.blobs.centroids.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.blobs.centroids.draw",
												"subtitle" : "Draw blob centroids",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.color" : 											{
												"name" : "cv.jit.blobs.color",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.blobs.color",
												"subtitle" : "Paint each blob a different color",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.colour" : 											{
												"name" : "cv.jit.blobs.colour",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.blobs.colour",
												"subtitle" : "Paint each blob a different colour",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.direction.draw" : 											{
												"name" : "cv.jit.blobs.direction.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.blobs.direction.draw",
												"subtitle" : "Draw blob directions",
												"num_inlets" : "3",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.elongation.draw" : 											{
												"name" : "cv.jit.blobs.elongation.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.blobs.elongation.draw",
												"subtitle" : "Draw blob elongations",
												"num_inlets" : "3",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.orient.draw" : 											{
												"name" : "cv.jit.blobs.orient.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.blobs.orient.draw",
												"subtitle" : "Draw blob orientations",
												"num_inlets" : "3",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.orientation.draw" : 											{
												"name" : "cv.jit.blobs.orientation.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.blobs.orientation.draw",
												"subtitle" : "Draw blob orientations",
												"num_inlets" : "3",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.centroids.draw" : 											{
												"name" : "cv.jit.centroids.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.centroids.draw",
												"subtitle" : "Draw image centroids",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.face.landmarks.draw" : 											{
												"name" : "cv.jit.face.landmarks.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.face.landmarks.draw",
												"subtitle" : "Draw detected face landmarks",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.faces.draw" : 											{
												"name" : "cv.jit.faces.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.faces.draw",
												"subtitle" : "Draw detected faces",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.features.draw" : 											{
												"name" : "cv.jit.features.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.features.draw",
												"subtitle" : "Draw detected image features",
												"num_inlets" : "3",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.flow.draw" : 											{
												"name" : "cv.jit.flow.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.flow.draw",
												"subtitle" : "Visualize dense optical flow",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2010",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.keypoints.draw" : 											{
												"name" : "cv.jit.keypoints.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.keypoints.draw",
												"subtitle" : "Draw detected keypoints",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.lines.draw" : 											{
												"name" : "cv.jit.lines.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.lines.draw",
												"subtitle" : "Draw detected straight lines",
												"num_inlets" : "3",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.shift.draw" : 											{
												"name" : "cv.jit.shift.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.shift.draw",
												"subtitle" : "Draw shift tracking results",
												"num_inlets" : "3",
												"num_outlets" : "1",
												"year" : "2008",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.touches.draw" : 											{
												"name" : "cv.jit.touches.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.touches.draw",
												"subtitle" : "Draw compact region tracking results",
												"num_inlets" : "4",
												"num_outlets" : "1",
												"year" : "2010",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.track.draw" : 											{
												"name" : "cv.jit.track.draw",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "FALSE",
												"category" : "drawing",
												"title" : "cv.jit.track.draw",
												"subtitle" : "Draw feature tracking results",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"utility" : 										{
											"cv.jit.cartopol" : 											{
												"name" : "cv.jit.cartopol",
												"type" : "abstraction",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.cartopol",
												"subtitle" : "",
												"num_inlets" : "2",
												"num_outlets" : "2",
												"year" : "2004",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.changetype" : 											{
												"name" : "cv.jit.changetype",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.changetype",
												"subtitle" : "Convert a matrix to another type",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.iter" : 											{
												"name" : "cv.jit.iter",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.iter",
												"subtitle" : "Output one row or column at a time",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.module.presence" : 											{
												"name" : "cv.jit.module.presence",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.module.presence",
												"subtitle" : "Likelyhood that something is in front of the camera",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2015",
												"author1" : "Les Stuck",
												"contact1" : "",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.notempty" : 											{
												"name" : "cv.jit.notempty",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.notempty",
												"subtitle" : "\"Returns whether a matrix is \"\"empty\"\"\"",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.poltocar" : 											{
												"name" : "cv.jit.poltocar",
												"type" : "abstraction",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.poltocar",
												"subtitle" : "",
												"num_inlets" : "2",
												"num_outlets" : "2",
												"year" : "2004",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.scale_source_&_lcd" : 											{
												"name" : "cv.jit.scale_source_&_lcd",
												"type" : "abstraction",
												"deprecated" : "1",
												"help" : "FALSE",
												"category" : "utility",
												"title" : "cv.jit.scale_source_&_lcd",
												"subtitle" : "",
												"num_inlets" : "3",
												"num_outlets" : "1",
												"year" : "2015",
												"author1" : "Les Stuck",
												"contact1" : "",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.stddev" : 											{
												"name" : "cv.jit.stddev",
												"type" : "abstraction",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.stddev",
												"subtitle" : "Standard deviation",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.variance" : 											{
												"name" : "cv.jit.variance",
												"type" : "abstraction",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.variance",
												"subtitle" : "Variance",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.noise" : 											{
												"name" : "cv.jit.noise",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.noise",
												"subtitle" : "Generate floating-point noise values",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.covariance" : 											{
												"name" : "cv.jit.covariance",
												"type" : "external",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.covariance",
												"subtitle" : "",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.resize" : 											{
												"name" : "cv.jit.resize",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "utility",
												"title" : "cv.jit.resize",
												"subtitle" : "High-quality matrix resize",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2010",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"shape" : 										{
											"cv.jit.circularity" : 											{
												"name" : "cv.jit.circularity",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "shape",
												"title" : "cv.jit.circularity",
												"subtitle" : "Calculate compactness of a shape",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2004",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.direction" : 											{
												"name" : "cv.jit.direction",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "shape",
												"title" : "cv.jit.direction",
												"subtitle" : "Calculate main axis of an image",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.elongation" : 											{
												"name" : "cv.jit.elongation",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "shape",
												"title" : "cv.jit.elongation",
												"subtitle" : "Calculate the thinness of a shape",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2004",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.orientation" : 											{
												"name" : "cv.jit.orientation",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "shape",
												"title" : "cv.jit.orientation",
												"subtitle" : "Calculate main axis of image",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2004",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.perimeter" : 											{
												"name" : "cv.jit.perimeter",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "shape",
												"title" : "cv.jit.perimeter",
												"subtitle" : "Count the number of edge pixels.",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2004",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.centroids" : 											{
												"name" : "cv.jit.centroids",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "shape",
												"title" : "cv.jit.centroids",
												"subtitle" : "Find image centroids",
												"num_inlets" : "1",
												"num_outlets" : "3",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.mass" : 											{
												"name" : "cv.jit.mass",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "shape",
												"title" : "cv.jit.mass",
												"subtitle" : "Add all pixel values",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.moments" : 											{
												"name" : "cv.jit.moments",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "shape",
												"title" : "cv.jit.moments",
												"subtitle" : "Shape analysis",
												"num_inlets" : "1",
												"num_outlets" : "5",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.sum" : 											{
												"name" : "cv.jit.sum",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "shape",
												"title" : "cv.jit.sum",
												"subtitle" : "Add all pixel values",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"morphology" : 										{
											"cv.jit.close" : 											{
												"name" : "cv.jit.close",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "morphology",
												"title" : "cv.jit.close",
												"subtitle" : "Morphological close operation",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.open" : 											{
												"name" : "cv.jit.open",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "morphology",
												"title" : "cv.jit.open",
												"subtitle" : "Morphological open operation",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.binedge" : 											{
												"name" : "cv.jit.binedge",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "morphology",
												"title" : "cv.jit.binedge",
												"subtitle" : "Find binary edge pixels",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.dilate" : 											{
												"name" : "cv.jit.dilate",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "morphology",
												"title" : "cv.jit.dilate",
												"subtitle" : "Apply dilate operation on a binary image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.erode" : 											{
												"name" : "cv.jit.erode",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "morphology",
												"title" : "cv.jit.erode",
												"subtitle" : "Apply erode operation on a binary image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"faces" : 										{
											"cv.jit.face.parts" : 											{
												"name" : "cv.jit.face.parts",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "faces",
												"title" : "cv.jit.face.parts",
												"subtitle" : "Separate face landmarks",
												"num_inlets" : "1",
												"num_outlets" : "9",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.face.rigidpoints" : 											{
												"name" : "cv.jit.face.rigidpoints",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "faces",
												"title" : "cv.jit.face.rigidpoints",
												"subtitle" : "Retrieve rigid points from face landmarks",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.face.landmarks" : 											{
												"name" : "cv.jit.face.landmarks",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "faces",
												"title" : "cv.jit.face.landmarks",
												"subtitle" : "Find important facial features",
												"num_inlets" : "2",
												"num_outlets" : "2",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.faces" : 											{
												"name" : "cv.jit.faces",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "faces",
												"title" : "cv.jit.faces",
												"subtitle" : "Find faces in an image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"features" : 										{
											"cv.jit.features2track" : 											{
												"name" : "cv.jit.features2track",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "features",
												"title" : "cv.jit.features2track",
												"subtitle" : "Find features for cv.jit.track",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.keypoints.match" : 											{
												"name" : "cv.jit.keypoints.match",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "features",
												"title" : "cv.jit.keypoints.match",
												"subtitle" : "Find matches between two sets of keypoints",
												"num_inlets" : "4",
												"num_outlets" : "2",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.features" : 											{
												"name" : "cv.jit.features",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "features",
												"title" : "cv.jit.features",
												"subtitle" : "Find features in an image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.keypoints" : 											{
												"name" : "cv.jit.keypoints",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "features",
												"title" : "cv.jit.keypoints",
												"subtitle" : "Find keypoints and their descriptors in an image",
												"num_inlets" : "1",
												"num_outlets" : "3",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"motion" : 										{
											"cv.jit.framesub" : 											{
												"name" : "cv.jit.framesub",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "motion",
												"title" : "cv.jit.framesub",
												"subtitle" : "Consecutive frame difference",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2004",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.hsflow" : 											{
												"name" : "cv.jit.hsflow",
												"type" : "external",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "motion",
												"title" : "cv.jit.hsflow",
												"subtitle" : "Calculate dense optical flow",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.lkflow" : 											{
												"name" : "cv.jit.lkflow",
												"type" : "external",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "motion",
												"title" : "cv.jit.lkflow",
												"subtitle" : "Calculate dense optical flow",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.opticalflow" : 											{
												"name" : "cv.jit.opticalflow",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "motion",
												"title" : "cv.jit.opticalflow",
												"subtitle" : "Calculate dense optical flow",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2010",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"lines" : 										{
											"cv.jit.hough2lines" : 											{
												"name" : "cv.jit.hough2lines",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "lines",
												"title" : "cv.jit.hough2lines",
												"subtitle" : "Find lines in Hough space",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "Christopher P. Baker",
												"contact2" : "https://christopherbaker.net",
												"author3" : "Mateusz Herczka",
												"contact3" : "msz@westerplatte.net"
											}
,
											"cv.jit.extrema" : 											{
												"name" : "cv.jit.extrema",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "lines",
												"title" : "cv.jit.extrema",
												"subtitle" : "Find local peaks in an image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "Christopher P. Baker",
												"contact2" : "https://christopherbaker.net",
												"author3" : "Mateusz Herczka",
												"contact3" : "msz@westerplatte.net"
											}
,
											"cv.jit.hough" : 											{
												"name" : "cv.jit.hough",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "lines",
												"title" : "cv.jit.hough",
												"subtitle" : "Compute Hough space",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "Christopher P. Baker",
												"contact2" : "https://christopherbaker.net",
												"author3" : "Mateusz Herczka",
												"contact3" : "msz@westerplatte.net"
											}
,
											"cv.jit.lines" : 											{
												"name" : "cv.jit.lines",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "lines",
												"title" : "cv.jit.lines",
												"subtitle" : "Find straight lines in an image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"filtering" : 										{
											"cv.jit.lowpass" : 											{
												"name" : "cv.jit.lowpass",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "filtering",
												"title" : "cv.jit.lowpass",
												"subtitle" : "Smooth a sequence of values",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.kalman" : 											{
												"name" : "cv.jit.kalman",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "filtering",
												"title" : "cv.jit.kalman",
												"subtitle" : "Use a Kalman filter to remove noise in a signal",
												"num_inlets" : "1",
												"num_outlets" : "1",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"tracking" : 										{
											"cv.jit.touches" : 											{
												"name" : "cv.jit.touches",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "tracking",
												"title" : "cv.jit.touches",
												"subtitle" : "Track several compact regions",
												"num_inlets" : "1",
												"num_outlets" : "3",
												"year" : "2010",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.shift" : 											{
												"name" : "cv.jit.shift",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "tracking",
												"title" : "cv.jit.shift",
												"subtitle" : "Track an image area",
												"num_inlets" : "1",
												"num_outlets" : "4",
												"year" : "2008",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.track" : 											{
												"name" : "cv.jit.track",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "tracking",
												"title" : "cv.jit.track",
												"subtitle" : "Track features in an image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"recognition" : 										{
											"cv.jit.undergrad" : 											{
												"name" : "cv.jit.undergrad",
												"type" : "abstraction",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "recognition",
												"title" : "cv.jit.undergrad",
												"subtitle" : "Simple pattern recognition",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2004",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.learn" : 											{
												"name" : "cv.jit.learn",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "recognition",
												"title" : "cv.jit.learn",
												"subtitle" : "Perform pattern analysis and recognition",
												"num_inlets" : "2",
												"num_outlets" : "1",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"perspective" : 										{
											"cv.jit.findhomography" : 											{
												"name" : "cv.jit.findhomography",
												"type" : "external",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "perspective",
												"title" : "cv.jit.findhomography",
												"subtitle" : "Calculates the perspective transform from n corresponding points.",
												"num_inlets" : "2",
												"num_outlets" : "2",
												"year" : "2010",
												"author1" : "Antoine Villeret",
												"contact1" : "antoine.villeret@gmail.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.getperspective" : 											{
												"name" : "cv.jit.getperspective",
												"type" : "external",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "perspective",
												"title" : "cv.jit.getperspective",
												"subtitle" : "Apply getperspective operation on a binary image",
												"num_inlets" : "2",
												"num_outlets" : "2",
												"year" : "2010",
												"author1" : "Antoine Villeret",
												"contact1" : "antoine.villeret@gmail.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.perspective" : 											{
												"name" : "cv.jit.perspective",
												"type" : "external",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "perspective",
												"title" : "cv.jit.perspective",
												"subtitle" : "Performs perspective transformation on a matrix of points.",
												"num_inlets" : "2",
												"num_outlets" : "2",
												"year" : "2010",
												"author1" : "Antoine Villeret",
												"contact1" : "antoine.villeret@gmail.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.unproject" : 											{
												"name" : "cv.jit.unproject",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "perspective",
												"title" : "cv.jit.unproject",
												"subtitle" : "Find the position and rotation of objects",
												"num_inlets" : "2",
												"num_outlets" : "3",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.calibration" : 											{
												"name" : "cv.jit.calibration",
												"type" : "external",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "perspective",
												"title" : "cv.jit.calibration",
												"subtitle" : "Camera calibration using Zhang method",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2010",
												"author1" : "Antoine Villeret",
												"contact1" : "antoine.villeret@gmail.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.findchessboardcorners" : 											{
												"name" : "cv.jit.findchessboardcorners",
												"type" : "external",
												"deprecated" : "1",
												"help" : "TRUE",
												"category" : "perspective",
												"title" : "cv.jit.findchessboardcorners",
												"subtitle" : "Find chessboardcorners in an input stream",
												"num_inlets" : "1",
												"num_outlets" : "3",
												"year" : "2010",
												"author1" : "Antoine Villeret",
												"contact1" : "antoine.villeret@gmail.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"blobs" : 										{
											"cv.jit.blobs.bounds" : 											{
												"name" : "cv.jit.blobs.bounds",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.blobs.bounds",
												"subtitle" : "Find blob bounds",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.centroids" : 											{
												"name" : "cv.jit.blobs.centroids",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.blobs.centroids",
												"subtitle" : "Locate labeled blobs",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.direction" : 											{
												"name" : "cv.jit.blobs.direction",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.blobs.direction",
												"subtitle" : "Calculate blob direction",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.elongation" : 											{
												"name" : "cv.jit.blobs.elongation",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.blobs.elongation",
												"subtitle" : "Calculate blob elongation",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.moments" : 											{
												"name" : "cv.jit.blobs.moments",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.blobs.moments",
												"subtitle" : "Analyse blob shapes",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.orientation" : 											{
												"name" : "cv.jit.blobs.orientation",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.blobs.orientation",
												"subtitle" : "Calculate blob axes",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.recon" : 											{
												"name" : "cv.jit.blobs.recon",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.blobs.recon",
												"subtitle" : "Find shapes among blobs",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.blobs.sort" : 											{
												"name" : "cv.jit.blobs.sort",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.blobs.sort",
												"subtitle" : "Re-order labels for continuity",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.floodfill" : 											{
												"name" : "cv.jit.floodfill",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.floodfill",
												"subtitle" : "Isolate a connected component in a binary image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.label" : 											{
												"name" : "cv.jit.label",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "blobs",
												"title" : "cv.jit.label",
												"subtitle" : "Separate a binary image in blobs",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}
,
										"processing" : 										{
											"cv.jit.blur" : 											{
												"name" : "cv.jit.blur",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "processing",
												"title" : "cv.jit.blur",
												"subtitle" : "Apply gaussian blur to an image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2019",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.canny" : 											{
												"name" : "cv.jit.canny",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "processing",
												"title" : "cv.jit.canny",
												"subtitle" : "Extract edges in an image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.mean" : 											{
												"name" : "cv.jit.mean",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "processing",
												"title" : "cv.jit.mean",
												"subtitle" : "Average incoming matrices",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2003",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.ravg" : 											{
												"name" : "cv.jit.ravg",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "processing",
												"title" : "cv.jit.ravg",
												"subtitle" : "Calculate the running average over time",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2007",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}
,
											"cv.jit.threshold" : 											{
												"name" : "cv.jit.threshold",
												"type" : "external",
												"deprecated" : "0",
												"help" : "TRUE",
												"category" : "processing",
												"title" : "cv.jit.threshold",
												"subtitle" : "Apply threshold operation on a binary image",
												"num_inlets" : "1",
												"num_outlets" : "2",
												"year" : "2010",
												"author1" : "Jean-Marc Pelletier",
												"contact1" : "jmp@jmpelletier.com",
												"author2" : "",
												"contact2" : "",
												"author3" : "",
												"contact3" : ""
											}

										}

									}
,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 189.0, 165.0, 178.0, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 1,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict cvjit @embed 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 351.5, 632.0, 51.0, 22.0 ],
									"text" : "rows $1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-45",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 137.0, 29.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-46",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 131.0, 714.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"source" : [ "obj-1", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"order" : 1,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"order" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-16", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-19", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 1 ],
									"source" : [ "obj-2", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-22", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"order" : 1,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 0 ],
									"order" : 0,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 2 ],
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-27", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 3 ],
									"source" : [ "obj-30", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 2 ],
									"order" : 2,
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"order" : 1,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"order" : 0,
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 2 ],
									"order" : 1,
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"order" : 0,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 3 ],
									"source" : [ "obj-33", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"order" : 1,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"order" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-38", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 2 ],
									"source" : [ "obj-38", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-39", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-4", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"order" : 2,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"order" : 1,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"order" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 1 ],
									"order" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 3 ],
									"order" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"source" : [ "obj-52", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"source" : [ "obj-54", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-61", 0 ],
									"source" : [ "obj-60", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 1 ],
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"source" : [ "obj-61", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 1 ],
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 2 ],
									"order" : 1,
									"source" : [ "obj-61", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-84", 0 ],
									"order" : 0,
									"source" : [ "obj-61", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-63", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-85", 0 ],
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 3 ],
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"order" : 1,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 0 ],
									"order" : 0,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-67", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-67", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"source" : [ "obj-69", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-7", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 1 ],
									"source" : [ "obj-70", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 0 ],
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"source" : [ "obj-77", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 0 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-79", 0 ],
									"source" : [ "obj-78", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 1 ],
									"source" : [ "obj-79", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 1 ],
									"source" : [ "obj-81", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"source" : [ "obj-81", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-85", 1 ],
									"source" : [ "obj-82", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-85", 1 ],
									"source" : [ "obj-83", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 0 ],
									"source" : [ "obj-84", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-83", 0 ],
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"order" : 0,
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"order" : 1,
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-9", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 27.0, 428.0, 65.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p cellblock"
				}

			}
, 			{
				"box" : 				{
					"automouse" : 0,
					"bgcolor" : [ 0.784313725490196, 0.788235294117647, 0.713725490196078, 1.0 ],
					"coldef" : [ [ 0, 200, 1, 0.0, 0.0, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 1, 440, 1, 0.0, 0.0, 0.0, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ] ],
					"cols" : 2,
					"colwidth" : 376,
					"fgcolor" : [ 0.462745098039216, 0.211764705882353, 0.109803921568627, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 14.0,
					"hcellcolor" : [ 0.670588235294118, 0.533333333333333, 0.47843137254902, 1.0 ],
					"headercolor" : [ 0.670588235294118, 0.533333333333333, 0.47843137254902, 1.0 ],
					"hscroll" : 0,
					"id" : "obj-12",
					"maxclass" : "jit.cellblock",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "list", "", "", "" ],
					"outmode" : 1,
					"patching_rect" : [ 40.0, 266.0, 673.0, 95.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 95.0, 659.0, 360.234567999839783 ],
					"rowheight" : 24,
					"sccolor" : [ 0.784313725490196, 0.788235294117647, 0.713725490196078, 1.0 ],
					"selmode" : 3,
					"stcolor" : [ 0.670588235294118, 0.533333333333333, 0.47843137254902, 1.0 ],
					"textcolor" : [ 0.669918298721313, 0.53278112411499, 0.48031011223793, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 16.0,
					"htabcolor" : [ 0.462745098039216, 0.211764705882353, 0.109803921568627, 1.0 ],
					"id" : "obj-1",
					"maxclass" : "tab",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.0, 120.0, 673.0, 136.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 95.0, 115.0, 360.234567999839783 ],
					"rounded" : 0.0,
					"tabcolor" : [ 0.782739460468292, 0.787176668643951, 0.712275743484497, 1.0 ],
					"tabs" : [ "blobs", "tracking", "faces", "features", "shape", "motion", "recognition", "lines", "morphology", "filtering", "perspective", "processing", "utility", "drawing", "new!" ],
					"textcolor" : [ 0.464262545108795, 0.210802227258682, 0.108338266611099, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-14", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 1 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ],
		"autosave" : 0,
		"bgcolor" : [ 0.735498070716858, 0.746474623680115, 0.656796932220459, 1.0 ]
	}

}

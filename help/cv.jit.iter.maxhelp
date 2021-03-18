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
		"rect" : [ 34.0, 79.0, 885.0, 627.0 ],
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
		"helpsidebarclosed" : 1,
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 13.0,
					"id" : "obj-15",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 51.0, 453.200000000000045, 75.0, 21.0 ],
					"text" : "int"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-16",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 135.0, 453.200000000000045, 251.0, 36.0 ],
					"text" : "The index of the row or column that will be output from the left outlet."
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-18",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 453.200000000000045, 19.0, 21.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 577.0, 311.5, 150.0, 47.0 ],
					"text" : "Open the Max console to see the output of the print objects."
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.356862745098039, 0.0, 1.0 ],
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "int" ],
					"patching_rect" : [ 679.0, 231.0, 76.0, 22.0 ],
					"text" : "cv.jit.iter cols"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 679.0, 272.0, 148.0, 22.0 ],
					"text" : "jit.print @title cols @info 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 517.0, 272.0, 152.0, 22.0 ],
					"text" : "jit.print @title rows @info 1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.356862745098039, 0.0, 1.0 ],
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "int" ],
					"patching_rect" : [ 517.0, 231.0, 80.0, 22.0 ],
					"text" : "cv.jit.iter rows"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 517.0, 129.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 517.0, 174.0, 119.0, 22.0 ],
					"text" : "jit.noise 2 float32 4 3"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.1 ],
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-21",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 538.0, 134.0, 40.0 ],
					"text" : "By Jean-Marc Pelletier\rjmp@jmpelletier.com\rCopyright ©2003-2020"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-20",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 51.0, 375.700000000000045, 70.0, 65.0 ],
					"text" : "(any type)\nAny planes\n2 dims"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 13.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 51.0, 353.200000000000045, 75.0, 21.0 ],
					"text" : "matrix"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-23",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 135.0, 353.200000000000045, 251.0, 36.0 ],
					"text" : "One row or one column of the input matrix."
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-25",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 353.200000000000045, 19.0, 21.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-17",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 51.0, 225.5, 75.0, 50.0 ],
					"text" : "(any type)\nAny planes\n2 dims"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 13.0,
					"id" : "obj-26",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 51.0, 203.0, 75.0, 21.0 ],
					"text" : "matrix"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-27",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 135.0, 203.0, 251.0, 21.0 ],
					"text" : "The input matrix."
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 203.0, 19.0, 21.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.423529411764706, 0.423529411764706, 0.423529411764706, 1.0 ],
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-28",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 323.200000000000045, 356.0, 21.0 ],
					"text" : "Outputs",
					"textcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.423529411764706, 0.423529411764706, 0.423529411764706, 1.0 ],
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-7",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 173.0, 356.0, 21.0 ],
					"text" : "Inputs",
					"textcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 13.0,
					"id" : "obj-30",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 105.0, 356.0, 36.0 ],
					"text" : "This works a lot like jit.iter but instead outputs one row or one column of the input matrix at a time."
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 18.0,
					"id" : "obj-32",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 75.0, 374.0, 27.0 ],
					"text" : "Output a matrix one row or column at a time"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 24.0,
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 30.0, 356.0, 33.0 ],
					"text" : "cv.jit.iter"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "cv.jit.iter.maxpat",
				"bootpath" : "~/dev/cycling/cv.jit/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "copyright-jmp.maxpat",
				"bootpath" : "~/dev/cycling/cv.jit/help",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}

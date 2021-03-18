autowatch=1
outlets=2

var cvjit = new Object();

function postln(s) {
	post(s+"\n");
}

function generate(csv) {
	var p = csv.split("/");
	p = p.splice(0, p.length-2).join("/");
	var f = new File(csv)
	var colline = f.readline();
	var cols = colline.split(',');
	var catidx = -1;
	for(i = 0; i < cols.length; i++) {
		if(cols[i] === "category") {
			catidx = i;
			break;
		}

	}
	while ((l = f.readline()) != null) {
		var rows = l.split(',');
		var cat = rows[catidx];
		var obname = rows[0];

		// make sure it exists
		var test = new Folder(p+"/externals/"+obname+".mxo");
		if(test.count === 0) {
			test = new File(obname+".maxpat");
			if(test.eof === 0) {
				postln("can't find " + obname)
				continue;
			}
		}

		var newob = new Object();
		for(i = 0; i < cols.length; i++) {
			newob[cols[i]] = rows[i];
		}
		
		var catob = null;
		if(cvjit.hasOwnProperty(cat)) {
			catob = cvjit[cat];
		}
		else {
			catob = new Object();
			cvjit[cat] = catob;
			outlet(1, "category", cat);
		}
		catob[obname] = newob;
	}
	
	var d = new Dict("cvjit"); 
	d.parse(JSON.stringify(cvjit));
	outlet(0, "dictionary", d.name);
}
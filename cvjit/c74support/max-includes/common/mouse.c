// mouse.c -- mouse moving code

void MoveMouseTo(Point *pt);
void MoveToCenter(Rect *b);

enum // old low memory globals for old systems
{
	CrsrNew = 0x8CE,
	CrsrCouple = 0x8CF,
	MTemp = 0x828,
	RawMouse = 0x82C,
	jCrsrTask = 0x8EE,
	_CrsrDevDispatch = 0xAADB
};

#ifdef powerc
UniversalProcPtr jCrsrTaskUPP = 0;
#define crsrProcInfo kPascalStackBased

static pascal void CallCrsr()
{
	if (jCrsrTaskUPP == NULL)
		jCrsrTaskUPP = NewRoutineDescriptor(*(ProcPtr *)jCrsrTask, crsrProcInfo, kM68kISA);
	CallUniversalProc(jCrsrTaskUPP, crsrProcInfo);
}
#else

static pascal void asm CallCrsr() // = {0x2078, 0x08EE, 0x4E90};
{
	MOVE.L D3,-(A7)
	MOVE.L  jCrsrTask,A0
	JSR (A0)
	MOVE.L	(A7)+,D3
	RTS
}

#endif

void MoveMouseTo(Point *pt)
{
#if 0
   if (TrapAvailable((short)_CrsrDevDispatch)) {
		// If we get here we have the CDM
   		CrsrDev  *firstMouse;

		firstMouse = nil;   // start at head of cursor dev list
		CrsrDevNextDevice(&firstMouse); // get the next cursor device
		// Call CDM to move the mouse
		CrsrDevMoveTo(firstMouse, (long)pt->h, (long)pt->v);
	} else {
#endif
		static short phase = 1;
	   // No CDM so we use the low memory globals
			
		*(Boolean *)CrsrCouple = FALSE;
		((Point *)RawMouse)->h = pt->h + phase;
		((Point *)RawMouse)->v = pt->v + phase;
		*(Point *)MTemp = *(Point *)RawMouse;
		phase = -phase;
		*(Ptr)CrsrNew = 0xFF;
		*(Ptr)CrsrCouple = 0xFF;
		CallCrsr(); // must call jCrsrTask to update system
#if 0
	}
#endif
}

void MoveToCenter(Rect *b)
{
	Point p;
	
	p.h = (b->right - b->left)>>1;
	p.v = (b->bottom - b->top)>>1;
	MoveMouseTo(&p);
}



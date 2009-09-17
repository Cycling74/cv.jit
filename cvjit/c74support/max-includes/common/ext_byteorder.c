
float byteorder_swapf32(float f){
	unsigned char c,*a;

	a = (unsigned char *)&f;
	c=a[3]; a[3]=a[0]; a[0]=c;
	c=a[2]; a[2]=a[1]; a[1]=c;

	return f;
}

double byteorder_swapf64(double f){
	unsigned char c,*a;

	a = (unsigned char *)&f;
	c=a[7]; a[7]=a[0]; a[0]=c;
	c=a[6]; a[6]=a[1]; a[1]=c;
	c=a[5]; a[5]=a[2]; a[2]=c;
	c=a[4]; a[4]=a[3]; a[3]=c;

	return f;
}	
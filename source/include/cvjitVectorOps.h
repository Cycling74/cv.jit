/*
 cvjitVectorOps.h
 
 
 Copyright 2010, Jean-Marc Pelletier
 jmp@iamas.ac.jp
 
 This file is part of cv.jit.
 
 cv.jit is free software: you can redistribute it and/or modify
 it under the terms of the GNU Lesser General Public License as published 
 by the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 cv.jit is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public License
 along with cv.jit.  If not, see <http://www.gnu.org/licenses/>.
 
 */



typedef double double2[2];
typedef float float4[4];
typedef long long4[4];
typedef short short8[8];
typedef char char16[16];

#define set_double2(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)a[vector_iterator] = b;}
#define set_float4(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)a[vector_iterator] = b;}
#define set_long4(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)a[vector_iterator] = b;}
#define set_short8(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)a[vector_iterator] = b;}
#define set_char16(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)a[vector_iterator] = b;}

#define copy_double2(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)b[vector_iterator] = a[vector_iterator];}
#define copy_float4(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)b[vector_iterator] = a[vector_iterator];}
#define copy_long4(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)b[vector_iterator] = a[vector_iterator];}
#define copy_short8(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)b[vector_iterator] = a[vector_iterator];}
#define copy_char16(a,b) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)b[vector_iterator] = a[vector_iterator];}

#define add_double2(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b[vector_iterator];}
#define add_float4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b[vector_iterator];}
#define add_long4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b[vector_iterator];}
#define add_short8(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b[vector_iterator];}
#define add_char16(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b[vector_iterator];}

#define add_scalar_double2(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b;}
#define add_scalar_float4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b;}
#define add_scalar_long4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b;}
#define add_scalar_short8(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b;}
#define add_scalar_char16(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)c[vector_iterator] = a[vector_iterator] + b;}

#define sub_double2(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b[vector_iterator];}
#define sub_float4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b[vector_iterator];}
#define sub_long4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b[vector_iterator];}
#define sub_short8(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b[vector_iterator];}
#define sub_char16(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b[vector_iterator];}

#define sub_scalar_double2(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b;}
#define sub_scalar_float4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b;}
#define sub_scalar_long4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b;}
#define sub_scalar_short8(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b;}
#define sub_scalar_char16(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)c[vector_iterator] = a[vector_iterator] - b;}

#define mult_double2(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b[vector_iterator];}
#define mult_float4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b[vector_iterator];}
#define mult_long4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b[vector_iterator];}
#define mult_short8(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b[vector_iterator];}
#define mult_char16(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b[vector_iterator];}

#define mult_scalar_double2(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b;}
#define mult_scalar_float4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b;}
#define mult_scalar_long4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b;}
#define mult_scalar_short8(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b;}
#define mult_scalar_char16(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)c[vector_iterator] = a[vector_iterator] * b;}

#define div_double2(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b[vector_iterator];}
#define div_float4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b[vector_iterator];}
#define div_long4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b[vector_iterator];}
#define div_short8(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b[vector_iterator];}
#define div_char16(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b[vector_iterator];}

#define div_scalar_double2(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<2;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b;}
#define div_scalar_float4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b;}
#define div_scalar_long4(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<4;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b;}
#define div_scalar_short8(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<8;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b;}
#define div_scalar_char16(a,b,c) {int vector_iterator; for(vector_iterator=0;vector_iterator<16;vector_iterator++)c[vector_iterator] = a[vector_iterator] / b;}
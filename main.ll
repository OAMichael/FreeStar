; ModuleID = '/home/michael/Desktop/MIPT/FreeStar/main.c'
source_filename = "/home/michael/Desktop/MIPT/FreeStar/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Cell = type { i32, i32 }
%struct.colorRGBA8 = type { i8, i8, i8, i8 }

@g_Cells = internal global [15625 x %struct.Cell] zeroinitializer, align 16
@g_Pixels = internal global [1000000 x %struct.colorRGBA8] zeroinitializer, align 16
@getRandomInt.a = internal constant i32 15315, align 4
@getRandomInt.b = internal constant i32 486463, align 4
@getRandomInt.m = internal constant i32 7946431, align 4
@getRandomInt.currX = internal global i32 0, align 4
@updatePixels.swapCells = internal global [15625 x %struct.Cell] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i32 0, i32* %1, align 4
  call void @initCells()
  call void (...) @flush()
  store i64 1, i64* %2, align 8
  br label %3

3:                                                ; preds = %0, %8
  %4 = load i64, i64* %2, align 8
  %5 = urem i64 %4, 20000000
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %3
  call void @updatePixels()
  call void (...) @flush()
  br label %8

8:                                                ; preds = %7, %3
  %9 = load i64, i64* %2, align 8
  %10 = add i64 %9, 1
  store i64 %10, i64* %2, align 8
  br label %3
}

declare dso_local void @flush(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @initCells() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.colorRGBA8, align 1
  store i32 0, i32* %1, align 4
  br label %5

5:                                                ; preds = %50, %0
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %6, 125
  br i1 %7, label %8, label %53

8:                                                ; preds = %5
  store i32 0, i32* %2, align 4
  br label %9

9:                                                ; preds = %46, %8
  %10 = load i32, i32* %2, align 4
  %11 = icmp slt i32 %10, 125
  br i1 %11, label %12, label %49

12:                                               ; preds = %9
  %13 = call i32 @getRandomBool()
  store i32 %13, i32* %3, align 4
  %14 = load i32, i32* %3, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %45

16:                                               ; preds = %12
  %17 = load i32, i32* %3, align 4
  %18 = load i32, i32* %2, align 4
  %19 = load i32, i32* %1, align 4
  %20 = mul nsw i32 %19, 125
  %21 = add nsw i32 %18, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.Cell, %struct.Cell* %23, i32 0, i32 0
  store i32 %17, i32* %24, align 8
  %25 = load i32, i32* %3, align 4
  %26 = load i32, i32* %2, align 4
  %27 = load i32, i32* %1, align 4
  %28 = mul nsw i32 %27, 125
  %29 = add nsw i32 %26, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.Cell, %struct.Cell* %31, i32 0, i32 1
  store i32 %25, i32* %32, align 4
  %33 = bitcast %struct.colorRGBA8* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %33, i8 0, i64 4, i1 false)
  %34 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %4, i32 0, i32 0
  store i8 0, i8* %34, align 1
  %35 = load i32, i32* %3, align 4
  %36 = mul nsw i32 %35, 255
  %37 = trunc i32 %36 to i8
  %38 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %4, i32 0, i32 1
  store i8 %37, i8* %38, align 1
  %39 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %4, i32 0, i32 2
  store i8 0, i8* %39, align 1
  %40 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %4, i32 0, i32 3
  store i8 -1, i8* %40, align 1
  %41 = load i32, i32* %2, align 4
  %42 = load i32, i32* %1, align 4
  %43 = bitcast %struct.colorRGBA8* %4 to i32*
  %44 = load i32, i32* %43, align 1
  call void @paintCellPixels(i32 %41, i32 %42, i32 %44)
  br label %45

45:                                               ; preds = %16, %12
  br label %46

46:                                               ; preds = %45
  %47 = load i32, i32* %2, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %2, align 4
  br label %9

49:                                               ; preds = %9
  br label %50

50:                                               ; preds = %49
  %51 = load i32, i32* %1, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %1, align 4
  br label %5

53:                                               ; preds = %5
  call void @setPixels(i32 0, i32 0, i32 1000, i32 1000, %struct.colorRGBA8* getelementptr inbounds ([1000000 x %struct.colorRGBA8], [1000000 x %struct.colorRGBA8]* @g_Pixels, i64 0, i64 0))
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @paintCellPixels(i32 %0, i32 %1, i32 %2) #0 {
  %4 = alloca %struct.colorRGBA8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = bitcast %struct.colorRGBA8* %4 to i32*
  store i32 %2, i32* %9, align 1
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  %10 = load i32, i32* %6, align 4
  %11 = mul nsw i32 %10, 8
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %7, align 4
  br label %13

13:                                               ; preds = %72, %3
  %14 = load i32, i32* %7, align 4
  %15 = load i32, i32* %6, align 4
  %16 = mul nsw i32 %15, 8
  %17 = add nsw i32 %16, 8
  %18 = sub nsw i32 %17, 1
  %19 = icmp slt i32 %14, %18
  br i1 %19, label %20, label %75

20:                                               ; preds = %13
  %21 = load i32, i32* %5, align 4
  %22 = mul nsw i32 %21, 8
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %8, align 4
  br label %24

24:                                               ; preds = %68, %20
  %25 = load i32, i32* %8, align 4
  %26 = load i32, i32* %5, align 4
  %27 = mul nsw i32 %26, 8
  %28 = add nsw i32 %27, 8
  %29 = sub nsw i32 %28, 1
  %30 = icmp slt i32 %25, %29
  br i1 %30, label %31, label %71

31:                                               ; preds = %24
  %32 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %4, i32 0, i32 0
  %33 = load i8, i8* %32, align 1
  %34 = load i32, i32* %8, align 4
  %35 = load i32, i32* %7, align 4
  %36 = mul nsw i32 1000, %35
  %37 = add nsw i32 %34, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1000000 x %struct.colorRGBA8], [1000000 x %struct.colorRGBA8]* @g_Pixels, i64 0, i64 %38
  %40 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %39, i32 0, i32 0
  store i8 %33, i8* %40, align 4
  %41 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %4, i32 0, i32 1
  %42 = load i8, i8* %41, align 1
  %43 = load i32, i32* %8, align 4
  %44 = load i32, i32* %7, align 4
  %45 = mul nsw i32 1000, %44
  %46 = add nsw i32 %43, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [1000000 x %struct.colorRGBA8], [1000000 x %struct.colorRGBA8]* @g_Pixels, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %48, i32 0, i32 1
  store i8 %42, i8* %49, align 1
  %50 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %4, i32 0, i32 2
  %51 = load i8, i8* %50, align 1
  %52 = load i32, i32* %8, align 4
  %53 = load i32, i32* %7, align 4
  %54 = mul nsw i32 1000, %53
  %55 = add nsw i32 %52, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1000000 x %struct.colorRGBA8], [1000000 x %struct.colorRGBA8]* @g_Pixels, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %57, i32 0, i32 2
  store i8 %51, i8* %58, align 2
  %59 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %4, i32 0, i32 3
  %60 = load i8, i8* %59, align 1
  %61 = load i32, i32* %8, align 4
  %62 = load i32, i32* %7, align 4
  %63 = mul nsw i32 1000, %62
  %64 = add nsw i32 %61, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [1000000 x %struct.colorRGBA8], [1000000 x %struct.colorRGBA8]* @g_Pixels, i64 0, i64 %65
  %67 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %66, i32 0, i32 3
  store i8 %60, i8* %67, align 1
  br label %68

68:                                               ; preds = %31
  %69 = load i32, i32* %8, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %8, align 4
  br label %24

71:                                               ; preds = %24
  br label %72

72:                                               ; preds = %71
  %73 = load i32, i32* %7, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %7, align 4
  br label %13

75:                                               ; preds = %13
  ret void
}

declare dso_local void @setPixels(i32, i32, i32, i32, %struct.colorRGBA8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @getRandomBool() #0 {
  %1 = call i32 @getRandomInt()
  %2 = srem i32 %1, 2
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @getRandomInt() #0 {
  %1 = load i32, i32* @getRandomInt.currX, align 4
  %2 = mul nsw i32 15315, %1
  %3 = add nsw i32 %2, 486463
  %4 = srem i32 %3, 7946431
  store i32 %4, i32* @getRandomInt.currX, align 4
  %5 = load i32, i32* @getRandomInt.currX, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @updatePixels() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [8 x i32], align 16
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.colorRGBA8, align 1
  %17 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %18

18:                                               ; preds = %209, %0
  %19 = load i32, i32* %1, align 4
  %20 = icmp slt i32 %19, 125
  br i1 %20, label %21, label %212

21:                                               ; preds = %18
  store i32 0, i32* %2, align 4
  br label %22

22:                                               ; preds = %205, %21
  %23 = load i32, i32* %2, align 4
  %24 = icmp slt i32 %23, 125
  br i1 %24, label %25, label %208

25:                                               ; preds = %22
  %26 = load i32, i32* %2, align 4
  %27 = load i32, i32* %1, align 4
  %28 = mul nsw i32 %27, 125
  %29 = add nsw i32 %26, %28
  store i32 %29, i32* %3, align 4
  %30 = load i32, i32* %2, align 4
  %31 = sub nsw i32 %30, 1
  %32 = add nsw i32 %31, 125
  %33 = srem i32 %32, 125
  store i32 %33, i32* %4, align 4
  %34 = load i32, i32* %2, align 4
  %35 = add nsw i32 %34, 0
  %36 = srem i32 %35, 125
  store i32 %36, i32* %5, align 4
  %37 = load i32, i32* %2, align 4
  %38 = add nsw i32 %37, 1
  %39 = srem i32 %38, 125
  store i32 %39, i32* %6, align 4
  %40 = load i32, i32* %1, align 4
  %41 = sub nsw i32 %40, 1
  %42 = add nsw i32 %41, 125
  %43 = srem i32 %42, 125
  store i32 %43, i32* %7, align 4
  %44 = load i32, i32* %1, align 4
  %45 = add nsw i32 %44, 0
  %46 = srem i32 %45, 125
  store i32 %46, i32* %8, align 4
  %47 = load i32, i32* %1, align 4
  %48 = add nsw i32 %47, 1
  %49 = srem i32 %48, 125
  store i32 %49, i32* %9, align 4
  %50 = getelementptr inbounds [8 x i32], [8 x i32]* %10, i64 0, i64 0
  %51 = load i32, i32* %4, align 4
  %52 = load i32, i32* %7, align 4
  %53 = mul nsw i32 %52, 125
  %54 = add nsw i32 %51, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %55
  %57 = getelementptr inbounds %struct.Cell, %struct.Cell* %56, i32 0, i32 0
  %58 = load i32, i32* %57, align 8
  store i32 %58, i32* %50, align 4
  %59 = getelementptr inbounds i32, i32* %50, i64 1
  %60 = load i32, i32* %4, align 4
  %61 = load i32, i32* %8, align 4
  %62 = mul nsw i32 %61, 125
  %63 = add nsw i32 %60, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %64
  %66 = getelementptr inbounds %struct.Cell, %struct.Cell* %65, i32 0, i32 0
  %67 = load i32, i32* %66, align 8
  store i32 %67, i32* %59, align 4
  %68 = getelementptr inbounds i32, i32* %59, i64 1
  %69 = load i32, i32* %4, align 4
  %70 = load i32, i32* %9, align 4
  %71 = mul nsw i32 %70, 125
  %72 = add nsw i32 %69, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %73
  %75 = getelementptr inbounds %struct.Cell, %struct.Cell* %74, i32 0, i32 0
  %76 = load i32, i32* %75, align 8
  store i32 %76, i32* %68, align 4
  %77 = getelementptr inbounds i32, i32* %68, i64 1
  %78 = load i32, i32* %5, align 4
  %79 = load i32, i32* %7, align 4
  %80 = mul nsw i32 %79, 125
  %81 = add nsw i32 %78, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %82
  %84 = getelementptr inbounds %struct.Cell, %struct.Cell* %83, i32 0, i32 0
  %85 = load i32, i32* %84, align 8
  store i32 %85, i32* %77, align 4
  %86 = getelementptr inbounds i32, i32* %77, i64 1
  %87 = load i32, i32* %5, align 4
  %88 = load i32, i32* %9, align 4
  %89 = mul nsw i32 %88, 125
  %90 = add nsw i32 %87, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %91
  %93 = getelementptr inbounds %struct.Cell, %struct.Cell* %92, i32 0, i32 0
  %94 = load i32, i32* %93, align 8
  store i32 %94, i32* %86, align 4
  %95 = getelementptr inbounds i32, i32* %86, i64 1
  %96 = load i32, i32* %6, align 4
  %97 = load i32, i32* %7, align 4
  %98 = mul nsw i32 %97, 125
  %99 = add nsw i32 %96, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %100
  %102 = getelementptr inbounds %struct.Cell, %struct.Cell* %101, i32 0, i32 0
  %103 = load i32, i32* %102, align 8
  store i32 %103, i32* %95, align 4
  %104 = getelementptr inbounds i32, i32* %95, i64 1
  %105 = load i32, i32* %6, align 4
  %106 = load i32, i32* %8, align 4
  %107 = mul nsw i32 %106, 125
  %108 = add nsw i32 %105, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %109
  %111 = getelementptr inbounds %struct.Cell, %struct.Cell* %110, i32 0, i32 0
  %112 = load i32, i32* %111, align 8
  store i32 %112, i32* %104, align 4
  %113 = getelementptr inbounds i32, i32* %104, i64 1
  %114 = load i32, i32* %6, align 4
  %115 = load i32, i32* %9, align 4
  %116 = mul nsw i32 %115, 125
  %117 = add nsw i32 %114, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %118
  %120 = getelementptr inbounds %struct.Cell, %struct.Cell* %119, i32 0, i32 0
  %121 = load i32, i32* %120, align 8
  store i32 %121, i32* %113, align 4
  store i32 0, i32* %11, align 4
  store i32 0, i32* %12, align 4
  br label %122

122:                                              ; preds = %135, %25
  %123 = load i32, i32* %12, align 4
  %124 = icmp slt i32 %123, 8
  br i1 %124, label %125, label %138

125:                                              ; preds = %122
  %126 = load i32, i32* %12, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [8 x i32], [8 x i32]* %10, i64 0, i64 %127
  %129 = load i32, i32* %128, align 4
  %130 = icmp eq i32 %129, 1
  br i1 %130, label %131, label %134

131:                                              ; preds = %125
  %132 = load i32, i32* %11, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %11, align 4
  br label %134

134:                                              ; preds = %131, %125
  br label %135

135:                                              ; preds = %134
  %136 = load i32, i32* %12, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %12, align 4
  br label %122

138:                                              ; preds = %122
  %139 = load i32, i32* %3, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %140
  %142 = getelementptr inbounds %struct.Cell, %struct.Cell* %141, i32 0, i32 0
  %143 = load i32, i32* %142, align 8
  %144 = icmp eq i32 %143, 1
  br i1 %144, label %145, label %182

145:                                              ; preds = %138
  %146 = load i32, i32* %11, align 4
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %157, label %148

148:                                              ; preds = %145
  %149 = load i32, i32* %11, align 4
  %150 = icmp eq i32 %149, 3
  br i1 %150, label %157, label %151

151:                                              ; preds = %148
  %152 = load i32, i32* %11, align 4
  %153 = icmp eq i32 %152, 4
  br i1 %153, label %157, label %154

154:                                              ; preds = %151
  %155 = load i32, i32* %11, align 4
  %156 = icmp eq i32 %155, 5
  br i1 %156, label %157, label %172

157:                                              ; preds = %154, %151, %148, %145
  %158 = load i32, i32* %3, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %159
  %161 = getelementptr inbounds %struct.Cell, %struct.Cell* %160, i32 0, i32 0
  store i32 1, i32* %161, align 8
  %162 = load i32, i32* %3, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %163
  %165 = getelementptr inbounds %struct.Cell, %struct.Cell* %164, i32 0, i32 1
  %166 = load i32, i32* %165, align 4
  %167 = add i32 %166, 1
  %168 = load i32, i32* %3, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %169
  %171 = getelementptr inbounds %struct.Cell, %struct.Cell* %170, i32 0, i32 1
  store i32 %167, i32* %171, align 4
  br label %181

172:                                              ; preds = %154
  %173 = load i32, i32* %3, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %174
  %176 = getelementptr inbounds %struct.Cell, %struct.Cell* %175, i32 0, i32 0
  store i32 0, i32* %176, align 8
  %177 = load i32, i32* %3, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %178
  %180 = getelementptr inbounds %struct.Cell, %struct.Cell* %179, i32 0, i32 1
  store i32 0, i32* %180, align 4
  br label %181

181:                                              ; preds = %172, %157
  br label %204

182:                                              ; preds = %138
  %183 = load i32, i32* %11, align 4
  %184 = icmp eq i32 %183, 2
  br i1 %184, label %185, label %194

185:                                              ; preds = %182
  %186 = load i32, i32* %3, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %187
  %189 = getelementptr inbounds %struct.Cell, %struct.Cell* %188, i32 0, i32 0
  store i32 1, i32* %189, align 8
  %190 = load i32, i32* %3, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %191
  %193 = getelementptr inbounds %struct.Cell, %struct.Cell* %192, i32 0, i32 1
  store i32 1, i32* %193, align 4
  br label %203

194:                                              ; preds = %182
  %195 = load i32, i32* %3, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %196
  %198 = getelementptr inbounds %struct.Cell, %struct.Cell* %197, i32 0, i32 0
  store i32 0, i32* %198, align 8
  %199 = load i32, i32* %3, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %200
  %202 = getelementptr inbounds %struct.Cell, %struct.Cell* %201, i32 0, i32 1
  store i32 0, i32* %202, align 4
  br label %203

203:                                              ; preds = %194, %185
  br label %204

204:                                              ; preds = %203, %181
  br label %205

205:                                              ; preds = %204
  %206 = load i32, i32* %2, align 4
  %207 = add nsw i32 %206, 1
  store i32 %207, i32* %2, align 4
  br label %22

208:                                              ; preds = %22
  br label %209

209:                                              ; preds = %208
  %210 = load i32, i32* %1, align 4
  %211 = add nsw i32 %210, 1
  store i32 %211, i32* %1, align 4
  br label %18

212:                                              ; preds = %18
  store i32 0, i32* %13, align 4
  br label %213

213:                                              ; preds = %315, %212
  %214 = load i32, i32* %13, align 4
  %215 = icmp slt i32 %214, 125
  br i1 %215, label %216, label %318

216:                                              ; preds = %213
  store i32 0, i32* %14, align 4
  br label %217

217:                                              ; preds = %311, %216
  %218 = load i32, i32* %14, align 4
  %219 = icmp slt i32 %218, 125
  br i1 %219, label %220, label %314

220:                                              ; preds = %217
  %221 = load i32, i32* %14, align 4
  %222 = load i32, i32* %13, align 4
  %223 = mul nsw i32 %222, 125
  %224 = add nsw i32 %221, %223
  store i32 %224, i32* %15, align 4
  %225 = load i32, i32* %15, align 4
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %226
  %228 = getelementptr inbounds %struct.Cell, %struct.Cell* %227, i32 0, i32 0
  %229 = load i32, i32* %228, align 8
  %230 = load i32, i32* %15, align 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %231
  %233 = getelementptr inbounds %struct.Cell, %struct.Cell* %232, i32 0, i32 0
  store i32 %229, i32* %233, align 8
  %234 = load i32, i32* %15, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @updatePixels.swapCells, i64 0, i64 %235
  %237 = getelementptr inbounds %struct.Cell, %struct.Cell* %236, i32 0, i32 1
  %238 = load i32, i32* %237, align 4
  %239 = load i32, i32* %15, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %240
  %242 = getelementptr inbounds %struct.Cell, %struct.Cell* %241, i32 0, i32 1
  store i32 %238, i32* %242, align 4
  %243 = bitcast %struct.colorRGBA8* %16 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %243, i8 0, i64 4, i1 false)
  %244 = load i32, i32* %15, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %245
  %247 = getelementptr inbounds %struct.Cell, %struct.Cell* %246, i32 0, i32 1
  %248 = load i32, i32* %247, align 4
  %249 = icmp eq i32 %248, 10
  br i1 %249, label %250, label %259

250:                                              ; preds = %220
  %251 = load i32, i32* %15, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %252
  %254 = getelementptr inbounds %struct.Cell, %struct.Cell* %253, i32 0, i32 0
  store i32 0, i32* %254, align 8
  %255 = load i32, i32* %15, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %256
  %258 = getelementptr inbounds %struct.Cell, %struct.Cell* %257, i32 0, i32 1
  store i32 0, i32* %258, align 4
  br label %259

259:                                              ; preds = %250, %220
  %260 = load i32, i32* %15, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %261
  %263 = getelementptr inbounds %struct.Cell, %struct.Cell* %262, i32 0, i32 0
  %264 = load i32, i32* %263, align 8
  %265 = icmp eq i32 %264, 1
  br i1 %265, label %266, label %306

266:                                              ; preds = %259
  %267 = load i32, i32* %15, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %268
  %270 = getelementptr inbounds %struct.Cell, %struct.Cell* %269, i32 0, i32 1
  %271 = load i32, i32* %270, align 4
  store i32 %271, i32* %17, align 4
  %272 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %16, i32 0, i32 0
  store i8 0, i8* %272, align 1
  %273 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %16, i32 0, i32 1
  store i8 0, i8* %273, align 1
  %274 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %16, i32 0, i32 2
  store i8 0, i8* %274, align 1
  %275 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %16, i32 0, i32 3
  store i8 -1, i8* %275, align 1
  %276 = load i32, i32* %17, align 4
  %277 = icmp sgt i32 %276, 6
  br i1 %277, label %278, label %285

278:                                              ; preds = %266
  %279 = load i32, i32* %17, align 4
  %280 = sub nsw i32 10, %279
  %281 = mul nsw i32 2, %280
  %282 = sub nsw i32 127, %281
  %283 = trunc i32 %282 to i8
  %284 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %16, i32 0, i32 0
  store i8 %283, i8* %284, align 1
  br label %285

285:                                              ; preds = %278, %266
  %286 = load i32, i32* %17, align 4
  %287 = icmp slt i32 %286, 5
  br i1 %287, label %288, label %297

288:                                              ; preds = %285
  %289 = load i32, i32* %15, align 4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [15625 x %struct.Cell], [15625 x %struct.Cell]* @g_Cells, i64 0, i64 %290
  %292 = getelementptr inbounds %struct.Cell, %struct.Cell* %291, i32 0, i32 1
  %293 = load i32, i32* %292, align 4
  %294 = udiv i32 255, %293
  %295 = trunc i32 %294 to i8
  %296 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %16, i32 0, i32 1
  store i8 %295, i8* %296, align 1
  br label %297

297:                                              ; preds = %288, %285
  %298 = load i32, i32* %17, align 4
  %299 = icmp sge i32 %298, 5
  br i1 %299, label %300, label %305

300:                                              ; preds = %297
  %301 = load i32, i32* %17, align 4
  %302 = icmp sle i32 %301, 6
  br i1 %302, label %303, label %305

303:                                              ; preds = %300
  %304 = getelementptr inbounds %struct.colorRGBA8, %struct.colorRGBA8* %16, i32 0, i32 2
  store i8 127, i8* %304, align 1
  br label %305

305:                                              ; preds = %303, %300, %297
  br label %306

306:                                              ; preds = %305, %259
  %307 = load i32, i32* %14, align 4
  %308 = load i32, i32* %13, align 4
  %309 = bitcast %struct.colorRGBA8* %16 to i32*
  %310 = load i32, i32* %309, align 1
  call void @paintCellPixels(i32 %307, i32 %308, i32 %310)
  br label %311

311:                                              ; preds = %306
  %312 = load i32, i32* %14, align 4
  %313 = add nsw i32 %312, 1
  store i32 %313, i32* %14, align 4
  br label %217

314:                                              ; preds = %217
  br label %315

315:                                              ; preds = %314
  %316 = load i32, i32* %13, align 4
  %317 = add nsw i32 %316, 1
  store i32 %317, i32* %13, align 4
  br label %213

318:                                              ; preds = %213
  call void @setPixels(i32 0, i32 0, i32 1000, i32 1000, %struct.colorRGBA8* getelementptr inbounds ([1000000 x %struct.colorRGBA8], [1000000 x %struct.colorRGBA8]* @g_Pixels, i64 0, i64 0))
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [352 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [704 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 192
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 272
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 309
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 38948123, ; 7: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 317
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42244203, ; 9: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 326
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 142
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 350
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 203
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 83839681, ; 16: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 334
	i32 101534019, ; 17: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 291
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 291
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 136
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 312
	i32 136584136, ; 22: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 349
	i32 140062828, ; 23: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 342
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 244
	i32 176265551, ; 28: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 29: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 293
	i32 184328833, ; 30: System.ValueTuple.dll => 0xafca281 => 148
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 242
	i32 220171995, ; 33: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 34: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 266
	i32 230752869, ; 35: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 36: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 37: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 38: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 39: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 248
	i32 266337479, ; 40: Xamarin.Google.Guava.FailureAccess.dll => 0xfdffcc7 => 308
	i32 276479776, ; 41: System.Threading.Timer.dll => 0x107abf20 => 144
	i32 278686392, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 268
	i32 280482487, ; 43: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 265
	i32 291076382, ; 44: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 293579439, ; 45: ExoPlayer.Dash.dll => 0x117faaaf => 218
	i32 298918909, ; 46: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 47: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 347
	i32 318968648, ; 48: Xamarin.AndroidX.Activity.dll => 0x13031348 => 233
	i32 321597661, ; 49: System.Numerics => 0x132b30dd => 82
	i32 321963286, ; 50: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 325
	i32 342366114, ; 51: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 267
	i32 347068432, ; 52: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 207
	i32 360082299, ; 53: System.ServiceModel.Web => 0x15766b7b => 130
	i32 364027000, ; 54: Kotlin.Parcelize.Runtime.Maui.dll => 0x15b29c78 => 179
	i32 367780167, ; 55: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 56: System.Transactions.Local => 0x1658bf94 => 146
	i32 375677976, ; 57: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 58: System.Threading.Thread.dll => 0x16a510e1 => 142
	i32 385762202, ; 59: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 60: System.Threading.ThreadPool.dll => 0x1766c1f7 => 143
	i32 395744057, ; 61: _Microsoft.Android.Resource.Designer => 0x17969339 => 351
	i32 403441872, ; 62: WindowsBase => 0x180c08d0 => 162
	i32 409257351, ; 63: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 345
	i32 416634953, ; 64: ImageCropper.Maui.dll => 0x18d55849 => 177
	i32 439227014, ; 65: Kotlin.Android.Extensions.Runtime.Maui => 0x1a2e1286 => 178
	i32 441335492, ; 66: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 249
	i32 442565967, ; 67: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 68: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 263
	i32 451504562, ; 69: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 452127346, ; 70: ExoPlayer.Database.dll => 0x1af2ea72 => 219
	i32 456227837, ; 71: System.Web.HttpUtility.dll => 0x1b317bfd => 149
	i32 459347974, ; 72: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465846621, ; 73: mscorlib => 0x1bc4415d => 163
	i32 469710990, ; 74: System.dll => 0x1bff388e => 161
	i32 476646585, ; 75: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 265
	i32 486930444, ; 76: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 278
	i32 489220957, ; 77: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 323
	i32 498788369, ; 78: System.ObjectModel => 0x1dbae811 => 83
	i32 513247710, ; 79: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 197
	i32 526420162, ; 80: System.Transactions.dll => 0x1f6088c2 => 147
	i32 527452488, ; 81: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 312
	i32 530272170, ; 82: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 538707440, ; 83: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 344
	i32 539058512, ; 84: Microsoft.Extensions.Logging => 0x20216150 => 193
	i32 540030774, ; 85: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 86: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 87: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 88: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 89: Jsr305Binding => 0x213954e7 => 304
	i32 569601784, ; 90: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 302
	i32 577335427, ; 91: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 597488923, ; 92: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 601371474, ; 93: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 94: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 95: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 615902610, ; 96: Kotlin.Parcelize.Runtime.Maui => 0x24b5ed92 => 179
	i32 620065123, ; 97: ImageCropper.Maui => 0x24f57163 => 177
	i32 626887733, ; 98: ExoPlayer.Container => 0x255d8c35 => 216
	i32 627609679, ; 99: Xamarin.AndroidX.CustomView => 0x2568904f => 254
	i32 627931235, ; 100: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 336
	i32 639843206, ; 101: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 261
	i32 643868501, ; 102: System.Net => 0x2660a755 => 80
	i32 662205335, ; 103: System.Text.Encodings.Web.dll => 0x27787397 => 212
	i32 663517072, ; 104: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 298
	i32 666292255, ; 105: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 240
	i32 672442732, ; 106: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 107: System.Net.Security => 0x28bdabca => 72
	i32 690569205, ; 108: System.Xml.Linq.dll => 0x29293ff5 => 152
	i32 691348768, ; 109: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 314
	i32 693804605, ; 110: System.Windows => 0x295a9e3d => 151
	i32 699345723, ; 111: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 112: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 310
	i32 700358131, ; 113: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 720511267, ; 114: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 313
	i32 722857257, ; 115: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 735137430, ; 116: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 748832960, ; 117: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 205
	i32 752232764, ; 118: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 119: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 230
	i32 759454413, ; 120: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 121: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 122: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 123: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 342
	i32 789151979, ; 124: Microsoft.Extensions.Options => 0x2f0980eb => 196
	i32 790371945, ; 125: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 255
	i32 804715423, ; 126: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 127: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 270
	i32 812693636, ; 128: ExoPlayer.Dash => 0x3070b884 => 218
	i32 823281589, ; 129: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 130: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 131: System.Xml.XPath.dll => 0x31a103c6 => 157
	i32 834051424, ; 132: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 133: Xamarin.AndroidX.Print => 0x3246f6cd => 284
	i32 869139383, ; 134: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 327
	i32 873119928, ; 135: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 136: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 137: System.Net.Http.Json => 0x3463c971 => 62
	i32 880668424, ; 138: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 341
	i32 904024072, ; 139: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 140: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 915551335, ; 141: ExoPlayer.Ext.MediaSession => 0x36923467 => 224
	i32 918734561, ; 142: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 338
	i32 928116545, ; 143: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 309
	i32 939704684, ; 144: ExoPlayer.Extractor => 0x3802c16c => 222
	i32 952186615, ; 145: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 956575887, ; 146: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 313
	i32 956853935, ; 147: Microsoft.EntityFrameworkCore.Proxies.dll => 0x39086eaf => 183
	i32 961460050, ; 148: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 331
	i32 966729478, ; 149: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 305
	i32 967690846, ; 150: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 267
	i32 975236339, ; 151: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 152: System.Xml.XDocument => 0x3a2aaa1d => 155
	i32 986514023, ; 153: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 154: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 990727110, ; 155: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 340
	i32 992768348, ; 156: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 157: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 1001831731, ; 158: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 159: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 288
	i32 1019214401, ; 160: System.Drawing => 0x3cbffa41 => 35
	i32 1028013380, ; 161: ExoPlayer.UI.dll => 0x3d463d44 => 228
	i32 1028951442, ; 162: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 191
	i32 1031528504, ; 163: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 306
	i32 1035644815, ; 164: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 238
	i32 1036536393, ; 165: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1043950537, ; 166: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 321
	i32 1044663988, ; 167: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1052210849, ; 168: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 274
	i32 1067306892, ; 169: GoogleGson => 0x3f9dcf8c => 176
	i32 1082857460, ; 170: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 171: Xamarin.Kotlin.StdLib => 0x409e66d8 => 311
	i32 1089913930, ; 172: System.Diagnostics.EventLog.dll => 0x40f6c44a => 210
	i32 1098259244, ; 173: System => 0x41761b2c => 161
	i32 1108272742, ; 174: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 343
	i32 1117529484, ; 175: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 337
	i32 1118262833, ; 176: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 333
	i32 1121599056, ; 177: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 273
	i32 1127624469, ; 178: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 195
	i32 1149092582, ; 179: Xamarin.AndroidX.Window => 0x447dc2e6 => 301
	i32 1151313727, ; 180: ExoPlayer.Rtsp => 0x449fa73f => 225
	i32 1157931901, ; 181: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 182
	i32 1168523401, ; 182: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 339
	i32 1170634674, ; 183: System.Web.dll => 0x45c677b2 => 150
	i32 1175144683, ; 184: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 297
	i32 1175944061, ; 185: Camera.MAUI => 0x46177b7d => 170
	i32 1178241025, ; 186: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 282
	i32 1202000627, ; 187: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 182
	i32 1204270330, ; 188: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 240
	i32 1204575371, ; 189: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 187
	i32 1208641965, ; 190: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1219128291, ; 191: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1243150071, ; 192: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 302
	i32 1246548578, ; 193: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 245
	i32 1253011324, ; 194: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 195: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 319
	i32 1263886435, ; 196: Xamarin.Google.Guava.dll => 0x4b556063 => 307
	i32 1264511973, ; 197: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 292
	i32 1264890200, ; 198: Xamarin.KotlinX.Coroutines.Core.dll => 0x4b64b158 => 315
	i32 1267360935, ; 199: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 296
	i32 1273260888, ; 200: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 246
	i32 1275534314, ; 201: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 314
	i32 1278448581, ; 202: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 237
	i32 1292207520, ; 203: SQLitePCLRaw.core.dll => 0x4d0585a0 => 206
	i32 1293217323, ; 204: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 258
	i32 1308624726, ; 205: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 328
	i32 1309188875, ; 206: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1309209905, ; 207: ExoPlayer.DataSource => 0x4e08f531 => 220
	i32 1322716291, ; 208: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 301
	i32 1324164729, ; 209: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 210: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1336711579, ; 211: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 348
	i32 1347751866, ; 212: Plugin.Maui.Audio => 0x50550fba => 204
	i32 1364015309, ; 213: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 214: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 349
	i32 1376866003, ; 215: Xamarin.AndroidX.SavedState => 0x52114ed3 => 288
	i32 1379779777, ; 216: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1395857551, ; 217: Xamarin.AndroidX.Media.dll => 0x5333188f => 279
	i32 1402170036, ; 218: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 219: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 250
	i32 1406299041, ; 220: Xamarin.Google.Guava.FailureAccess => 0x53d26ba1 => 308
	i32 1408764838, ; 221: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 222: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 223: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1430672901, ; 224: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 317
	i32 1434145427, ; 225: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 226: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 305
	i32 1439761251, ; 227: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1452070440, ; 228: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 229: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 230: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 231: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 232: es\Microsoft.Maui.Controls.resources => 0x57152abe => 323
	i32 1461234159, ; 233: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 234: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 235: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 236: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 239
	i32 1470490898, ; 237: Microsoft.Extensions.Primitives => 0x57a5e912 => 197
	i32 1479771757, ; 238: System.Collections.Immutable => 0x5833866d => 9
	i32 1480156764, ; 239: ExoPlayer.DataSource.dll => 0x5839665c => 220
	i32 1480492111, ; 240: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 241: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 242: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 289
	i32 1490351284, ; 243: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 180
	i32 1526286932, ; 244: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 347
	i32 1536373174, ; 245: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 246: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 135
	i32 1543355203, ; 247: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 248: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1565862583, ; 249: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 250: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 138
	i32 1573704789, ; 251: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 252: System.Threading.Overlapped => 0x5e2d7514 => 137
	i32 1582372066, ; 253: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 257
	i32 1592978981, ; 254: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 255: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 306
	i32 1601112923, ; 256: System.Xml.Serialization => 0x5f6f0b5b => 154
	i32 1604827217, ; 257: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 258: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 259: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 277
	i32 1622358360, ; 260: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 261: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 300
	i32 1634654947, ; 262: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 174
	i32 1635184631, ; 263: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 261
	i32 1636350590, ; 264: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 253
	i32 1638652436, ; 265: CommunityToolkit.Maui.MediaElement => 0x61abda14 => 175
	i32 1639515021, ; 266: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 267: System.Text.RegularExpressions => 0x61c036ca => 135
	i32 1641389582, ; 268: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 269: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 270: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 294
	i32 1658251792, ; 271: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 303
	i32 1670060433, ; 272: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 248
	i32 1675553242, ; 273: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 274: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 275: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 276: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1688112883, ; 277: Microsoft.Data.Sqlite => 0x649e8ef3 => 180
	i32 1689493916, ; 278: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 181
	i32 1691477237, ; 279: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 280: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1700397376, ; 281: ExoPlayer.Transformer => 0x655a0140 => 227
	i32 1701541528, ; 282: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 283: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 207
	i32 1720223769, ; 284: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 270
	i32 1726116996, ; 285: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 286: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 287: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 243
	i32 1743415430, ; 288: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 318
	i32 1744735666, ; 289: System.Transactions.Local.dll => 0x67fe8db2 => 146
	i32 1746115085, ; 290: System.IO.Pipelines.dll => 0x68139a0d => 211
	i32 1746316138, ; 291: Mono.Android.Export => 0x6816ab6a => 166
	i32 1750313021, ; 292: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 293: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 294: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765620304, ; 295: ExoPlayer.Core => 0x693d3a50 => 217
	i32 1765942094, ; 296: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 297: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 293
	i32 1770582343, ; 298: Microsoft.Extensions.Logging.dll => 0x6988f147 => 193
	i32 1776026572, ; 299: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 300: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 301: Mono.Android.Runtime.dll => 0x6a216153 => 167
	i32 1782862114, ; 302: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 334
	i32 1788241197, ; 303: Xamarin.AndroidX.Fragment => 0x6a96652d => 263
	i32 1793755602, ; 304: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 326
	i32 1808609942, ; 305: Xamarin.AndroidX.Loader => 0x6bcd3296 => 277
	i32 1813058853, ; 306: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 311
	i32 1813201214, ; 307: Xamarin.Google.Android.Material => 0x6c13413e => 303
	i32 1818569960, ; 308: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 283
	i32 1818787751, ; 309: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 310: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 311: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1828688058, ; 312: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 194
	i32 1847515442, ; 313: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 230
	i32 1853025655, ; 314: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 343
	i32 1858542181, ; 315: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 316: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1873787912, ; 317: Xamarin.AndroidX.DataBinding.ViewBinding.dll => 0x6fafbc08 => 256
	i32 1875935024, ; 318: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 325
	i32 1879696579, ; 319: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 320: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 241
	i32 1886040351, ; 321: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 185
	i32 1888955245, ; 322: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 323: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1893218855, ; 324: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 319
	i32 1898237753, ; 325: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 326: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1910275211, ; 327: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1926145099, ; 328: ExoPlayer.Container.dll => 0x72cea44b => 216
	i32 1939592360, ; 329: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1949863139, ; 330: Castle.Core.dll => 0x74388ce3 => 171
	i32 1953182387, ; 331: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 330
	i32 1956758971, ; 332: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 333: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 290
	i32 1968388702, ; 334: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 188
	i32 1984283898, ; 335: ExoPlayer.Ext.MediaSession.dll => 0x7645c4fa => 224
	i32 1985761444, ; 336: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 232
	i32 2003115576, ; 337: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 322
	i32 2011961780, ; 338: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014489277, ; 339: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 185
	i32 2019465201, ; 340: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 274
	i32 2031763787, ; 341: Xamarin.Android.Glide => 0x791a414b => 229
	i32 2045470958, ; 342: System.Private.Xml => 0x79eb68ee => 87
	i32 2055257422, ; 343: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 269
	i32 2060060697, ; 344: System.Windows.dll => 0x7aca0819 => 151
	i32 2066184531, ; 345: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 321
	i32 2070888862, ; 346: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 347: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 348: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2103459038, ; 349: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 208
	i32 2106312818, ; 350: ExoPlayer.Decoder => 0x7d8bc872 => 221
	i32 2113912252, ; 351: ExoPlayer.UI => 0x7dffbdbc => 228
	i32 2127167465, ; 352: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 353: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 354: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 159
	i32 2146852085, ; 355: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 356: Microsoft.Maui => 0x80bd55ad => 201
	i32 2169148018, ; 357: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 329
	i32 2181898931, ; 358: Microsoft.Extensions.Options.dll => 0x820d22b3 => 196
	i32 2192057212, ; 359: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 194
	i32 2193016926, ; 360: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2197979891, ; 361: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 192
	i32 2201107256, ; 362: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 316
	i32 2201231467, ; 363: System.Net.Http => 0x8334206b => 63
	i32 2202964214, ; 364: ExoPlayer.dll => 0x834e90f6 => 214
	i32 2207618523, ; 365: it\Microsoft.Maui.Controls.resources => 0x839595db => 331
	i32 2217644978, ; 366: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 297
	i32 2222056684, ; 367: System.Threading.Tasks.Parallel => 0x8471e4ec => 140
	i32 2239138732, ; 368: ExoPlayer.SmoothStreaming => 0x85768bac => 226
	i32 2244775296, ; 369: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 278
	i32 2252106437, ; 370: System.Xml.Serialization.dll => 0x863c6ac5 => 154
	i32 2252897993, ; 371: Microsoft.EntityFrameworkCore => 0x86487ec9 => 181
	i32 2256313426, ; 372: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 373: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 374: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 189
	i32 2267999099, ; 375: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 231
	i32 2279755925, ; 376: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 286
	i32 2293034957, ; 377: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 378: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 379: System.Net.Mail => 0x88ffe49e => 65
	i32 2299877983, ; 380: Com.Vanniktech.AndroidImageCropper.Maui => 0x89155a5f => 172
	i32 2303942373, ; 381: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 335
	i32 2305521784, ; 382: System.Private.CoreLib.dll => 0x896b7878 => 169
	i32 2315684594, ; 383: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 235
	i32 2320631194, ; 384: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 140
	i32 2340441535, ; 385: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 386: System.ValueTuple => 0x8bbaa2cd => 148
	i32 2353062107, ; 387: System.Net.Primitives => 0x8c40e0db => 69
	i32 2366048013, ; 388: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 329
	i32 2368005991, ; 389: System.Xml.ReaderWriter.dll => 0x8d24e767 => 153
	i32 2371007202, ; 390: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 188
	i32 2378619854, ; 391: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 392: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2395872292, ; 393: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 330
	i32 2401565422, ; 394: System.Web.HttpUtility => 0x8f24faee => 149
	i32 2403452196, ; 395: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 260
	i32 2421380589, ; 396: System.Threading.Tasks.Dataflow => 0x905355ed => 138
	i32 2423080555, ; 397: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 246
	i32 2427813419, ; 398: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 327
	i32 2435356389, ; 399: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 400: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2437192331, ; 401: CommunityToolkit.Maui.MediaElement.dll => 0x91449a8b => 175
	i32 2452318479, ; 402: Microsoft.EntityFrameworkCore.Proxies => 0x922b690f => 183
	i32 2454642406, ; 403: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 404: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 405: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465273461, ; 406: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 205
	i32 2465532216, ; 407: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 249
	i32 2471841756, ; 408: netstandard.dll => 0x93554fdc => 164
	i32 2475788418, ; 409: Java.Interop.dll => 0x93918882 => 165
	i32 2476233210, ; 410: ExoPlayer => 0x939851fa => 214
	i32 2480646305, ; 411: Microsoft.Maui.Controls => 0x93dba8a1 => 199
	i32 2483903535, ; 412: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 413: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 414: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 415: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 416: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 333
	i32 2505896520, ; 417: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 272
	i32 2509217888, ; 418: System.Diagnostics.EventLog => 0x958fa060 => 210
	i32 2515854816, ; 419: ExoPlayer.Common => 0x95f4e5e0 => 215
	i32 2522472828, ; 420: Xamarin.Android.Glide.dll => 0x9659e17c => 229
	i32 2538310050, ; 421: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2542804739, ; 422: Kotlin.Android.Extensions.Runtime.Maui.dll => 0x97901f03 => 178
	i32 2550873716, ; 423: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 328
	i32 2562349572, ; 424: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 425: System.Text.Encodings.Web => 0x9930ee42 => 212
	i32 2576534780, ; 426: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 332
	i32 2581783588, ; 427: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 273
	i32 2581819634, ; 428: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 296
	i32 2585220780, ; 429: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 430: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 431: System.Threading.ThreadPool => 0x9a5a3337 => 143
	i32 2593496499, ; 432: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 337
	i32 2605712449, ; 433: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 316
	i32 2615233544, ; 434: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 264
	i32 2616218305, ; 435: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 195
	i32 2617129537, ; 436: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 437: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 438: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 253
	i32 2624644809, ; 439: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 259
	i32 2626028643, ; 440: ExoPlayer.Rtsp.dll => 0x9c860463 => 225
	i32 2626831493, ; 441: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 332
	i32 2627185994, ; 442: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 443: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 444: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 268
	i32 2634653062, ; 445: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 184
	i32 2663391936, ; 446: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 231
	i32 2663698177, ; 447: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 448: System.Xml.XDocument.dll => 0x9ecf752a => 155
	i32 2665622720, ; 449: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2671474046, ; 450: Xamarin.KotlinX.Coroutines.Core => 0x9f3b757e => 315
	i32 2676780864, ; 451: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 452: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2693849962, ; 453: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 454: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 294
	i32 2713040075, ; 455: ExoPlayer.Hls => 0xa1b5b4cb => 223
	i32 2715334215, ; 456: System.Threading.Tasks.dll => 0xa1d8b647 => 141
	i32 2717744543, ; 457: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 458: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 459: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 460: Xamarin.AndroidX.Activity => 0xa2e0939b => 233
	i32 2735172069, ; 461: System.Threading.Channels => 0xa30769e5 => 136
	i32 2737747696, ; 462: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 239
	i32 2740698338, ; 463: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 318
	i32 2740948882, ; 464: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 465: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 466: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 338
	i32 2758225723, ; 467: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 200
	i32 2764765095, ; 468: Microsoft.Maui.dll => 0xa4caf7a7 => 201
	i32 2765824710, ; 469: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 470: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 310
	i32 2773678566, ; 471: Xamarin.AndroidX.DataBinding.ViewBinding => 0xa552f9e6 => 256
	i32 2778768386, ; 472: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 299
	i32 2779977773, ; 473: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 287
	i32 2785988530, ; 474: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 344
	i32 2788224221, ; 475: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 264
	i32 2796087574, ; 476: ExoPlayer.Extractor.dll => 0xa6a8e916 => 222
	i32 2801831435, ; 477: Microsoft.Maui.Graphics => 0xa7008e0b => 203
	i32 2803228030, ; 478: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 156
	i32 2810250172, ; 479: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 250
	i32 2819470561, ; 480: System.Xml.dll => 0xa80db4e1 => 160
	i32 2821205001, ; 481: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 482: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 287
	i32 2824502124, ; 483: System.Xml.XmlDocument => 0xa85a7b6c => 158
	i32 2838993487, ; 484: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 275
	i32 2847789619, ; 485: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 184
	i32 2849599387, ; 486: System.Threading.Overlapped.dll => 0xa9d96f9b => 137
	i32 2853208004, ; 487: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 299
	i32 2855708567, ; 488: Xamarin.AndroidX.Transition => 0xaa36a797 => 295
	i32 2861098320, ; 489: Mono.Android.Export.dll => 0xaa88e550 => 166
	i32 2861189240, ; 490: Microsoft.Maui.Essentials => 0xaa8a4878 => 202
	i32 2868488919, ; 491: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 174
	i32 2870099610, ; 492: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 234
	i32 2875164099, ; 493: Jsr305Binding.dll => 0xab5f85c3 => 304
	i32 2875220617, ; 494: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 495: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 262
	i32 2887636118, ; 496: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 497: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 498: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 499: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 500: mscorlib.dll => 0xad2a79b6 => 163
	i32 2909740682, ; 501: System.Private.CoreLib => 0xad6f1e8a => 169
	i32 2916838712, ; 502: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 300
	i32 2919462931, ; 503: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 504: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 236
	i32 2936416060, ; 505: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 506: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 507: System.Xml.XPath.XDocument => 0xaf624531 => 156
	i32 2959614098, ; 508: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2960379616, ; 509: Xamarin.Google.Guava => 0xb073cee0 => 307
	i32 2968338931, ; 510: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2972252294, ; 511: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 512: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 258
	i32 2987532451, ; 513: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 290
	i32 2996846495, ; 514: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 271
	i32 3016983068, ; 515: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 292
	i32 3023353419, ; 516: WindowsBase.dll => 0xb434b64b => 162
	i32 3024354802, ; 517: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 266
	i32 3027462113, ; 518: ExoPlayer.Common.dll => 0xb47367e1 => 215
	i32 3038032645, ; 519: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 351
	i32 3053864966, ; 520: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 324
	i32 3056245963, ; 521: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 289
	i32 3057625584, ; 522: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 280
	i32 3059408633, ; 523: Mono.Android.Runtime => 0xb65adef9 => 167
	i32 3059793426, ; 524: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 525: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 186
	i32 3075834255, ; 526: System.Threading.Tasks => 0xb755818f => 141
	i32 3090735792, ; 527: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 528: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 529: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 530: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 531: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 532: System.Threading.Tasks.Extensions => 0xba4127cb => 139
	i32 3132293585, ; 533: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3144327419, ; 534: ExoPlayer.Hls.dll => 0xbb6aa0fb => 223
	i32 3147165239, ; 535: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 536: GoogleGson.dll => 0xbba64c02 => 176
	i32 3159123045, ; 537: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 538: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 539: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 281
	i32 3190271366, ; 540: ExoPlayer.Decoder.dll => 0xbe27ad86 => 221
	i32 3192346100, ; 541: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 542: System.Web => 0xbe592c0c => 150
	i32 3195844289, ; 543: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 186
	i32 3204380047, ; 544: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 545: System.Xml.XmlDocument.dll => 0xbf506931 => 158
	i32 3211777861, ; 546: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 257
	i32 3220365878, ; 547: System.Threading => 0xbff2e236 => 145
	i32 3226221578, ; 548: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3251039220, ; 549: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 550: Xamarin.AndroidX.CardView => 0xc235e84d => 243
	i32 3265493905, ; 551: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 552: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 139
	i32 3277815716, ; 553: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3279906254, ; 554: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 555: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 556: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 557: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 558: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 559: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 324
	i32 3315872140, ; 560: Com.Vanniktech.AndroidImageCropper.Maui.dll => 0xc5a4318c => 172
	i32 3316684772, ; 561: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 562: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 254
	i32 3317144872, ; 563: System.Data => 0xc5b79d28 => 24
	i32 3329734229, ; 564: ExoPlayer.Database => 0xc677b655 => 219
	i32 3340431453, ; 565: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 241
	i32 3345895724, ; 566: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 285
	i32 3346324047, ; 567: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 282
	i32 3357674450, ; 568: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 341
	i32 3358260929, ; 569: System.Text.Json => 0xc82afec1 => 213
	i32 3360279109, ; 570: SQLitePCLRaw.core => 0xc849ca45 => 206
	i32 3362336904, ; 571: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 234
	i32 3362522851, ; 572: Xamarin.AndroidX.Core => 0xc86c06e3 => 251
	i32 3366347497, ; 573: Java.Interop => 0xc8a662e9 => 165
	i32 3374999561, ; 574: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 286
	i32 3381016424, ; 575: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 320
	i32 3395150330, ; 576: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3396979385, ; 577: ExoPlayer.Transformer.dll => 0xca79cab9 => 227
	i32 3403906625, ; 578: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 579: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 255
	i32 3428513518, ; 580: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 190
	i32 3429136800, ; 581: System.Xml => 0xcc6479a0 => 160
	i32 3430777524, ; 582: netstandard => 0xcc7d82b4 => 164
	i32 3441283291, ; 583: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 259
	i32 3445260447, ; 584: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 585: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 198
	i32 3458724246, ; 586: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 339
	i32 3471940407, ; 587: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 588: Mono.Android => 0xcf3163e6 => 168
	i32 3484440000, ; 589: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 340
	i32 3485117614, ; 590: System.Text.Json.dll => 0xcfbaacae => 213
	i32 3486566296, ; 591: System.Transactions => 0xcfd0c798 => 147
	i32 3493954962, ; 592: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 247
	i32 3509114376, ; 593: System.Xml.Linq => 0xd128d608 => 152
	i32 3515174580, ; 594: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 595: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 596: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3560100363, ; 597: System.Threading.Timer => 0xd432d20b => 144
	i32 3570554715, ; 598: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 599: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 348
	i32 3592228221, ; 600: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 350
	i32 3597029428, ; 601: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 232
	i32 3598340787, ; 602: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 603: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 604: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 605: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 284
	i32 3633644679, ; 606: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 236
	i32 3638274909, ; 607: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 608: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 269
	i32 3643446276, ; 609: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 345
	i32 3643854240, ; 610: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 281
	i32 3645089577, ; 611: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 612: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 189
	i32 3660523487, ; 613: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3660726404, ; 614: Plugin.Maui.Audio.dll => 0xda324084 => 204
	i32 3672681054, ; 615: Mono.Android.dll => 0xdae8aa5e => 168
	i32 3682565725, ; 616: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 242
	i32 3684561358, ; 617: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 247
	i32 3700866549, ; 618: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 619: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 252
	i32 3716563718, ; 620: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 621: Xamarin.AndroidX.Annotation => 0xdda814c6 => 235
	i32 3721776493, ; 622: Mobile => 0xddd5cd6d => 0
	i32 3724971120, ; 623: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 280
	i32 3732100267, ; 624: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 625: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 626: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 209
	i32 3751444290, ; 627: System.Xml.XPath => 0xdf9a7f42 => 157
	i32 3751619990, ; 628: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 320
	i32 3754567612, ; 629: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 208
	i32 3765952165, ; 630: Mobile.dll => 0xe077dea5 => 0
	i32 3786282454, ; 631: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 244
	i32 3792276235, ; 632: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 633: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 198
	i32 3802395368, ; 634: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 635: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 636: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3822602673, ; 637: Xamarin.AndroidX.Media => 0xe3d849b1 => 279
	i32 3823082795, ; 638: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 639: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 640: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 191
	i32 3844307129, ; 641: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 642: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 643: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 644: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 645: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 646: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 647: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 295
	i32 3888767677, ; 648: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 285
	i32 3896106733, ; 649: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 650: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 251
	i32 3901907137, ; 651: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3910130544, ; 652: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 245
	i32 3920221145, ; 653: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 336
	i32 3920810846, ; 654: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 655: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 298
	i32 3928044579, ; 656: System.Xml.ReaderWriter => 0xea213423 => 153
	i32 3930554604, ; 657: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 658: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 283
	i32 3945713374, ; 659: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 660: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 661: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 238
	i32 3959773229, ; 662: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 271
	i32 4003436829, ; 663: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 664: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 237
	i32 4023392905, ; 665: System.IO.Pipelines => 0xefd01a89 => 211
	i32 4025784931, ; 666: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 667: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 200
	i32 4054681211, ; 668: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4068434129, ; 669: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 670: System.Threading.dll => 0xf2ce3c98 => 145
	i32 4091086043, ; 671: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 322
	i32 4094352644, ; 672: Microsoft.Maui.Essentials.dll => 0xf40add04 => 202
	i32 4099507663, ; 673: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 674: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 675: Xamarin.AndroidX.Emoji2 => 0xf479582c => 260
	i32 4101842092, ; 676: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 187
	i32 4103439459, ; 677: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 346
	i32 4126470640, ; 678: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 190
	i32 4127667938, ; 679: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 680: System.AppContext => 0xf6318da0 => 6
	i32 4142654081, ; 681: Camera.MAUI.dll => 0xf6ebe281 => 170
	i32 4147896353, ; 682: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150914736, ; 683: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 346
	i32 4151237749, ; 684: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 685: System.Xml.XmlSerializer => 0xf7e95c85 => 159
	i32 4161255271, ; 686: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 687: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4173364138, ; 688: ExoPlayer.SmoothStreaming.dll => 0xf8c07baa => 226
	i32 4181436372, ; 689: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 690: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 276
	i32 4185676441, ; 691: System.Security => 0xf97c5a99 => 129
	i32 4190597220, ; 692: ExoPlayer.Core.dll => 0xf9c77064 => 217
	i32 4196529839, ; 693: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 694: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 209
	i32 4241083455, ; 695: Castle.Core => 0xfcc9cc3f => 171
	i32 4249188766, ; 696: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 335
	i32 4256097574, ; 697: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 252
	i32 4258378803, ; 698: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 275
	i32 4260525087, ; 699: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 700: Microsoft.Maui.Controls.dll => 0xfea12dee => 199
	i32 4274976490, ; 701: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4292120959, ; 702: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 276
	i32 4294763496 ; 703: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 262
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [704 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 192, ; 3
	i32 272, ; 4
	i32 309, ; 5
	i32 47, ; 6
	i32 317, ; 7
	i32 79, ; 8
	i32 326, ; 9
	i32 142, ; 10
	i32 29, ; 11
	i32 350, ; 12
	i32 123, ; 13
	i32 203, ; 14
	i32 101, ; 15
	i32 334, ; 16
	i32 291, ; 17
	i32 106, ; 18
	i32 291, ; 19
	i32 136, ; 20
	i32 312, ; 21
	i32 349, ; 22
	i32 342, ; 23
	i32 76, ; 24
	i32 123, ; 25
	i32 13, ; 26
	i32 244, ; 27
	i32 131, ; 28
	i32 293, ; 29
	i32 148, ; 30
	i32 18, ; 31
	i32 242, ; 32
	i32 26, ; 33
	i32 266, ; 34
	i32 1, ; 35
	i32 58, ; 36
	i32 41, ; 37
	i32 90, ; 38
	i32 248, ; 39
	i32 308, ; 40
	i32 144, ; 41
	i32 268, ; 42
	i32 265, ; 43
	i32 53, ; 44
	i32 218, ; 45
	i32 68, ; 46
	i32 347, ; 47
	i32 233, ; 48
	i32 82, ; 49
	i32 325, ; 50
	i32 267, ; 51
	i32 207, ; 52
	i32 130, ; 53
	i32 179, ; 54
	i32 54, ; 55
	i32 146, ; 56
	i32 73, ; 57
	i32 142, ; 58
	i32 61, ; 59
	i32 143, ; 60
	i32 351, ; 61
	i32 162, ; 62
	i32 345, ; 63
	i32 177, ; 64
	i32 178, ; 65
	i32 249, ; 66
	i32 12, ; 67
	i32 263, ; 68
	i32 124, ; 69
	i32 219, ; 70
	i32 149, ; 71
	i32 112, ; 72
	i32 163, ; 73
	i32 161, ; 74
	i32 265, ; 75
	i32 278, ; 76
	i32 323, ; 77
	i32 83, ; 78
	i32 197, ; 79
	i32 147, ; 80
	i32 312, ; 81
	i32 59, ; 82
	i32 344, ; 83
	i32 193, ; 84
	i32 50, ; 85
	i32 102, ; 86
	i32 113, ; 87
	i32 39, ; 88
	i32 304, ; 89
	i32 302, ; 90
	i32 119, ; 91
	i32 173, ; 92
	i32 51, ; 93
	i32 43, ; 94
	i32 118, ; 95
	i32 179, ; 96
	i32 177, ; 97
	i32 216, ; 98
	i32 254, ; 99
	i32 336, ; 100
	i32 261, ; 101
	i32 80, ; 102
	i32 212, ; 103
	i32 298, ; 104
	i32 240, ; 105
	i32 8, ; 106
	i32 72, ; 107
	i32 152, ; 108
	i32 314, ; 109
	i32 151, ; 110
	i32 91, ; 111
	i32 310, ; 112
	i32 44, ; 113
	i32 313, ; 114
	i32 108, ; 115
	i32 128, ; 116
	i32 205, ; 117
	i32 25, ; 118
	i32 230, ; 119
	i32 71, ; 120
	i32 54, ; 121
	i32 45, ; 122
	i32 342, ; 123
	i32 196, ; 124
	i32 255, ; 125
	i32 22, ; 126
	i32 270, ; 127
	i32 218, ; 128
	i32 85, ; 129
	i32 42, ; 130
	i32 157, ; 131
	i32 70, ; 132
	i32 284, ; 133
	i32 327, ; 134
	i32 3, ; 135
	i32 41, ; 136
	i32 62, ; 137
	i32 341, ; 138
	i32 16, ; 139
	i32 52, ; 140
	i32 224, ; 141
	i32 338, ; 142
	i32 309, ; 143
	i32 222, ; 144
	i32 104, ; 145
	i32 313, ; 146
	i32 183, ; 147
	i32 331, ; 148
	i32 305, ; 149
	i32 267, ; 150
	i32 33, ; 151
	i32 155, ; 152
	i32 84, ; 153
	i32 31, ; 154
	i32 340, ; 155
	i32 12, ; 156
	i32 50, ; 157
	i32 55, ; 158
	i32 288, ; 159
	i32 35, ; 160
	i32 228, ; 161
	i32 191, ; 162
	i32 306, ; 163
	i32 238, ; 164
	i32 34, ; 165
	i32 321, ; 166
	i32 57, ; 167
	i32 274, ; 168
	i32 176, ; 169
	i32 17, ; 170
	i32 311, ; 171
	i32 210, ; 172
	i32 161, ; 173
	i32 343, ; 174
	i32 337, ; 175
	i32 333, ; 176
	i32 273, ; 177
	i32 195, ; 178
	i32 301, ; 179
	i32 225, ; 180
	i32 182, ; 181
	i32 339, ; 182
	i32 150, ; 183
	i32 297, ; 184
	i32 170, ; 185
	i32 282, ; 186
	i32 182, ; 187
	i32 240, ; 188
	i32 187, ; 189
	i32 28, ; 190
	i32 51, ; 191
	i32 302, ; 192
	i32 245, ; 193
	i32 5, ; 194
	i32 319, ; 195
	i32 307, ; 196
	i32 292, ; 197
	i32 315, ; 198
	i32 296, ; 199
	i32 246, ; 200
	i32 314, ; 201
	i32 237, ; 202
	i32 206, ; 203
	i32 258, ; 204
	i32 328, ; 205
	i32 84, ; 206
	i32 220, ; 207
	i32 301, ; 208
	i32 60, ; 209
	i32 111, ; 210
	i32 348, ; 211
	i32 204, ; 212
	i32 56, ; 213
	i32 349, ; 214
	i32 288, ; 215
	i32 98, ; 216
	i32 279, ; 217
	i32 19, ; 218
	i32 250, ; 219
	i32 308, ; 220
	i32 110, ; 221
	i32 100, ; 222
	i32 101, ; 223
	i32 317, ; 224
	i32 103, ; 225
	i32 305, ; 226
	i32 70, ; 227
	i32 37, ; 228
	i32 31, ; 229
	i32 102, ; 230
	i32 72, ; 231
	i32 323, ; 232
	i32 9, ; 233
	i32 122, ; 234
	i32 45, ; 235
	i32 239, ; 236
	i32 197, ; 237
	i32 9, ; 238
	i32 220, ; 239
	i32 42, ; 240
	i32 4, ; 241
	i32 289, ; 242
	i32 180, ; 243
	i32 347, ; 244
	i32 30, ; 245
	i32 135, ; 246
	i32 91, ; 247
	i32 92, ; 248
	i32 48, ; 249
	i32 138, ; 250
	i32 111, ; 251
	i32 137, ; 252
	i32 257, ; 253
	i32 114, ; 254
	i32 306, ; 255
	i32 154, ; 256
	i32 75, ; 257
	i32 78, ; 258
	i32 277, ; 259
	i32 36, ; 260
	i32 300, ; 261
	i32 174, ; 262
	i32 261, ; 263
	i32 253, ; 264
	i32 175, ; 265
	i32 63, ; 266
	i32 135, ; 267
	i32 15, ; 268
	i32 115, ; 269
	i32 294, ; 270
	i32 303, ; 271
	i32 248, ; 272
	i32 47, ; 273
	i32 69, ; 274
	i32 79, ; 275
	i32 125, ; 276
	i32 180, ; 277
	i32 181, ; 278
	i32 93, ; 279
	i32 120, ; 280
	i32 227, ; 281
	i32 26, ; 282
	i32 207, ; 283
	i32 270, ; 284
	i32 96, ; 285
	i32 27, ; 286
	i32 243, ; 287
	i32 318, ; 288
	i32 146, ; 289
	i32 211, ; 290
	i32 166, ; 291
	i32 4, ; 292
	i32 97, ; 293
	i32 32, ; 294
	i32 217, ; 295
	i32 92, ; 296
	i32 293, ; 297
	i32 193, ; 298
	i32 21, ; 299
	i32 40, ; 300
	i32 167, ; 301
	i32 334, ; 302
	i32 263, ; 303
	i32 326, ; 304
	i32 277, ; 305
	i32 311, ; 306
	i32 303, ; 307
	i32 283, ; 308
	i32 2, ; 309
	i32 133, ; 310
	i32 110, ; 311
	i32 194, ; 312
	i32 230, ; 313
	i32 343, ; 314
	i32 57, ; 315
	i32 94, ; 316
	i32 256, ; 317
	i32 325, ; 318
	i32 38, ; 319
	i32 241, ; 320
	i32 185, ; 321
	i32 25, ; 322
	i32 93, ; 323
	i32 319, ; 324
	i32 88, ; 325
	i32 98, ; 326
	i32 10, ; 327
	i32 216, ; 328
	i32 86, ; 329
	i32 171, ; 330
	i32 330, ; 331
	i32 99, ; 332
	i32 290, ; 333
	i32 188, ; 334
	i32 224, ; 335
	i32 232, ; 336
	i32 322, ; 337
	i32 7, ; 338
	i32 185, ; 339
	i32 274, ; 340
	i32 229, ; 341
	i32 87, ; 342
	i32 269, ; 343
	i32 151, ; 344
	i32 321, ; 345
	i32 32, ; 346
	i32 115, ; 347
	i32 81, ; 348
	i32 208, ; 349
	i32 221, ; 350
	i32 228, ; 351
	i32 20, ; 352
	i32 11, ; 353
	i32 159, ; 354
	i32 3, ; 355
	i32 201, ; 356
	i32 329, ; 357
	i32 196, ; 358
	i32 194, ; 359
	i32 83, ; 360
	i32 192, ; 361
	i32 316, ; 362
	i32 63, ; 363
	i32 214, ; 364
	i32 331, ; 365
	i32 297, ; 366
	i32 140, ; 367
	i32 226, ; 368
	i32 278, ; 369
	i32 154, ; 370
	i32 181, ; 371
	i32 40, ; 372
	i32 116, ; 373
	i32 189, ; 374
	i32 231, ; 375
	i32 286, ; 376
	i32 130, ; 377
	i32 74, ; 378
	i32 65, ; 379
	i32 172, ; 380
	i32 335, ; 381
	i32 169, ; 382
	i32 235, ; 383
	i32 140, ; 384
	i32 105, ; 385
	i32 148, ; 386
	i32 69, ; 387
	i32 329, ; 388
	i32 153, ; 389
	i32 188, ; 390
	i32 120, ; 391
	i32 126, ; 392
	i32 330, ; 393
	i32 149, ; 394
	i32 260, ; 395
	i32 138, ; 396
	i32 246, ; 397
	i32 327, ; 398
	i32 20, ; 399
	i32 14, ; 400
	i32 175, ; 401
	i32 183, ; 402
	i32 134, ; 403
	i32 74, ; 404
	i32 58, ; 405
	i32 205, ; 406
	i32 249, ; 407
	i32 164, ; 408
	i32 165, ; 409
	i32 214, ; 410
	i32 199, ; 411
	i32 15, ; 412
	i32 73, ; 413
	i32 6, ; 414
	i32 23, ; 415
	i32 333, ; 416
	i32 272, ; 417
	i32 210, ; 418
	i32 215, ; 419
	i32 229, ; 420
	i32 90, ; 421
	i32 178, ; 422
	i32 328, ; 423
	i32 1, ; 424
	i32 212, ; 425
	i32 332, ; 426
	i32 273, ; 427
	i32 296, ; 428
	i32 133, ; 429
	i32 68, ; 430
	i32 143, ; 431
	i32 337, ; 432
	i32 316, ; 433
	i32 264, ; 434
	i32 195, ; 435
	i32 87, ; 436
	i32 95, ; 437
	i32 253, ; 438
	i32 259, ; 439
	i32 225, ; 440
	i32 332, ; 441
	i32 30, ; 442
	i32 44, ; 443
	i32 268, ; 444
	i32 184, ; 445
	i32 231, ; 446
	i32 108, ; 447
	i32 155, ; 448
	i32 34, ; 449
	i32 315, ; 450
	i32 22, ; 451
	i32 113, ; 452
	i32 56, ; 453
	i32 294, ; 454
	i32 223, ; 455
	i32 141, ; 456
	i32 117, ; 457
	i32 119, ; 458
	i32 109, ; 459
	i32 233, ; 460
	i32 136, ; 461
	i32 239, ; 462
	i32 318, ; 463
	i32 53, ; 464
	i32 104, ; 465
	i32 338, ; 466
	i32 200, ; 467
	i32 201, ; 468
	i32 132, ; 469
	i32 310, ; 470
	i32 256, ; 471
	i32 299, ; 472
	i32 287, ; 473
	i32 344, ; 474
	i32 264, ; 475
	i32 222, ; 476
	i32 203, ; 477
	i32 156, ; 478
	i32 250, ; 479
	i32 160, ; 480
	i32 131, ; 481
	i32 287, ; 482
	i32 158, ; 483
	i32 275, ; 484
	i32 184, ; 485
	i32 137, ; 486
	i32 299, ; 487
	i32 295, ; 488
	i32 166, ; 489
	i32 202, ; 490
	i32 174, ; 491
	i32 234, ; 492
	i32 304, ; 493
	i32 39, ; 494
	i32 262, ; 495
	i32 80, ; 496
	i32 55, ; 497
	i32 36, ; 498
	i32 96, ; 499
	i32 163, ; 500
	i32 169, ; 501
	i32 300, ; 502
	i32 81, ; 503
	i32 236, ; 504
	i32 97, ; 505
	i32 29, ; 506
	i32 156, ; 507
	i32 18, ; 508
	i32 307, ; 509
	i32 126, ; 510
	i32 118, ; 511
	i32 258, ; 512
	i32 290, ; 513
	i32 271, ; 514
	i32 292, ; 515
	i32 162, ; 516
	i32 266, ; 517
	i32 215, ; 518
	i32 351, ; 519
	i32 324, ; 520
	i32 289, ; 521
	i32 280, ; 522
	i32 167, ; 523
	i32 16, ; 524
	i32 186, ; 525
	i32 141, ; 526
	i32 124, ; 527
	i32 117, ; 528
	i32 37, ; 529
	i32 114, ; 530
	i32 46, ; 531
	i32 139, ; 532
	i32 116, ; 533
	i32 223, ; 534
	i32 33, ; 535
	i32 176, ; 536
	i32 94, ; 537
	i32 52, ; 538
	i32 281, ; 539
	i32 221, ; 540
	i32 128, ; 541
	i32 150, ; 542
	i32 186, ; 543
	i32 24, ; 544
	i32 158, ; 545
	i32 257, ; 546
	i32 145, ; 547
	i32 103, ; 548
	i32 88, ; 549
	i32 243, ; 550
	i32 59, ; 551
	i32 139, ; 552
	i32 99, ; 553
	i32 5, ; 554
	i32 13, ; 555
	i32 121, ; 556
	i32 134, ; 557
	i32 27, ; 558
	i32 324, ; 559
	i32 172, ; 560
	i32 71, ; 561
	i32 254, ; 562
	i32 24, ; 563
	i32 219, ; 564
	i32 241, ; 565
	i32 285, ; 566
	i32 282, ; 567
	i32 341, ; 568
	i32 213, ; 569
	i32 206, ; 570
	i32 234, ; 571
	i32 251, ; 572
	i32 165, ; 573
	i32 286, ; 574
	i32 320, ; 575
	i32 100, ; 576
	i32 227, ; 577
	i32 122, ; 578
	i32 255, ; 579
	i32 190, ; 580
	i32 160, ; 581
	i32 164, ; 582
	i32 259, ; 583
	i32 38, ; 584
	i32 198, ; 585
	i32 339, ; 586
	i32 17, ; 587
	i32 168, ; 588
	i32 340, ; 589
	i32 213, ; 590
	i32 147, ; 591
	i32 247, ; 592
	i32 152, ; 593
	i32 129, ; 594
	i32 19, ; 595
	i32 64, ; 596
	i32 144, ; 597
	i32 46, ; 598
	i32 348, ; 599
	i32 350, ; 600
	i32 232, ; 601
	i32 78, ; 602
	i32 60, ; 603
	i32 105, ; 604
	i32 284, ; 605
	i32 236, ; 606
	i32 48, ; 607
	i32 269, ; 608
	i32 345, ; 609
	i32 281, ; 610
	i32 14, ; 611
	i32 189, ; 612
	i32 67, ; 613
	i32 204, ; 614
	i32 168, ; 615
	i32 242, ; 616
	i32 247, ; 617
	i32 77, ; 618
	i32 252, ; 619
	i32 107, ; 620
	i32 235, ; 621
	i32 0, ; 622
	i32 280, ; 623
	i32 66, ; 624
	i32 62, ; 625
	i32 209, ; 626
	i32 157, ; 627
	i32 320, ; 628
	i32 208, ; 629
	i32 0, ; 630
	i32 244, ; 631
	i32 10, ; 632
	i32 198, ; 633
	i32 11, ; 634
	i32 173, ; 635
	i32 77, ; 636
	i32 279, ; 637
	i32 125, ; 638
	i32 82, ; 639
	i32 191, ; 640
	i32 65, ; 641
	i32 106, ; 642
	i32 64, ; 643
	i32 127, ; 644
	i32 121, ; 645
	i32 76, ; 646
	i32 295, ; 647
	i32 285, ; 648
	i32 8, ; 649
	i32 251, ; 650
	i32 2, ; 651
	i32 245, ; 652
	i32 336, ; 653
	i32 43, ; 654
	i32 298, ; 655
	i32 153, ; 656
	i32 127, ; 657
	i32 283, ; 658
	i32 23, ; 659
	i32 132, ; 660
	i32 238, ; 661
	i32 271, ; 662
	i32 28, ; 663
	i32 237, ; 664
	i32 211, ; 665
	i32 61, ; 666
	i32 200, ; 667
	i32 89, ; 668
	i32 86, ; 669
	i32 145, ; 670
	i32 322, ; 671
	i32 202, ; 672
	i32 35, ; 673
	i32 85, ; 674
	i32 260, ; 675
	i32 187, ; 676
	i32 346, ; 677
	i32 190, ; 678
	i32 49, ; 679
	i32 6, ; 680
	i32 170, ; 681
	i32 89, ; 682
	i32 346, ; 683
	i32 21, ; 684
	i32 159, ; 685
	i32 95, ; 686
	i32 49, ; 687
	i32 226, ; 688
	i32 112, ; 689
	i32 276, ; 690
	i32 129, ; 691
	i32 217, ; 692
	i32 75, ; 693
	i32 209, ; 694
	i32 171, ; 695
	i32 335, ; 696
	i32 252, ; 697
	i32 275, ; 698
	i32 7, ; 699
	i32 199, ; 700
	i32 109, ; 701
	i32 276, ; 702
	i32 262 ; 703
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}

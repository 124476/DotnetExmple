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

@assembly_image_cache = dso_local local_unnamed_addr global [355 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [710 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 193
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 275
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 312
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 38948123, ; 7: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 320
	i32 39109920, ; 8: Newtonsoft.Json.dll => 0x254c520 => 205
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42244203, ; 10: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 329
	i32 42639949, ; 11: System.Threading.Thread => 0x28aa24d => 142
	i32 66541672, ; 12: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 13: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 353
	i32 68219467, ; 14: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 15: Microsoft.Maui.Graphics.dll => 0x44bb714 => 204
	i32 82292897, ; 16: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 83839681, ; 17: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 337
	i32 101534019, ; 18: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 294
	i32 117431740, ; 19: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 20: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 294
	i32 122350210, ; 21: System.Threading.Channels.dll => 0x74aea82 => 136
	i32 134690465, ; 22: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 315
	i32 136584136, ; 23: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 352
	i32 140062828, ; 24: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 345
	i32 142721839, ; 25: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149972175, ; 26: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 27: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 28: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 247
	i32 176265551, ; 29: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 296
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 148
	i32 205061960, ; 32: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 33: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 245
	i32 220171995, ; 34: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 269
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 39: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 251
	i32 266337479, ; 41: Xamarin.Google.Guava.FailureAccess.dll => 0xfdffcc7 => 311
	i32 276479776, ; 42: System.Threading.Timer.dll => 0x107abf20 => 144
	i32 278686392, ; 43: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 271
	i32 280482487, ; 44: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 268
	i32 291076382, ; 45: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 293579439, ; 46: ExoPlayer.Dash.dll => 0x117faaaf => 221
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 48: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 350
	i32 318968648, ; 49: Xamarin.AndroidX.Activity.dll => 0x13031348 => 236
	i32 321597661, ; 50: System.Numerics => 0x132b30dd => 82
	i32 321963286, ; 51: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 328
	i32 342366114, ; 52: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 270
	i32 347068432, ; 53: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 210
	i32 360082299, ; 54: System.ServiceModel.Web => 0x15766b7b => 130
	i32 364027000, ; 55: Kotlin.Parcelize.Runtime.Maui.dll => 0x15b29c78 => 180
	i32 367780167, ; 56: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 57: System.Transactions.Local => 0x1658bf94 => 146
	i32 375677976, ; 58: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 59: System.Threading.Thread.dll => 0x16a510e1 => 142
	i32 385762202, ; 60: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 61: System.Threading.ThreadPool.dll => 0x1766c1f7 => 143
	i32 395744057, ; 62: _Microsoft.Android.Resource.Designer => 0x17969339 => 354
	i32 403441872, ; 63: WindowsBase => 0x180c08d0 => 162
	i32 409257351, ; 64: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 348
	i32 416634953, ; 65: ImageCropper.Maui.dll => 0x18d55849 => 178
	i32 439227014, ; 66: Kotlin.Android.Extensions.Runtime.Maui => 0x1a2e1286 => 179
	i32 441335492, ; 67: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 252
	i32 442565967, ; 68: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 69: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 266
	i32 451504562, ; 70: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 452127346, ; 71: ExoPlayer.Database.dll => 0x1af2ea72 => 222
	i32 456227837, ; 72: System.Web.HttpUtility.dll => 0x1b317bfd => 149
	i32 459347974, ; 73: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465846621, ; 74: mscorlib => 0x1bc4415d => 163
	i32 469710990, ; 75: System.dll => 0x1bff388e => 161
	i32 476646585, ; 76: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 268
	i32 486930444, ; 77: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 281
	i32 489220957, ; 78: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 326
	i32 498788369, ; 79: System.ObjectModel => 0x1dbae811 => 83
	i32 513247710, ; 80: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 198
	i32 526420162, ; 81: System.Transactions.dll => 0x1f6088c2 => 147
	i32 527452488, ; 82: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 315
	i32 530272170, ; 83: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 538707440, ; 84: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 347
	i32 539058512, ; 85: Microsoft.Extensions.Logging => 0x20216150 => 194
	i32 540030774, ; 86: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 87: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 88: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 89: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 90: Jsr305Binding => 0x213954e7 => 307
	i32 569601784, ; 91: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 305
	i32 577335427, ; 92: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 597488923, ; 93: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 601371474, ; 94: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 95: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 96: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 615902610, ; 97: Kotlin.Parcelize.Runtime.Maui => 0x24b5ed92 => 180
	i32 620065123, ; 98: ImageCropper.Maui => 0x24f57163 => 178
	i32 626887733, ; 99: ExoPlayer.Container => 0x255d8c35 => 219
	i32 627609679, ; 100: Xamarin.AndroidX.CustomView => 0x2568904f => 257
	i32 627931235, ; 101: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 339
	i32 639843206, ; 102: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 264
	i32 643868501, ; 103: System.Net => 0x2660a755 => 80
	i32 662205335, ; 104: System.Text.Encodings.Web.dll => 0x27787397 => 215
	i32 663517072, ; 105: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 301
	i32 666292255, ; 106: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 243
	i32 672442732, ; 107: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 108: System.Net.Security => 0x28bdabca => 72
	i32 690569205, ; 109: System.Xml.Linq.dll => 0x29293ff5 => 152
	i32 691348768, ; 110: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 317
	i32 693804605, ; 111: System.Windows => 0x295a9e3d => 151
	i32 699345723, ; 112: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 113: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 313
	i32 700358131, ; 114: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 720511267, ; 115: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 316
	i32 722857257, ; 116: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 735137430, ; 117: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 748832960, ; 118: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 208
	i32 752232764, ; 119: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 120: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 233
	i32 759454413, ; 121: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 122: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 123: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 124: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 345
	i32 789151979, ; 125: Microsoft.Extensions.Options => 0x2f0980eb => 197
	i32 790371945, ; 126: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 258
	i32 804715423, ; 127: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 128: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 273
	i32 812693636, ; 129: ExoPlayer.Dash => 0x3070b884 => 221
	i32 823281589, ; 130: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 131: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 132: System.Xml.XPath.dll => 0x31a103c6 => 157
	i32 834051424, ; 133: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 134: Xamarin.AndroidX.Print => 0x3246f6cd => 287
	i32 869139383, ; 135: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 330
	i32 873119928, ; 136: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 137: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 138: System.Net.Http.Json => 0x3463c971 => 62
	i32 880668424, ; 139: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 344
	i32 904024072, ; 140: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 141: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 915551335, ; 142: ExoPlayer.Ext.MediaSession => 0x36923467 => 227
	i32 918734561, ; 143: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 341
	i32 928116545, ; 144: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 312
	i32 939704684, ; 145: ExoPlayer.Extractor => 0x3802c16c => 225
	i32 952186615, ; 146: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 955402788, ; 147: Newtonsoft.Json => 0x38f24a24 => 205
	i32 956575887, ; 148: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 316
	i32 956853935, ; 149: Microsoft.EntityFrameworkCore.Proxies.dll => 0x39086eaf => 184
	i32 961460050, ; 150: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 334
	i32 966729478, ; 151: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 308
	i32 967690846, ; 152: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 270
	i32 975236339, ; 153: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 154: System.Xml.XDocument => 0x3a2aaa1d => 155
	i32 986514023, ; 155: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 156: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 990727110, ; 157: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 343
	i32 992768348, ; 158: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 159: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 1001831731, ; 160: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 161: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 291
	i32 1019214401, ; 162: System.Drawing => 0x3cbffa41 => 35
	i32 1028013380, ; 163: ExoPlayer.UI.dll => 0x3d463d44 => 231
	i32 1028951442, ; 164: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 192
	i32 1031528504, ; 165: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 309
	i32 1035644815, ; 166: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 241
	i32 1036536393, ; 167: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1043950537, ; 168: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 324
	i32 1044663988, ; 169: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1052210849, ; 170: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 277
	i32 1067306892, ; 171: GoogleGson => 0x3f9dcf8c => 177
	i32 1082857460, ; 172: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 173: Xamarin.Kotlin.StdLib => 0x409e66d8 => 314
	i32 1089913930, ; 174: System.Diagnostics.EventLog.dll => 0x40f6c44a => 213
	i32 1098259244, ; 175: System => 0x41761b2c => 161
	i32 1108272742, ; 176: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 346
	i32 1117529484, ; 177: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 340
	i32 1118262833, ; 178: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 336
	i32 1121599056, ; 179: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 276
	i32 1127624469, ; 180: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 196
	i32 1149092582, ; 181: Xamarin.AndroidX.Window => 0x447dc2e6 => 304
	i32 1151313727, ; 182: ExoPlayer.Rtsp => 0x449fa73f => 228
	i32 1157931901, ; 183: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 183
	i32 1168523401, ; 184: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 342
	i32 1170634674, ; 185: System.Web.dll => 0x45c677b2 => 150
	i32 1175144683, ; 186: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 300
	i32 1175944061, ; 187: Camera.MAUI => 0x46177b7d => 170
	i32 1178241025, ; 188: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 285
	i32 1186231468, ; 189: Newtonsoft.Json.Bson.dll => 0x46b474ac => 206
	i32 1202000627, ; 190: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 183
	i32 1204270330, ; 191: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 243
	i32 1204575371, ; 192: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 188
	i32 1208641965, ; 193: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1214827643, ; 194: CommunityToolkit.Mvvm => 0x4868cc7b => 176
	i32 1219128291, ; 195: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1243150071, ; 196: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 305
	i32 1246548578, ; 197: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 248
	i32 1253011324, ; 198: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 199: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 322
	i32 1263886435, ; 200: Xamarin.Google.Guava.dll => 0x4b556063 => 310
	i32 1264511973, ; 201: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 295
	i32 1264890200, ; 202: Xamarin.KotlinX.Coroutines.Core.dll => 0x4b64b158 => 318
	i32 1267360935, ; 203: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 299
	i32 1273260888, ; 204: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 249
	i32 1275534314, ; 205: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 317
	i32 1278448581, ; 206: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 240
	i32 1292207520, ; 207: SQLitePCLRaw.core.dll => 0x4d0585a0 => 209
	i32 1293217323, ; 208: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 261
	i32 1308624726, ; 209: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 331
	i32 1309188875, ; 210: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1309209905, ; 211: ExoPlayer.DataSource => 0x4e08f531 => 223
	i32 1322716291, ; 212: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 304
	i32 1324164729, ; 213: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 214: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1336711579, ; 215: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 351
	i32 1347751866, ; 216: Plugin.Maui.Audio => 0x50550fba => 207
	i32 1364015309, ; 217: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 218: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 352
	i32 1376866003, ; 219: Xamarin.AndroidX.SavedState => 0x52114ed3 => 291
	i32 1379779777, ; 220: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1395857551, ; 221: Xamarin.AndroidX.Media.dll => 0x5333188f => 282
	i32 1402170036, ; 222: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 223: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 253
	i32 1406299041, ; 224: Xamarin.Google.Guava.FailureAccess => 0x53d26ba1 => 311
	i32 1408764838, ; 225: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 226: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 227: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1430672901, ; 228: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 320
	i32 1434145427, ; 229: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 230: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 308
	i32 1439761251, ; 231: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1452070440, ; 232: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 233: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 234: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 235: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 236: es\Microsoft.Maui.Controls.resources => 0x57152abe => 326
	i32 1461234159, ; 237: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 238: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 239: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 240: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 242
	i32 1470490898, ; 241: Microsoft.Extensions.Primitives => 0x57a5e912 => 198
	i32 1479771757, ; 242: System.Collections.Immutable => 0x5833866d => 9
	i32 1480156764, ; 243: ExoPlayer.DataSource.dll => 0x5839665c => 223
	i32 1480492111, ; 244: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 245: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 246: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 292
	i32 1490351284, ; 247: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 181
	i32 1526286932, ; 248: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 350
	i32 1536373174, ; 249: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 250: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 135
	i32 1543355203, ; 251: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 252: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1565862583, ; 253: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 254: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 138
	i32 1573704789, ; 255: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 256: System.Threading.Overlapped => 0x5e2d7514 => 137
	i32 1582372066, ; 257: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 260
	i32 1592978981, ; 258: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 259: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 309
	i32 1601112923, ; 260: System.Xml.Serialization => 0x5f6f0b5b => 154
	i32 1604827217, ; 261: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 262: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 263: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 280
	i32 1622358360, ; 264: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 265: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 303
	i32 1634654947, ; 266: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 174
	i32 1635184631, ; 267: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 264
	i32 1636350590, ; 268: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 256
	i32 1638652436, ; 269: CommunityToolkit.Maui.MediaElement => 0x61abda14 => 175
	i32 1639515021, ; 270: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 271: System.Text.RegularExpressions => 0x61c036ca => 135
	i32 1641389582, ; 272: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 273: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 274: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 297
	i32 1658251792, ; 275: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 306
	i32 1670060433, ; 276: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 251
	i32 1675553242, ; 277: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 278: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 279: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 280: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1688112883, ; 281: Microsoft.Data.Sqlite => 0x649e8ef3 => 181
	i32 1689493916, ; 282: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 182
	i32 1691477237, ; 283: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 284: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1700397376, ; 285: ExoPlayer.Transformer => 0x655a0140 => 230
	i32 1701541528, ; 286: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 287: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 210
	i32 1720223769, ; 288: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 273
	i32 1726116996, ; 289: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 290: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 291: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 246
	i32 1743415430, ; 292: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 321
	i32 1744735666, ; 293: System.Transactions.Local.dll => 0x67fe8db2 => 146
	i32 1746115085, ; 294: System.IO.Pipelines.dll => 0x68139a0d => 214
	i32 1746316138, ; 295: Mono.Android.Export => 0x6816ab6a => 166
	i32 1750313021, ; 296: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 297: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 298: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765620304, ; 299: ExoPlayer.Core => 0x693d3a50 => 220
	i32 1765942094, ; 300: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 301: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 296
	i32 1770582343, ; 302: Microsoft.Extensions.Logging.dll => 0x6988f147 => 194
	i32 1776026572, ; 303: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 304: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 305: Mono.Android.Runtime.dll => 0x6a216153 => 167
	i32 1782862114, ; 306: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 337
	i32 1788241197, ; 307: Xamarin.AndroidX.Fragment => 0x6a96652d => 266
	i32 1793755602, ; 308: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 329
	i32 1808609942, ; 309: Xamarin.AndroidX.Loader => 0x6bcd3296 => 280
	i32 1813058853, ; 310: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 314
	i32 1813201214, ; 311: Xamarin.Google.Android.Material => 0x6c13413e => 306
	i32 1818569960, ; 312: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 286
	i32 1818787751, ; 313: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 314: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 315: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1828688058, ; 316: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 195
	i32 1847515442, ; 317: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 233
	i32 1853025655, ; 318: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 346
	i32 1858542181, ; 319: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 320: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1873787912, ; 321: Xamarin.AndroidX.DataBinding.ViewBinding.dll => 0x6fafbc08 => 259
	i32 1875935024, ; 322: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 328
	i32 1879696579, ; 323: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 324: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 244
	i32 1886040351, ; 325: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 186
	i32 1888955245, ; 326: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 327: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1893218855, ; 328: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 322
	i32 1898237753, ; 329: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 330: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1910275211, ; 331: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1926145099, ; 332: ExoPlayer.Container.dll => 0x72cea44b => 219
	i32 1939592360, ; 333: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1949863139, ; 334: Castle.Core.dll => 0x74388ce3 => 171
	i32 1953182387, ; 335: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 333
	i32 1956758971, ; 336: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 337: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 293
	i32 1968388702, ; 338: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 189
	i32 1984283898, ; 339: ExoPlayer.Ext.MediaSession.dll => 0x7645c4fa => 227
	i32 1985761444, ; 340: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 235
	i32 2003115576, ; 341: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 325
	i32 2011961780, ; 342: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014489277, ; 343: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 186
	i32 2019465201, ; 344: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 277
	i32 2031763787, ; 345: Xamarin.Android.Glide => 0x791a414b => 232
	i32 2045470958, ; 346: System.Private.Xml => 0x79eb68ee => 87
	i32 2055257422, ; 347: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 272
	i32 2060060697, ; 348: System.Windows.dll => 0x7aca0819 => 151
	i32 2066184531, ; 349: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 324
	i32 2069514766, ; 350: Newtonsoft.Json.Bson => 0x7b5a4a0e => 206
	i32 2070888862, ; 351: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 352: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 353: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2103459038, ; 354: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 211
	i32 2106312818, ; 355: ExoPlayer.Decoder => 0x7d8bc872 => 224
	i32 2113912252, ; 356: ExoPlayer.UI => 0x7dffbdbc => 231
	i32 2127167465, ; 357: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 358: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 359: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 159
	i32 2146852085, ; 360: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 361: Microsoft.Maui => 0x80bd55ad => 202
	i32 2169148018, ; 362: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 332
	i32 2181898931, ; 363: Microsoft.Extensions.Options.dll => 0x820d22b3 => 197
	i32 2192057212, ; 364: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 195
	i32 2193016926, ; 365: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2197979891, ; 366: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 193
	i32 2201107256, ; 367: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 319
	i32 2201231467, ; 368: System.Net.Http => 0x8334206b => 63
	i32 2202964214, ; 369: ExoPlayer.dll => 0x834e90f6 => 217
	i32 2207618523, ; 370: it\Microsoft.Maui.Controls.resources => 0x839595db => 334
	i32 2217644978, ; 371: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 300
	i32 2222056684, ; 372: System.Threading.Tasks.Parallel => 0x8471e4ec => 140
	i32 2239138732, ; 373: ExoPlayer.SmoothStreaming => 0x85768bac => 229
	i32 2244775296, ; 374: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 281
	i32 2252106437, ; 375: System.Xml.Serialization.dll => 0x863c6ac5 => 154
	i32 2252897993, ; 376: Microsoft.EntityFrameworkCore => 0x86487ec9 => 182
	i32 2256313426, ; 377: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 378: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 379: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 190
	i32 2267999099, ; 380: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 234
	i32 2279755925, ; 381: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 289
	i32 2293034957, ; 382: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 383: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 384: System.Net.Mail => 0x88ffe49e => 65
	i32 2299877983, ; 385: Com.Vanniktech.AndroidImageCropper.Maui => 0x89155a5f => 172
	i32 2303942373, ; 386: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 338
	i32 2305521784, ; 387: System.Private.CoreLib.dll => 0x896b7878 => 169
	i32 2315684594, ; 388: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 238
	i32 2320631194, ; 389: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 140
	i32 2340441535, ; 390: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 391: System.ValueTuple => 0x8bbaa2cd => 148
	i32 2353062107, ; 392: System.Net.Primitives => 0x8c40e0db => 69
	i32 2366048013, ; 393: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 332
	i32 2368005991, ; 394: System.Xml.ReaderWriter.dll => 0x8d24e767 => 153
	i32 2371007202, ; 395: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 189
	i32 2378619854, ; 396: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 397: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2395872292, ; 398: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 333
	i32 2401565422, ; 399: System.Web.HttpUtility => 0x8f24faee => 149
	i32 2403452196, ; 400: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 263
	i32 2421380589, ; 401: System.Threading.Tasks.Dataflow => 0x905355ed => 138
	i32 2423080555, ; 402: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 249
	i32 2427813419, ; 403: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 330
	i32 2435356389, ; 404: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 405: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2437192331, ; 406: CommunityToolkit.Maui.MediaElement.dll => 0x91449a8b => 175
	i32 2452318479, ; 407: Microsoft.EntityFrameworkCore.Proxies => 0x922b690f => 184
	i32 2454642406, ; 408: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 409: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 410: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465273461, ; 411: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 208
	i32 2465532216, ; 412: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 252
	i32 2471841756, ; 413: netstandard.dll => 0x93554fdc => 164
	i32 2475788418, ; 414: Java.Interop.dll => 0x93918882 => 165
	i32 2476233210, ; 415: ExoPlayer => 0x939851fa => 217
	i32 2480646305, ; 416: Microsoft.Maui.Controls => 0x93dba8a1 => 200
	i32 2483903535, ; 417: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 418: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 419: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 420: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 421: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 336
	i32 2505896520, ; 422: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 275
	i32 2509217888, ; 423: System.Diagnostics.EventLog => 0x958fa060 => 213
	i32 2515854816, ; 424: ExoPlayer.Common => 0x95f4e5e0 => 218
	i32 2522472828, ; 425: Xamarin.Android.Glide.dll => 0x9659e17c => 232
	i32 2538310050, ; 426: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2542804739, ; 427: Kotlin.Android.Extensions.Runtime.Maui.dll => 0x97901f03 => 179
	i32 2550873716, ; 428: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 331
	i32 2562349572, ; 429: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 430: System.Text.Encodings.Web => 0x9930ee42 => 215
	i32 2576534780, ; 431: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 335
	i32 2581783588, ; 432: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 276
	i32 2581819634, ; 433: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 299
	i32 2585220780, ; 434: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 435: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 436: System.Threading.ThreadPool => 0x9a5a3337 => 143
	i32 2593496499, ; 437: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 340
	i32 2605712449, ; 438: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 319
	i32 2615233544, ; 439: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 267
	i32 2616218305, ; 440: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 196
	i32 2617129537, ; 441: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 442: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 443: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 256
	i32 2624644809, ; 444: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 262
	i32 2626028643, ; 445: ExoPlayer.Rtsp.dll => 0x9c860463 => 228
	i32 2626831493, ; 446: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 335
	i32 2627185994, ; 447: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 448: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 449: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 271
	i32 2634653062, ; 450: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 185
	i32 2663391936, ; 451: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 234
	i32 2663698177, ; 452: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 453: System.Xml.XDocument.dll => 0x9ecf752a => 155
	i32 2665622720, ; 454: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2671474046, ; 455: Xamarin.KotlinX.Coroutines.Core => 0x9f3b757e => 318
	i32 2676780864, ; 456: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 457: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2693849962, ; 458: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 459: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 297
	i32 2713040075, ; 460: ExoPlayer.Hls => 0xa1b5b4cb => 226
	i32 2715334215, ; 461: System.Threading.Tasks.dll => 0xa1d8b647 => 141
	i32 2717744543, ; 462: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 463: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 464: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 465: Xamarin.AndroidX.Activity => 0xa2e0939b => 236
	i32 2735172069, ; 466: System.Threading.Channels => 0xa30769e5 => 136
	i32 2737747696, ; 467: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 242
	i32 2740698338, ; 468: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 321
	i32 2740948882, ; 469: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 470: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 471: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 341
	i32 2758225723, ; 472: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 201
	i32 2764765095, ; 473: Microsoft.Maui.dll => 0xa4caf7a7 => 202
	i32 2765824710, ; 474: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 475: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 313
	i32 2773678566, ; 476: Xamarin.AndroidX.DataBinding.ViewBinding => 0xa552f9e6 => 259
	i32 2778768386, ; 477: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 302
	i32 2779977773, ; 478: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 290
	i32 2785988530, ; 479: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 347
	i32 2788224221, ; 480: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 267
	i32 2796087574, ; 481: ExoPlayer.Extractor.dll => 0xa6a8e916 => 225
	i32 2801831435, ; 482: Microsoft.Maui.Graphics => 0xa7008e0b => 204
	i32 2803228030, ; 483: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 156
	i32 2810250172, ; 484: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 253
	i32 2819470561, ; 485: System.Xml.dll => 0xa80db4e1 => 160
	i32 2821205001, ; 486: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 487: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 290
	i32 2824502124, ; 488: System.Xml.XmlDocument => 0xa85a7b6c => 158
	i32 2838993487, ; 489: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 278
	i32 2847789619, ; 490: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 185
	i32 2849599387, ; 491: System.Threading.Overlapped.dll => 0xa9d96f9b => 137
	i32 2853208004, ; 492: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 302
	i32 2855708567, ; 493: Xamarin.AndroidX.Transition => 0xaa36a797 => 298
	i32 2861098320, ; 494: Mono.Android.Export.dll => 0xaa88e550 => 166
	i32 2861189240, ; 495: Microsoft.Maui.Essentials => 0xaa8a4878 => 203
	i32 2868488919, ; 496: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 174
	i32 2870099610, ; 497: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 237
	i32 2875164099, ; 498: Jsr305Binding.dll => 0xab5f85c3 => 307
	i32 2875220617, ; 499: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 500: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 265
	i32 2887636118, ; 501: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 502: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 503: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 504: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 505: mscorlib.dll => 0xad2a79b6 => 163
	i32 2909740682, ; 506: System.Private.CoreLib => 0xad6f1e8a => 169
	i32 2916838712, ; 507: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 303
	i32 2919462931, ; 508: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 509: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 239
	i32 2936416060, ; 510: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 511: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 512: System.Xml.XPath.XDocument => 0xaf624531 => 156
	i32 2959614098, ; 513: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2960379616, ; 514: Xamarin.Google.Guava => 0xb073cee0 => 310
	i32 2968338931, ; 515: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2972252294, ; 516: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 517: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 261
	i32 2987532451, ; 518: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 293
	i32 2996846495, ; 519: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 274
	i32 3016983068, ; 520: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 295
	i32 3023353419, ; 521: WindowsBase.dll => 0xb434b64b => 162
	i32 3024354802, ; 522: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 269
	i32 3027462113, ; 523: ExoPlayer.Common.dll => 0xb47367e1 => 218
	i32 3038032645, ; 524: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 354
	i32 3053864966, ; 525: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 327
	i32 3056245963, ; 526: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 292
	i32 3057625584, ; 527: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 283
	i32 3059408633, ; 528: Mono.Android.Runtime => 0xb65adef9 => 167
	i32 3059793426, ; 529: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 530: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 187
	i32 3075834255, ; 531: System.Threading.Tasks => 0xb755818f => 141
	i32 3090735792, ; 532: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 533: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 534: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 535: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 536: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 537: System.Threading.Tasks.Extensions => 0xba4127cb => 139
	i32 3132293585, ; 538: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3144327419, ; 539: ExoPlayer.Hls.dll => 0xbb6aa0fb => 226
	i32 3147165239, ; 540: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 541: GoogleGson.dll => 0xbba64c02 => 177
	i32 3159123045, ; 542: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 543: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 544: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 284
	i32 3190271366, ; 545: ExoPlayer.Decoder.dll => 0xbe27ad86 => 224
	i32 3192346100, ; 546: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 547: System.Web => 0xbe592c0c => 150
	i32 3195844289, ; 548: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 187
	i32 3204380047, ; 549: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 550: System.Xml.XmlDocument.dll => 0xbf506931 => 158
	i32 3211777861, ; 551: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 260
	i32 3220365878, ; 552: System.Threading => 0xbff2e236 => 145
	i32 3226221578, ; 553: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3251039220, ; 554: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 555: Xamarin.AndroidX.CardView => 0xc235e84d => 246
	i32 3265493905, ; 556: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 557: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 139
	i32 3277815716, ; 558: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3279906254, ; 559: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 560: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 561: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 562: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 563: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 564: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 327
	i32 3315872140, ; 565: Com.Vanniktech.AndroidImageCropper.Maui.dll => 0xc5a4318c => 172
	i32 3316684772, ; 566: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 567: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 257
	i32 3317144872, ; 568: System.Data => 0xc5b79d28 => 24
	i32 3329734229, ; 569: ExoPlayer.Database => 0xc677b655 => 222
	i32 3340431453, ; 570: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 244
	i32 3345895724, ; 571: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 288
	i32 3346324047, ; 572: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 285
	i32 3357674450, ; 573: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 344
	i32 3358260929, ; 574: System.Text.Json => 0xc82afec1 => 216
	i32 3360279109, ; 575: SQLitePCLRaw.core => 0xc849ca45 => 209
	i32 3362336904, ; 576: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 237
	i32 3362522851, ; 577: Xamarin.AndroidX.Core => 0xc86c06e3 => 254
	i32 3366347497, ; 578: Java.Interop => 0xc8a662e9 => 165
	i32 3374999561, ; 579: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 289
	i32 3381016424, ; 580: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 323
	i32 3395150330, ; 581: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3396979385, ; 582: ExoPlayer.Transformer.dll => 0xca79cab9 => 230
	i32 3403906625, ; 583: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 584: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 258
	i32 3428513518, ; 585: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 191
	i32 3429136800, ; 586: System.Xml => 0xcc6479a0 => 160
	i32 3430777524, ; 587: netstandard => 0xcc7d82b4 => 164
	i32 3441283291, ; 588: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 262
	i32 3445260447, ; 589: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 590: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 199
	i32 3458724246, ; 591: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 342
	i32 3471940407, ; 592: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 593: Mono.Android => 0xcf3163e6 => 168
	i32 3484440000, ; 594: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 343
	i32 3485117614, ; 595: System.Text.Json.dll => 0xcfbaacae => 216
	i32 3486566296, ; 596: System.Transactions => 0xcfd0c798 => 147
	i32 3493954962, ; 597: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 250
	i32 3509114376, ; 598: System.Xml.Linq => 0xd128d608 => 152
	i32 3515174580, ; 599: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 600: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 601: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3560100363, ; 602: System.Threading.Timer => 0xd432d20b => 144
	i32 3570554715, ; 603: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 604: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 351
	i32 3592228221, ; 605: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 353
	i32 3597029428, ; 606: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 235
	i32 3598340787, ; 607: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 608: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 609: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 610: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 287
	i32 3633644679, ; 611: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 239
	i32 3638274909, ; 612: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 613: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 272
	i32 3643446276, ; 614: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 348
	i32 3643854240, ; 615: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 284
	i32 3645089577, ; 616: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 617: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 190
	i32 3660523487, ; 618: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3660726404, ; 619: Plugin.Maui.Audio.dll => 0xda324084 => 207
	i32 3672681054, ; 620: Mono.Android.dll => 0xdae8aa5e => 168
	i32 3682565725, ; 621: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 245
	i32 3684561358, ; 622: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 250
	i32 3700866549, ; 623: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 624: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 255
	i32 3716563718, ; 625: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 626: Xamarin.AndroidX.Annotation => 0xdda814c6 => 238
	i32 3721776493, ; 627: Mobile => 0xddd5cd6d => 0
	i32 3724971120, ; 628: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 283
	i32 3732100267, ; 629: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 630: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 631: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 212
	i32 3751444290, ; 632: System.Xml.XPath => 0xdf9a7f42 => 157
	i32 3751619990, ; 633: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 323
	i32 3754567612, ; 634: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 211
	i32 3765952165, ; 635: Mobile.dll => 0xe077dea5 => 0
	i32 3786282454, ; 636: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 247
	i32 3792276235, ; 637: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 638: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 199
	i32 3802395368, ; 639: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 640: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 641: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3822602673, ; 642: Xamarin.AndroidX.Media => 0xe3d849b1 => 282
	i32 3823082795, ; 643: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 644: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 645: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 192
	i32 3844307129, ; 646: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 647: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 648: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 649: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 650: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 651: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 652: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 298
	i32 3888767677, ; 653: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 288
	i32 3896106733, ; 654: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 655: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 254
	i32 3901907137, ; 656: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3910130544, ; 657: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 248
	i32 3920221145, ; 658: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 339
	i32 3920810846, ; 659: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 660: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 301
	i32 3928044579, ; 661: System.Xml.ReaderWriter => 0xea213423 => 153
	i32 3930554604, ; 662: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 663: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 286
	i32 3945713374, ; 664: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 665: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 666: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 241
	i32 3959773229, ; 667: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 274
	i32 4003436829, ; 668: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 669: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 240
	i32 4023392905, ; 670: System.IO.Pipelines => 0xefd01a89 => 214
	i32 4025784931, ; 671: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 672: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 201
	i32 4054681211, ; 673: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4068434129, ; 674: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 675: System.Threading.dll => 0xf2ce3c98 => 145
	i32 4091086043, ; 676: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 325
	i32 4094352644, ; 677: Microsoft.Maui.Essentials.dll => 0xf40add04 => 203
	i32 4099507663, ; 678: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 679: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 680: Xamarin.AndroidX.Emoji2 => 0xf479582c => 263
	i32 4101842092, ; 681: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 188
	i32 4103439459, ; 682: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 349
	i32 4126470640, ; 683: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 191
	i32 4127667938, ; 684: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 685: System.AppContext => 0xf6318da0 => 6
	i32 4142654081, ; 686: Camera.MAUI.dll => 0xf6ebe281 => 170
	i32 4147896353, ; 687: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150914736, ; 688: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 349
	i32 4151237749, ; 689: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 690: System.Xml.XmlSerializer => 0xf7e95c85 => 159
	i32 4161255271, ; 691: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 692: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4173364138, ; 693: ExoPlayer.SmoothStreaming.dll => 0xf8c07baa => 229
	i32 4181436372, ; 694: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 695: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 279
	i32 4185676441, ; 696: System.Security => 0xf97c5a99 => 129
	i32 4190597220, ; 697: ExoPlayer.Core.dll => 0xf9c77064 => 220
	i32 4196529839, ; 698: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 699: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 212
	i32 4241083455, ; 700: Castle.Core => 0xfcc9cc3f => 171
	i32 4249188766, ; 701: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 338
	i32 4256097574, ; 702: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 255
	i32 4258378803, ; 703: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 278
	i32 4260525087, ; 704: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 705: Microsoft.Maui.Controls.dll => 0xfea12dee => 200
	i32 4274623895, ; 706: CommunityToolkit.Mvvm.dll => 0xfec99597 => 176
	i32 4274976490, ; 707: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4292120959, ; 708: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 279
	i32 4294763496 ; 709: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 265
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [710 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 193, ; 3
	i32 275, ; 4
	i32 312, ; 5
	i32 47, ; 6
	i32 320, ; 7
	i32 205, ; 8
	i32 79, ; 9
	i32 329, ; 10
	i32 142, ; 11
	i32 29, ; 12
	i32 353, ; 13
	i32 123, ; 14
	i32 204, ; 15
	i32 101, ; 16
	i32 337, ; 17
	i32 294, ; 18
	i32 106, ; 19
	i32 294, ; 20
	i32 136, ; 21
	i32 315, ; 22
	i32 352, ; 23
	i32 345, ; 24
	i32 76, ; 25
	i32 123, ; 26
	i32 13, ; 27
	i32 247, ; 28
	i32 131, ; 29
	i32 296, ; 30
	i32 148, ; 31
	i32 18, ; 32
	i32 245, ; 33
	i32 26, ; 34
	i32 269, ; 35
	i32 1, ; 36
	i32 58, ; 37
	i32 41, ; 38
	i32 90, ; 39
	i32 251, ; 40
	i32 311, ; 41
	i32 144, ; 42
	i32 271, ; 43
	i32 268, ; 44
	i32 53, ; 45
	i32 221, ; 46
	i32 68, ; 47
	i32 350, ; 48
	i32 236, ; 49
	i32 82, ; 50
	i32 328, ; 51
	i32 270, ; 52
	i32 210, ; 53
	i32 130, ; 54
	i32 180, ; 55
	i32 54, ; 56
	i32 146, ; 57
	i32 73, ; 58
	i32 142, ; 59
	i32 61, ; 60
	i32 143, ; 61
	i32 354, ; 62
	i32 162, ; 63
	i32 348, ; 64
	i32 178, ; 65
	i32 179, ; 66
	i32 252, ; 67
	i32 12, ; 68
	i32 266, ; 69
	i32 124, ; 70
	i32 222, ; 71
	i32 149, ; 72
	i32 112, ; 73
	i32 163, ; 74
	i32 161, ; 75
	i32 268, ; 76
	i32 281, ; 77
	i32 326, ; 78
	i32 83, ; 79
	i32 198, ; 80
	i32 147, ; 81
	i32 315, ; 82
	i32 59, ; 83
	i32 347, ; 84
	i32 194, ; 85
	i32 50, ; 86
	i32 102, ; 87
	i32 113, ; 88
	i32 39, ; 89
	i32 307, ; 90
	i32 305, ; 91
	i32 119, ; 92
	i32 173, ; 93
	i32 51, ; 94
	i32 43, ; 95
	i32 118, ; 96
	i32 180, ; 97
	i32 178, ; 98
	i32 219, ; 99
	i32 257, ; 100
	i32 339, ; 101
	i32 264, ; 102
	i32 80, ; 103
	i32 215, ; 104
	i32 301, ; 105
	i32 243, ; 106
	i32 8, ; 107
	i32 72, ; 108
	i32 152, ; 109
	i32 317, ; 110
	i32 151, ; 111
	i32 91, ; 112
	i32 313, ; 113
	i32 44, ; 114
	i32 316, ; 115
	i32 108, ; 116
	i32 128, ; 117
	i32 208, ; 118
	i32 25, ; 119
	i32 233, ; 120
	i32 71, ; 121
	i32 54, ; 122
	i32 45, ; 123
	i32 345, ; 124
	i32 197, ; 125
	i32 258, ; 126
	i32 22, ; 127
	i32 273, ; 128
	i32 221, ; 129
	i32 85, ; 130
	i32 42, ; 131
	i32 157, ; 132
	i32 70, ; 133
	i32 287, ; 134
	i32 330, ; 135
	i32 3, ; 136
	i32 41, ; 137
	i32 62, ; 138
	i32 344, ; 139
	i32 16, ; 140
	i32 52, ; 141
	i32 227, ; 142
	i32 341, ; 143
	i32 312, ; 144
	i32 225, ; 145
	i32 104, ; 146
	i32 205, ; 147
	i32 316, ; 148
	i32 184, ; 149
	i32 334, ; 150
	i32 308, ; 151
	i32 270, ; 152
	i32 33, ; 153
	i32 155, ; 154
	i32 84, ; 155
	i32 31, ; 156
	i32 343, ; 157
	i32 12, ; 158
	i32 50, ; 159
	i32 55, ; 160
	i32 291, ; 161
	i32 35, ; 162
	i32 231, ; 163
	i32 192, ; 164
	i32 309, ; 165
	i32 241, ; 166
	i32 34, ; 167
	i32 324, ; 168
	i32 57, ; 169
	i32 277, ; 170
	i32 177, ; 171
	i32 17, ; 172
	i32 314, ; 173
	i32 213, ; 174
	i32 161, ; 175
	i32 346, ; 176
	i32 340, ; 177
	i32 336, ; 178
	i32 276, ; 179
	i32 196, ; 180
	i32 304, ; 181
	i32 228, ; 182
	i32 183, ; 183
	i32 342, ; 184
	i32 150, ; 185
	i32 300, ; 186
	i32 170, ; 187
	i32 285, ; 188
	i32 206, ; 189
	i32 183, ; 190
	i32 243, ; 191
	i32 188, ; 192
	i32 28, ; 193
	i32 176, ; 194
	i32 51, ; 195
	i32 305, ; 196
	i32 248, ; 197
	i32 5, ; 198
	i32 322, ; 199
	i32 310, ; 200
	i32 295, ; 201
	i32 318, ; 202
	i32 299, ; 203
	i32 249, ; 204
	i32 317, ; 205
	i32 240, ; 206
	i32 209, ; 207
	i32 261, ; 208
	i32 331, ; 209
	i32 84, ; 210
	i32 223, ; 211
	i32 304, ; 212
	i32 60, ; 213
	i32 111, ; 214
	i32 351, ; 215
	i32 207, ; 216
	i32 56, ; 217
	i32 352, ; 218
	i32 291, ; 219
	i32 98, ; 220
	i32 282, ; 221
	i32 19, ; 222
	i32 253, ; 223
	i32 311, ; 224
	i32 110, ; 225
	i32 100, ; 226
	i32 101, ; 227
	i32 320, ; 228
	i32 103, ; 229
	i32 308, ; 230
	i32 70, ; 231
	i32 37, ; 232
	i32 31, ; 233
	i32 102, ; 234
	i32 72, ; 235
	i32 326, ; 236
	i32 9, ; 237
	i32 122, ; 238
	i32 45, ; 239
	i32 242, ; 240
	i32 198, ; 241
	i32 9, ; 242
	i32 223, ; 243
	i32 42, ; 244
	i32 4, ; 245
	i32 292, ; 246
	i32 181, ; 247
	i32 350, ; 248
	i32 30, ; 249
	i32 135, ; 250
	i32 91, ; 251
	i32 92, ; 252
	i32 48, ; 253
	i32 138, ; 254
	i32 111, ; 255
	i32 137, ; 256
	i32 260, ; 257
	i32 114, ; 258
	i32 309, ; 259
	i32 154, ; 260
	i32 75, ; 261
	i32 78, ; 262
	i32 280, ; 263
	i32 36, ; 264
	i32 303, ; 265
	i32 174, ; 266
	i32 264, ; 267
	i32 256, ; 268
	i32 175, ; 269
	i32 63, ; 270
	i32 135, ; 271
	i32 15, ; 272
	i32 115, ; 273
	i32 297, ; 274
	i32 306, ; 275
	i32 251, ; 276
	i32 47, ; 277
	i32 69, ; 278
	i32 79, ; 279
	i32 125, ; 280
	i32 181, ; 281
	i32 182, ; 282
	i32 93, ; 283
	i32 120, ; 284
	i32 230, ; 285
	i32 26, ; 286
	i32 210, ; 287
	i32 273, ; 288
	i32 96, ; 289
	i32 27, ; 290
	i32 246, ; 291
	i32 321, ; 292
	i32 146, ; 293
	i32 214, ; 294
	i32 166, ; 295
	i32 4, ; 296
	i32 97, ; 297
	i32 32, ; 298
	i32 220, ; 299
	i32 92, ; 300
	i32 296, ; 301
	i32 194, ; 302
	i32 21, ; 303
	i32 40, ; 304
	i32 167, ; 305
	i32 337, ; 306
	i32 266, ; 307
	i32 329, ; 308
	i32 280, ; 309
	i32 314, ; 310
	i32 306, ; 311
	i32 286, ; 312
	i32 2, ; 313
	i32 133, ; 314
	i32 110, ; 315
	i32 195, ; 316
	i32 233, ; 317
	i32 346, ; 318
	i32 57, ; 319
	i32 94, ; 320
	i32 259, ; 321
	i32 328, ; 322
	i32 38, ; 323
	i32 244, ; 324
	i32 186, ; 325
	i32 25, ; 326
	i32 93, ; 327
	i32 322, ; 328
	i32 88, ; 329
	i32 98, ; 330
	i32 10, ; 331
	i32 219, ; 332
	i32 86, ; 333
	i32 171, ; 334
	i32 333, ; 335
	i32 99, ; 336
	i32 293, ; 337
	i32 189, ; 338
	i32 227, ; 339
	i32 235, ; 340
	i32 325, ; 341
	i32 7, ; 342
	i32 186, ; 343
	i32 277, ; 344
	i32 232, ; 345
	i32 87, ; 346
	i32 272, ; 347
	i32 151, ; 348
	i32 324, ; 349
	i32 206, ; 350
	i32 32, ; 351
	i32 115, ; 352
	i32 81, ; 353
	i32 211, ; 354
	i32 224, ; 355
	i32 231, ; 356
	i32 20, ; 357
	i32 11, ; 358
	i32 159, ; 359
	i32 3, ; 360
	i32 202, ; 361
	i32 332, ; 362
	i32 197, ; 363
	i32 195, ; 364
	i32 83, ; 365
	i32 193, ; 366
	i32 319, ; 367
	i32 63, ; 368
	i32 217, ; 369
	i32 334, ; 370
	i32 300, ; 371
	i32 140, ; 372
	i32 229, ; 373
	i32 281, ; 374
	i32 154, ; 375
	i32 182, ; 376
	i32 40, ; 377
	i32 116, ; 378
	i32 190, ; 379
	i32 234, ; 380
	i32 289, ; 381
	i32 130, ; 382
	i32 74, ; 383
	i32 65, ; 384
	i32 172, ; 385
	i32 338, ; 386
	i32 169, ; 387
	i32 238, ; 388
	i32 140, ; 389
	i32 105, ; 390
	i32 148, ; 391
	i32 69, ; 392
	i32 332, ; 393
	i32 153, ; 394
	i32 189, ; 395
	i32 120, ; 396
	i32 126, ; 397
	i32 333, ; 398
	i32 149, ; 399
	i32 263, ; 400
	i32 138, ; 401
	i32 249, ; 402
	i32 330, ; 403
	i32 20, ; 404
	i32 14, ; 405
	i32 175, ; 406
	i32 184, ; 407
	i32 134, ; 408
	i32 74, ; 409
	i32 58, ; 410
	i32 208, ; 411
	i32 252, ; 412
	i32 164, ; 413
	i32 165, ; 414
	i32 217, ; 415
	i32 200, ; 416
	i32 15, ; 417
	i32 73, ; 418
	i32 6, ; 419
	i32 23, ; 420
	i32 336, ; 421
	i32 275, ; 422
	i32 213, ; 423
	i32 218, ; 424
	i32 232, ; 425
	i32 90, ; 426
	i32 179, ; 427
	i32 331, ; 428
	i32 1, ; 429
	i32 215, ; 430
	i32 335, ; 431
	i32 276, ; 432
	i32 299, ; 433
	i32 133, ; 434
	i32 68, ; 435
	i32 143, ; 436
	i32 340, ; 437
	i32 319, ; 438
	i32 267, ; 439
	i32 196, ; 440
	i32 87, ; 441
	i32 95, ; 442
	i32 256, ; 443
	i32 262, ; 444
	i32 228, ; 445
	i32 335, ; 446
	i32 30, ; 447
	i32 44, ; 448
	i32 271, ; 449
	i32 185, ; 450
	i32 234, ; 451
	i32 108, ; 452
	i32 155, ; 453
	i32 34, ; 454
	i32 318, ; 455
	i32 22, ; 456
	i32 113, ; 457
	i32 56, ; 458
	i32 297, ; 459
	i32 226, ; 460
	i32 141, ; 461
	i32 117, ; 462
	i32 119, ; 463
	i32 109, ; 464
	i32 236, ; 465
	i32 136, ; 466
	i32 242, ; 467
	i32 321, ; 468
	i32 53, ; 469
	i32 104, ; 470
	i32 341, ; 471
	i32 201, ; 472
	i32 202, ; 473
	i32 132, ; 474
	i32 313, ; 475
	i32 259, ; 476
	i32 302, ; 477
	i32 290, ; 478
	i32 347, ; 479
	i32 267, ; 480
	i32 225, ; 481
	i32 204, ; 482
	i32 156, ; 483
	i32 253, ; 484
	i32 160, ; 485
	i32 131, ; 486
	i32 290, ; 487
	i32 158, ; 488
	i32 278, ; 489
	i32 185, ; 490
	i32 137, ; 491
	i32 302, ; 492
	i32 298, ; 493
	i32 166, ; 494
	i32 203, ; 495
	i32 174, ; 496
	i32 237, ; 497
	i32 307, ; 498
	i32 39, ; 499
	i32 265, ; 500
	i32 80, ; 501
	i32 55, ; 502
	i32 36, ; 503
	i32 96, ; 504
	i32 163, ; 505
	i32 169, ; 506
	i32 303, ; 507
	i32 81, ; 508
	i32 239, ; 509
	i32 97, ; 510
	i32 29, ; 511
	i32 156, ; 512
	i32 18, ; 513
	i32 310, ; 514
	i32 126, ; 515
	i32 118, ; 516
	i32 261, ; 517
	i32 293, ; 518
	i32 274, ; 519
	i32 295, ; 520
	i32 162, ; 521
	i32 269, ; 522
	i32 218, ; 523
	i32 354, ; 524
	i32 327, ; 525
	i32 292, ; 526
	i32 283, ; 527
	i32 167, ; 528
	i32 16, ; 529
	i32 187, ; 530
	i32 141, ; 531
	i32 124, ; 532
	i32 117, ; 533
	i32 37, ; 534
	i32 114, ; 535
	i32 46, ; 536
	i32 139, ; 537
	i32 116, ; 538
	i32 226, ; 539
	i32 33, ; 540
	i32 177, ; 541
	i32 94, ; 542
	i32 52, ; 543
	i32 284, ; 544
	i32 224, ; 545
	i32 128, ; 546
	i32 150, ; 547
	i32 187, ; 548
	i32 24, ; 549
	i32 158, ; 550
	i32 260, ; 551
	i32 145, ; 552
	i32 103, ; 553
	i32 88, ; 554
	i32 246, ; 555
	i32 59, ; 556
	i32 139, ; 557
	i32 99, ; 558
	i32 5, ; 559
	i32 13, ; 560
	i32 121, ; 561
	i32 134, ; 562
	i32 27, ; 563
	i32 327, ; 564
	i32 172, ; 565
	i32 71, ; 566
	i32 257, ; 567
	i32 24, ; 568
	i32 222, ; 569
	i32 244, ; 570
	i32 288, ; 571
	i32 285, ; 572
	i32 344, ; 573
	i32 216, ; 574
	i32 209, ; 575
	i32 237, ; 576
	i32 254, ; 577
	i32 165, ; 578
	i32 289, ; 579
	i32 323, ; 580
	i32 100, ; 581
	i32 230, ; 582
	i32 122, ; 583
	i32 258, ; 584
	i32 191, ; 585
	i32 160, ; 586
	i32 164, ; 587
	i32 262, ; 588
	i32 38, ; 589
	i32 199, ; 590
	i32 342, ; 591
	i32 17, ; 592
	i32 168, ; 593
	i32 343, ; 594
	i32 216, ; 595
	i32 147, ; 596
	i32 250, ; 597
	i32 152, ; 598
	i32 129, ; 599
	i32 19, ; 600
	i32 64, ; 601
	i32 144, ; 602
	i32 46, ; 603
	i32 351, ; 604
	i32 353, ; 605
	i32 235, ; 606
	i32 78, ; 607
	i32 60, ; 608
	i32 105, ; 609
	i32 287, ; 610
	i32 239, ; 611
	i32 48, ; 612
	i32 272, ; 613
	i32 348, ; 614
	i32 284, ; 615
	i32 14, ; 616
	i32 190, ; 617
	i32 67, ; 618
	i32 207, ; 619
	i32 168, ; 620
	i32 245, ; 621
	i32 250, ; 622
	i32 77, ; 623
	i32 255, ; 624
	i32 107, ; 625
	i32 238, ; 626
	i32 0, ; 627
	i32 283, ; 628
	i32 66, ; 629
	i32 62, ; 630
	i32 212, ; 631
	i32 157, ; 632
	i32 323, ; 633
	i32 211, ; 634
	i32 0, ; 635
	i32 247, ; 636
	i32 10, ; 637
	i32 199, ; 638
	i32 11, ; 639
	i32 173, ; 640
	i32 77, ; 641
	i32 282, ; 642
	i32 125, ; 643
	i32 82, ; 644
	i32 192, ; 645
	i32 65, ; 646
	i32 106, ; 647
	i32 64, ; 648
	i32 127, ; 649
	i32 121, ; 650
	i32 76, ; 651
	i32 298, ; 652
	i32 288, ; 653
	i32 8, ; 654
	i32 254, ; 655
	i32 2, ; 656
	i32 248, ; 657
	i32 339, ; 658
	i32 43, ; 659
	i32 301, ; 660
	i32 153, ; 661
	i32 127, ; 662
	i32 286, ; 663
	i32 23, ; 664
	i32 132, ; 665
	i32 241, ; 666
	i32 274, ; 667
	i32 28, ; 668
	i32 240, ; 669
	i32 214, ; 670
	i32 61, ; 671
	i32 201, ; 672
	i32 89, ; 673
	i32 86, ; 674
	i32 145, ; 675
	i32 325, ; 676
	i32 203, ; 677
	i32 35, ; 678
	i32 85, ; 679
	i32 263, ; 680
	i32 188, ; 681
	i32 349, ; 682
	i32 191, ; 683
	i32 49, ; 684
	i32 6, ; 685
	i32 170, ; 686
	i32 89, ; 687
	i32 349, ; 688
	i32 21, ; 689
	i32 159, ; 690
	i32 95, ; 691
	i32 49, ; 692
	i32 229, ; 693
	i32 112, ; 694
	i32 279, ; 695
	i32 129, ; 696
	i32 220, ; 697
	i32 75, ; 698
	i32 212, ; 699
	i32 171, ; 700
	i32 338, ; 701
	i32 255, ; 702
	i32 278, ; 703
	i32 7, ; 704
	i32 200, ; 705
	i32 176, ; 706
	i32 109, ; 707
	i32 279, ; 708
	i32 265 ; 709
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

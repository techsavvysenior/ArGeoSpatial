/*
 * Copyright 2022 Google LLC. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#import <Foundation/Foundation.h>

#import <ARCoreGARSession/GARFrame.h>
#import <ARCoreGeospatial/GAREarth.h>
#import <ARCoreGeospatial/GARStreetscapeGeometry.h>

NS_ASSUME_NONNULL_BEGIN

/** Category adding Geospatial functionality to `GARFrame`. */
@interface GARFrame (Geospatial)

/**
 * Snapshot of the `GAREarth` state for this frame. This will be nil if
 * `GARSessionConfiguration.geospatialMode` is disabled.
 */
@property(nonatomic, readonly, nullable) GAREarth *earth;

/**
 * List of snapshots of `GARStreetscapeGeometry` for this frame.
 * See the
 * <a href="https://developers.google.com/ar/develop/ios/geospatial/streetscape-geometry">Streetscape
 * Geometry Developer Guide</a> for additional information.
 *
 * This will be `nil` if `GARSessionConfiguration.streetscapeGeometryMode` is disabled.
 */
@property(nonatomic, readonly, nullable) NSArray<GARStreetscapeGeometry *> *streetscapeGeometries;

@end

NS_ASSUME_NONNULL_END

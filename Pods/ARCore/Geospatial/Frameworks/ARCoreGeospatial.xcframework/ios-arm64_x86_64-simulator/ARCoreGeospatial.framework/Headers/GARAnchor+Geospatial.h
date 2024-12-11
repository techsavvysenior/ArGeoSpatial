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

#import <ARCoreGARSession/GARAnchor.h>
#import <ARCoreGeospatial/GARTerrainAnchorState.h>

NS_ASSUME_NONNULL_BEGIN

/** Category adding Geospatial Anchor functionality to `GARAnchor`. */
__attribute__((deprecated("The properties in this category are not used with async APIs.")))
@interface GARAnchor (Geospatial)

/**
 * The Terrain anchor state, if applicable. Indicates the state of the resolving operation
 * on this anchor, if any.
 */
@property(nonatomic, readonly) GARTerrainAnchorState terrainState
    __attribute__((deprecated("When resolving an anchor using an async method, get the result "
                              "status from the callback or future object instead.")));

@end

NS_ASSUME_NONNULL_END

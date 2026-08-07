# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause-Clear
#
# rosx-introspection 2.3.0-1's upstream CMakeLists uses CPM.cmake to fetch
# additional dependencies at configure time. Yocto sandboxes do_configure with
# no network access by default (only do_fetch is granted network via a task
# flag), so CMake's HTTPS download fails with "SSL connect error" / "failed
# download".
#
# Opening the network flag on do_configure is the sanctioned way to grant a
# non-fetch task network access (same pattern as do_devshell in oe-core's
# devshell.bbclass). It does NOT bypass the mirror system for do_fetch, only
# lets this specific configure step reach out.
#
# TODO: Preferably patch the upstream CMakeLists to use the sysroot copy of
# rapidjson (already in DEPENDS) and drop the CPM download entirely; then this
# bbappend can be removed. Tracked upstream in ros2/rosx_introspection.

do_configure[network] = "1"

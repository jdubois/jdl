/** 
 * Copyright (c) 2015-2021 Arcware GmbH (http://arcware.io) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 */
package ch.itemis.xdocker.ui.console

/** 
 * Interface for Console Logger
 * 
 * @author Serano Colameo - Initial contribution and API
 */
interface IConsoleLogger {
	def void log(String message)
	def void log(String message, boolean newLine)
	def void progressBar(boolean start)
	def void clearConsole()
}

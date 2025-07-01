from rich.console import Console
from pyfiglet import figlet_format

console = Console()
ascii_banner = figlet_format("RTX SETUP")

console.print(f"[bold cyan]{ascii_banner}[/bold cyan]")
console.print("[bold blue]Tool by Rtxconfigz Team[/bold blue]")
console.print("[green]SYSTEM SETUP STARTING...[/green]\n")

console.print("[yellow]🔍 Scanning processes...[/yellow]")
console.print("[yellow]🔍 Scanning candidates...[/yellow]")
console.print("[yellow]🔍 Scanning linux images...[/yellow]")

console.print("\n[bold red]⚠️ WARNING:[/bold red] apt does not have a stable CLI interface.")
console.print("[red]❌ ERROR:[/red] Could not open requirements file: [Errno 2] No such file or directory: 'requirements.txt'\n")
